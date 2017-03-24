//
//  LYGuide.h
//  LYGuide
//
//  Created by Yunpeng on 2016/10/31.
//  Copyright © 2016年 Yunpeng. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LYGuideConfig;
@class LYGuide;
typedef void (^LYGuideHandler)(LYGuide *guide, BOOL onHint);
typedef void (^LYGuidesCompletionBlock)(BOOL isCanceled);

@interface LYGuide : UIView
@property (nonatomic, assign, getter=isDisplayed) BOOL displayed;

//@property (nonatomic, assign) BOOL onceOnly; // default YES
@property (nonatomic, assign)  BOOL intercepted;
@property (nonatomic, assign, getter=isAnimated) BOOL animated;
@property (nonatomic, assign) CGSize borderScale;
@property (nonatomic, assign) CGFloat cornerRadius;
@property (nonatomic, strong) UIColor *borderColor;
@property (nonatomic, strong) UIColor *hintColor;
@property (nonatomic, strong) UIColor *baseBackgroundColor;
@property (nonatomic, strong) UIFont *font;
@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, copy) NSString *text;
@property (nonatomic, assign) NSInteger repeatCount;
@property (nonatomic, assign, readonly) NSInteger currentRepeatCount;

+ (instancetype)guideWithText:(NSString *)text
                       target:(CGRect)rect
                      handler:(LYGuideHandler)block;

+ (void)registerGuides:(NSArray <LYGuide *>*)guides
                  target:(Class)cls
            completion:(LYGuidesCompletionBlock)block;

+ (LYGuideConfig *)defaultConfig;

+ (void)showNextFrom:(Class)cls;

- (void)show;

- (void)dismiss;

//- (void)showWithPriority:(NSInteger)priority;
@end

@interface UITableView (LYGuide)

- (UIView *)lyg_getCellFrom:(NSIndexPath *)indexPath;
@end

@interface UIView (LYGuide)

@property (nonatomic,readonly) CGRect lyg_absoluteFrame;
@end





