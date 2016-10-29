//
//  UIView+BorderPattern.m
//  LYIntroductionDemo
//
//  Created by 李尧 on 2016/10/30.
//  Copyright © 2016年 ryanleely. All rights reserved.
//

#import "UIView+BorderPattern.h"

@implementation UIView (BorderPattern)

- (void)setDashLineBorderWithColor:(UIColor *)color{
    CAShapeLayer *border = [CAShapeLayer layer];
    border.strokeColor = [color CGColor];
    border.fillColor = nil;
    border.path = [UIBezierPath bezierPathWithRect:self.bounds].CGPath;
    border.frame = self.bounds;
    border.lineWidth = 1.f;
    border.lineCap = kCALineCapSquare;
    border.lineDashPattern = @[@2, @4];
    
    border.cornerRadius = 5.f;
    [self.layer addSublayer:border];
}

@end
