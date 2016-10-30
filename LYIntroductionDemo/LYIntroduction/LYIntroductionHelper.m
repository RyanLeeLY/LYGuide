//
//  LYIntroductionHelper.m
//  LYIntroductionDemo
//
//  Created by 李尧 on 2016/10/29.
//  Copyright © 2016年 ryanleely. All rights reserved.
//
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)

#import "LYIntroductionHelper.h"
#import "LYIntroductionView.h"

@interface LYIntroductionHelper()<LYIntroductionDelegate>{
    void (^tapOnHint)(BOOL);
}
@property (strong, nonatomic) LYIntroductionView *introductionView;

@end

@implementation LYIntroductionHelper

@synthesize baseBackgroundColor = _baseBackgroundColor;
static const CGFloat defaultHintBorderScale = 1.3f;
static const CGFloat defaultHintCornerRadius = 10.f;

static LYIntroductionHelper *defaultHelper = nil;
+(LYIntroductionHelper *) shared{
    static dispatch_once_t token;
    dispatch_once(&token,^{
        if(defaultHelper == nil){
            defaultHelper = [[LYIntroductionHelper alloc]init];
        }
    } );
    return defaultHelper;
}

- (void)addHintViewWithPositionX:(CGFloat)x Y:(CGFloat)y widthRatio:(CGFloat)wRatio heightRatio:(CGFloat)hRatio hintText:(NSString*)text showNow:(BOOL)showNow tapOnHint:(void (^)(BOOL))tapBlock {
    [self.introductionView removeFromSuperview];
    CGRect newRect = CGRectMake(SCREEN_WIDTH*x, SCREEN_HEIGHT*y, SCREEN_WIDTH*wRatio, SCREEN_HEIGHT*hRatio);
    CGRect newScaleRect = CGRectInset(newRect, -(self.hintBorderScale-1.0f)*newRect.size.width, -(self.hintBorderScale-1.0f)*newRect.size.height);
    [self.introductionView hintViewUpdateWithFrame:newScaleRect borderColor:self.hintBorderColor backgroundColor:self.hintBackgroundColor cornerRadius:self.hintCornerRadius text:text];
    tapOnHint = tapBlock;
    if(showNow){
        [self showIntroduction];
    }
}

- (void)addHintViewWithTargetView:(UIView*)view hintText:(NSString*)text showNow:(BOOL)showNow tapOnHint:(void (^)(BOOL))tapBlock{
    [self.introductionView removeFromSuperview];
    CGRect newRect = [view convertRect:view.bounds toView:self.introductionView];
    CGRect newScaleRect = CGRectInset(newRect, -(self.hintBorderScale-1.0f)*newRect.size.width, -(self.hintBorderScale-1.0f)*newRect.size.height);
    [self.introductionView hintViewUpdateWithFrame:newScaleRect borderColor:self.hintBorderColor backgroundColor:self.hintBackgroundColor cornerRadius:self.hintCornerRadius text:text];
    tapOnHint = tapBlock;
    if(showNow){
        [self showIntroduction];
    }
}

- (void)showIntroduction {
    [[self getCurrentVC].view addSubview:self.introductionView];
}

- (void)dismissIntroduction {
    [self.introductionView removeFromSuperview];
}

- (void)reset {
    tapOnHint = nil;
    [self.introductionView removeFromSuperview];
    self.introductionView = nil;
}

+(id)allocWithZone:(struct _NSZone *)zone{
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        if(defaultHelper == nil){
            defaultHelper = [super allocWithZone:zone];
        }
    });
    return defaultHelper;
}

- (instancetype)init{
    self = [super init];
    if(self){
        self.introductionView.delegate = defaultHelper;
        _hintBorderScale = defaultHintBorderScale;
        _hintCornerRadius = defaultHintCornerRadius;
    }
    return self;
}

- (id)copy{
    return self;
}

- (id)mutableCopy{
    return self;
}

#pragma getter && setter
- (LYIntroductionView *)introductionView{
    if(_introductionView == nil){
        _introductionView = [[LYIntroductionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _introductionView.baseBackgroundColor = self.baseBackgroundColor;
    }
    return _introductionView;
}

- (CGFloat)hintBorderScale{
    if(_hintBorderScale < 0){
        _hintBorderScale = defaultHintBorderScale;
    }
    return _hintBorderScale;
}

- (CGFloat)hintCornerRadius{
    if(_hintCornerRadius < 0){
        _hintCornerRadius = defaultHintCornerRadius;
    }
    return _hintCornerRadius;
}

- (UIColor *)hintBorderColor{
    if(_hintBorderColor == nil){
        _hintBorderColor = RGB(35, 173, 229);
    }
    return _hintBorderColor;
}

- (UIColor *)hintBackgroundColor{
    if(_hintBackgroundColor == nil){
        _hintBackgroundColor = RGBA(35, 173, 229, 0.2);
    }
    return _hintBackgroundColor;
}

- (UIColor *)baseBackgroundColor{
    if(_baseBackgroundColor == nil){
        _baseBackgroundColor = RGBA(169,169,169,0.5);
    }
    return _baseBackgroundColor;
}

- (void)setBaseBackgroundColor:(UIColor *)newBaseBackgroundColor{
    _introductionView.baseBackgroundColor = newBaseBackgroundColor;
}

#pragma LYIntroductionDelegate
- (void) tapEventOnHintView:(BOOL)onHintView{
    tapOnHint(onHintView);
}

#pragma utils
//获取当前屏幕显示的viewcontroller
- (UIViewController *)getCurrentVC{
    UIViewController *result = nil;
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal){
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows){
            if (tmpWin.windowLevel == UIWindowLevelNormal){
                window = tmpWin;
                break;
            }
        }
    }
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    if ([nextResponder isKindOfClass:[UIViewController class]]){
        result = nextResponder;
    }else{
        result = window.rootViewController;
    }
    return result;
}

@end
