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
static const CGFloat kDefaultHintBorderScale = 1.3f;
static const CGFloat kDefaultHintCornerRadius = 10.f;

static LYGuideConfig *defaultConfig = nil;
+ (LYGuideConfig *)shared{
    static dispatch_once_t token;
    dispatch_once(&token,^{
        if(defaultConfig == nil){
            defaultConfig = [[LYGuideConfig alloc] init];
        }
    } );
    return defaultConfig;
}

- (CGFloat)borderScale {
    if(_borderScale <= 0){
        _borderScale = kDefaultHintBorderScale;
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

- (UIColor *)hintColor{
    if(_hintColor == nil){
        _hintColor = [UIColor clearColor];
    }
    return _hintColor;
}

- (UIColor *)baseBackgroundColor{
    if(_baseBackgroundColor == nil){
        _baseBackgroundColor = RGBA(0,0,0,0.3);
    }
    return _baseBackgroundColor;
}

- (UIFont *)font{
    if(_font == nil){
        _font = [UIFont systemFontOfSize:17];
    }
    return _font;
}

- (UIColor *)textColor{
    if(_textColor == nil){
        _textColor = [UIColor blackColor];
    }
    return _textColor;
}

@end
