//
//  LYIntroductionHelper.h
//  LYIntroductionDemo
//
//  Created by 李尧 on 2016/10/29.
//  Copyright © 2016年 ryanleely. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LYIntroductionView.h"

@interface LYIntroductionHelper : NSObject<LYIntroductionDelegate>
+(LYIntroductionHelper *) shared;

- (void)addHintViewWithPositionX:(CGFloat)x Y:(CGFloat)y widthRatio:(CGFloat)wRatio heightRatio:(CGFloat)hRatio showNow:(BOOL)showNow tapOnHint:(void (^)(BOOL))tapBlock;

- (void)addHintViewWithTargetView:(UIView*)view showNow:(BOOL)showNow tapOnHint:(void (^)(BOOL))tapBlock;

- (void)showIntroduction;

- (void)dismissIntroduction ;

@end
