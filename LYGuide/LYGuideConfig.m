//
//  LYGuideManager.m
//  LYIntroductionDemo
//
//  Created by 李尧 on 2016/10/31.
//  Copyright © 2016年 ryanleely. All rights reserved.
//
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)

#import "LYGuideConfig.h"

@interface LYGuideConfig()

@end

@implementation LYGuideConfig
static CGFloat const kDefaultHintBorderScale = 1.3f;
static CGFloat const kDefaultHintCornerRadius = 10.f;
static BOOL const kDefaultAnimated = YES;
static BOOL const kDefaultIntercepted = YES;
static NSInteger const kDefaultRepeatCount = 1;

static LYGuideConfig *defaultConfig = nil;
+ (LYGuideConfig *)shared{
    static dispatch_once_t token;
    dispatch_once(&token,^{
        if(defaultConfig == nil){
            defaultConfig = [[LYGuideConfig alloc] init];
            defaultConfig.animated = kDefaultAnimated;
            defaultConfig.intercepted = kDefaultIntercepted;
            defaultConfig.borderScale = CGSizeMake(kDefaultHintBorderScale, kDefaultHintBorderScale);
            defaultConfig.cornerRadius = kDefaultHintCornerRadius;
            defaultConfig.repeatCount = kDefaultRepeatCount;
        }
    } );
    return defaultConfig;
}

- (CGSize)borderScale {
    if(CGSizeEqualToSize(_borderScale, CGSizeZero)){
        _borderScale = CGSizeMake(kDefaultHintBorderScale, kDefaultHintBorderScale);
    }
    return _borderScale;
}

- (CGFloat)cornerRadius {
    if(_cornerRadius <= 0){
        _cornerRadius = kDefaultHintCornerRadius;
    }
    return _cornerRadius;
}

- (UIColor *)borderColor {
    if(_borderColor == nil){
        _borderColor = RGB(35, 173, 229);
    }
    return _borderColor;
}

- (UIColor *)hintColor {
    if(_hintColor == nil){
        _hintColor = [UIColor clearColor];
    }
    return _hintColor;
}

- (UIColor *)baseBackgroundColor {
    if(_baseBackgroundColor == nil){
        _baseBackgroundColor = RGBA(0,0,0,0.3);
    }
    return _baseBackgroundColor;
}

- (UIFont *)font {
    if(_font == nil){
        _font = [UIFont systemFontOfSize:17];
    }
    return _font;
}

- (UIColor *)textColor {
    if(_textColor == nil){
        _textColor = [UIColor whiteColor];
    }
    return _textColor;
}

- (NSInteger)repeatCount {
    if (_repeatCount < 0) {
        _repeatCount = 0;
    }
    return _repeatCount;
}

@end
