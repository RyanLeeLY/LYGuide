//
//  LYIntroductionHelper.h
//  LYIntroductionDemo
//
//  Created by 李尧 on 2016/10/29.
//  Copyright © 2016年 ryanleely. All rights reserved.
//

/**
 Default value:
 hintBorderScale = 1.3;
 hintCornerRadius = 10.0;
 hintBorderColor = RGB(35,173,229,1);
 hintBackgroundColor = RGB(35,173,229,0.3);
 */


#import <UIKit/UIKit.h>
#import "LYIntroductionView.h"

@interface LYIntroductionHelper : NSObject<LYIntroductionDelegate>
+(LYIntroductionHelper *) shared;

- (void)addHintViewWithPositionX:(CGFloat)x Y:(CGFloat)y widthRatio:(CGFloat)wRatio heightRatio:(CGFloat)hRatio hintText:(NSString*)text showNow:(BOOL)showNow tapOnHint:(void (^)(BOOL))tapBlock;

- (void)addHintViewWithTargetView:(UIView*)view hintText:(NSString*)text showNow:(BOOL)showNow tapOnHint:(void (^)(BOOL))tapBlock;

- (void)showIntroduction;

- (void)dismissIntroduction;

@property (nonatomic, assign) CGFloat hintBorderScale;
@property (nonatomic, assign) CGFloat hintCornerRadius;
@property (strong, nonatomic) UIColor *hintBorderColor;
@property (strong, nonatomic) UIColor *hintBackgroundColor;
@property (strong, nonatomic) UIColor *baseBackgroundColor;
@property (nonatomic, assign) BOOL isAnimated;


@end
