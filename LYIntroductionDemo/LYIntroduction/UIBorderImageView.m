//
//  UIBorderImageView.m
//  LYIntroductionDemo
//
//  Created by 李尧 on 2016/10/30.
//  Copyright © 2016年 ryanleely. All rights reserved.
//

#import "UIBorderImageView.h"
@interface UIBorderImageView()

@property (strong,nonatomic) CAShapeLayer *dashBorder;

@end

@implementation UIBorderImageView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)setDashLineBorderWithColor:(UIColor *)color{
    [self.dashBorder removeFromSuperlayer];
    self.dashBorder.strokeColor = [color CGColor];
    self.dashBorder.fillColor = nil;
    self.dashBorder.path = [UIBezierPath bezierPathWithRect:self.bounds].CGPath;
    self.dashBorder.frame = self.bounds;
    self.dashBorder.lineWidth = 1.f;
    self.dashBorder.lineCap = @"square";
    self.dashBorder.lineDashPattern = @[@2, @4];
    
    self.dashBorder.cornerRadius = 50.f;
    [self.layer addSublayer:self.dashBorder];
}

- (CAShapeLayer *)dashBorder{
    if(_dashBorder == nil){
        _dashBorder = [CAShapeLayer layer];
    }
    return _dashBorder;
}


@end
