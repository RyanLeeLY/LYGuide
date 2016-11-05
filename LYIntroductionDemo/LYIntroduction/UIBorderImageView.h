//
//  UIBorderImageView.h
//  LYIntroductionDemo
//
//  Created by 李尧 on 2016/10/30.
//  Copyright © 2016年 ryanleely. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBorderImageView : UIImageView
@property (strong,nonatomic) CAShapeLayer *dashBorder;

- (void)setDashLineBorderWithColor:(UIColor *)color background:(UIColor *)bgColor cornerRadius:(CGFloat)cornerRadius;
@end
