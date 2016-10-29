//
//  LYIntroductionHelper.m
//  LYIntroductionDemo
//
//  Created by 李尧 on 2016/10/29.
//  Copyright © 2016年 ryanleely. All rights reserved.
//
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

#import "LYIntroductionHelper.h"
#import "LYIntroductionView.h"

@interface LYIntroductionHelper()<LYIntroductionDelegate>{
    void (^tapOnHint)(BOOL);
}
@property (strong, nonatomic) LYIntroductionView *introductionView;
@end

@implementation LYIntroductionHelper

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

- (void)addHintViewWithPositionX:(CGFloat)x Y:(CGFloat)y widthRatio:(CGFloat)wRatio heightRatio:(CGFloat)hRatio showNow:(BOOL)showNow tapOnHint:(void (^)(BOOL))tapBlock {
    [self.introductionView removeFromSuperview];
    [self.introductionView hintViewInitWithFrame:CGRectMake(SCREEN_WIDTH*x, SCREEN_HEIGHT*y, SCREEN_WIDTH*wRatio, SCREEN_HEIGHT*hRatio)];
    tapOnHint = tapBlock;
    if(showNow){
        [self showIntroduction];
    }
}

- (void)addHintViewWithTargetView:(UIView*)view showNow:(BOOL)showNow tapOnHint:(void (^)(BOOL))tapBlock{
    [self.introductionView removeFromSuperview];
    [self.introductionView hintViewInitWithFrame:view.frame];
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
    }
    return _introductionView;
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
