//
//  LYGuide.m
//  LYIntroductionDemo
//
//  Created by 李尧 on 2016/10/31.
//  Copyright © 2016年 ryanleely. All rights reserved.
//

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

#import "LYGuide.h"
#import "LYIntroductionView.h"
#import "LYGuideManager.h"

@interface LYGuide()<LYIntroductionDelegate, UIAppearanceContainer>

@property (strong, nonatomic) LYIntroductionView *introductionView;
@property (copy, nonatomic) LYGuideHandler guideHandler;

@end
@implementation LYGuide
@synthesize baseBackgroundColor = _baseBackgroundColor;
@synthesize borderColor = _borderColor;

+ (instancetype)guideWithText:(NSString *)text
                       target:(CGRect)rect
                      handler:(LYGuideHandler)block
{
    LYGuide *instance = [[self alloc] init];
    instance.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    CGRect newScaleRect = CGRectInset(rect, -(instance.borderScale-1.0f)*rect.size.width, -(instance.borderScale-1.0f)*rect.size.height);
    instance.introductionView.hintLabel.font = instance.font;
    [instance.introductionView hintViewUpdateWithFrame:newScaleRect borderColor:instance.borderColor hintColor:instance.hintColor baseBackgroundColor:instance.baseBackgroundColor cornerRadius:instance.cornerRadius text:text textColor:instance.textColor];
    [instance addSubview:instance.introductionView];
    
    instance.guideHandler = block;
    instance.introductionView.delegate = instance;
    return instance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _borderScale = [LYGuideConfig shared].borderScale;
        _cornerRadius = [LYGuideConfig shared].cornerRadius;
        _animated = YES;
        _displayed = NO;
    }
    return self;
}

// priority won't work there.
+ (void)registerGuides:(NSArray <LYGuide *>*)guides
                  from:(id)obj
        completion:(LYGuidesCompletionBlock)block
{
    [[LYGuideManager shared] registerGuides:guides from:obj completion:block];
}

+ (void)showNextFrom:(id)obj {
    [[LYGuideManager shared] showNextFrom:obj];
}

+ (LYGuideConfig *)defaultConfig {
    return [LYGuideConfig shared];
}

- (void)show {
    if(!self.isAnimated){
        [[[[[[UIApplication sharedApplication] windows] firstObject] subviews] firstObject] addSubview:self];
    }else{
        self.alpha = 0;
        [[[[[[UIApplication sharedApplication] windows] firstObject] subviews] firstObject] addSubview:self];
        [UIView animateWithDuration:0.3 animations:^{
            self.alpha = 1;
        } completion:^(BOOL finished){
            self.alpha = 1;
        }];
    }
    _displayed = YES;
}
- (void)showWithPriority:(NSInteger)priority {
    
}

- (void)dismiss {
    if(!self.isAnimated){
        [self removeFromSuperview];
    }else{
        [UIView animateWithDuration:0.3 animations:^{
            self.alpha = 0;
        } completion:^(BOOL finished){
            [self removeFromSuperview];
        }];
    }
}


#pragma getter && setter
- (LYIntroductionView *)introductionView {
    if(_introductionView == nil){
        _introductionView = [[LYIntroductionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    }
    return _introductionView;
}

- (CGFloat)borderScale {
    if(_borderScale < 0){
        _borderScale = [LYGuideConfig shared].borderScale;
    }
    return _borderScale;
}

- (CGFloat)cornerRadius {
    if(_cornerRadius < 0){
        _cornerRadius = [LYGuideConfig shared].cornerRadius;
    }
    return _cornerRadius;
}

- (UIColor *)borderColor {
    if(_borderColor == nil){
        _borderColor = [LYGuideConfig shared].borderColor;
    }
    return _borderColor;
}

- (UIColor *)hintColor{
    if(_hintColor == nil){
        _hintColor = [LYGuideConfig shared].hintColor;
    }
    return _hintColor;
}

- (UIColor *)baseBackgroundColor{
    if(_baseBackgroundColor == nil){
        _baseBackgroundColor = [LYGuideConfig shared].baseBackgroundColor;
    }
    return _baseBackgroundColor;
}

- (UIFont *)font{
    if(_font == nil){
        _font = [LYGuideConfig shared].font;
    }
    return _font;
}

- (UIColor *)textColor{
    if(_textColor == nil){
        _textColor = [LYGuideConfig shared].textColor;
    }
    return _textColor;
}


#pragma LYIntroductionDelegate
- (void) tapEventOnHintView:(BOOL)onHintView{
    self.guideHandler(self, onHintView);
}

@end

#pragma UIView+LYGuide
@implementation UIView (LYGuide)

- (CGRect)ly_absolute_frame {
    return [self convertRect:self.bounds toView:self.window];
}
@end




