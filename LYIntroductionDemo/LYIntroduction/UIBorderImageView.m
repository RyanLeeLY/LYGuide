//
//  UIBorderImageView.m
//  LYIntroductionDemo
//
//  Created by 李尧 on 2016/10/30.
//  Copyright © 2016年 ryanleely. All rights reserved.
//

#import "UIBorderImageView.h"

static const CGFloat lineWidth = 2.f;

@interface UIBorderImageView()

@end

@implementation UIBorderImageView

- (void)setDashLineBorderWithColor:(UIColor *)color background:(UIColor *)bgColor cornerRadius:(CGFloat)cornerRadius{
    [self.dashBorder removeFromSuperlayer];
    self.dashBorder.strokeColor = [color CGColor];
    self.dashBorder.fillColor = [bgColor CGColor];
    self.dashBorder.path = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:cornerRadius].CGPath;
    self.dashBorder.frame = self.bounds;
    self.dashBorder.lineWidth = lineWidth;
    self.dashBorder.lineCap = kCALineCapRound;
    self.dashBorder.lineDashPattern = @[@4, @6.5];
    [self.layer addSublayer:self.dashBorder];
}

- (CAShapeLayer *)dashBorder{
    if(_dashBorder == nil){
        _dashBorder = [CAShapeLayer layer];
    }
    return _dashBorder;
}


@end
