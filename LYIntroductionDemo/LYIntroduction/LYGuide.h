//
//  LYGuide.h
//  LYGuide
//
//  Created by Yunpeng on 2016/10/31.
//  Copyright © 2016年 Yunpeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LYGuideConfig.h"
@class LYGuide;
typedef void (^LYGuideHandler)(LYGuide  *guide, BOOL onHint);
typedef void (^LYGuidesCompletionBlock)(BOOL isCanceled);

@interface LYGuide : UIView
@property (nonatomic, assign, getter=isDisplayed, readonly) BOOL displayed;
//@property (nonatomic, assign) NSInteger priority;

//@property (nonatomic, assign) BOOL onceOnly; // default YES
@property (nonatomic, assign)  BOOL intercepted;
@property (nonatomic, assign, getter=isAnimated) BOOL animated;
@property (nonatomic, assign) CGFloat borderScale;
@property (nonatomic, assign) CGFloat cornerRadius;
@property (nonatomic, retain) UIColor *borderColor;
@property (nonatomic, retain) UIColor *hintColor;
@property (nonatomic, retain) UIColor *baseBackgroundColor;
@property (nonatomic, retain) UIFont *font;
@property (nonatomic, retain) UIColor *textColor;

+ (instancetype)guideWithText:(NSString *)text
                       target:(CGRect)rect
                      handler:(LYGuideHandler)block;

+ (void)registerGuides:(NSArray <LYGuide *>*)guides
                  from:(id)obj
            completion:(LYGuidesCompletionBlock)block;

+ (LYGuideConfig *)defaultConfig;

+ (void)showNextFrom:(id)obj;

- (void)show;

- (void)dismiss;

//- (void)showWithPriority:(NSInteger)priority;
@end


@interface UIView (LYGuide)
@property (nonatomic,readonly) CGRect ly_absolute_frame;
//- (void)ly_showGuideWithText:(NSString *)text handler:(LYGuideHandler)block;
@end


