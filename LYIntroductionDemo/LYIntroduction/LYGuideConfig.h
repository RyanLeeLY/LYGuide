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
@property (nonatomic, assign) BOOL animated;
@property (nonatomic, assign) BOOL intercepted;
@property (nonatomic, assign) CGFloat borderScale;
@property (nonatomic, assign) CGFloat cornerRadius;
@property (nonatomic, retain) UIColor *borderColor;
@property (nonatomic, retain) UIColor *hintColor;
@property (nonatomic, retain) UIColor *baseBackgroundColor;
@property (nonatomic, retain) UIFont *font;
@property (nonatomic, retain) UIColor *textColor;

@end
