//
//  LYGuideManager.h
//  LYIntroductionDemo
//
//  Created by 李尧 on 2016/10/31.
//  Copyright © 2016年 ryanleely. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LYGuideConfig : NSObject
+ (LYGuideConfig *)shared;

//@property (nonatomic, assign) BOOL onceOnly; // default YES
@property (nonatomic, assign, getter=isAnimated) BOOL animated;
@property (nonatomic, assign, getter=isIntercepted) BOOL intercepted;
@property (nonatomic, assign) CGSize borderScale;
@property (nonatomic, assign) CGFloat cornerRadius;
@property (nonatomic, strong) UIColor *borderColor;
@property (nonatomic, strong) UIColor *hintColor;
@property (nonatomic, strong) UIColor *baseBackgroundColor;
@property (nonatomic, strong) UIFont *font;
@property (nonatomic, strong) UIColor *textColor;
/// default value 1. 0 means infinite
@property (nonatomic, assign) NSInteger repeatCount;

@end
