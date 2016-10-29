//
//  LYIntroductionView.m
//  LYIntroductionDemo
//
//  Created by 李尧 on 2016/10/29.
//  Copyright © 2016年 ryanleely. All rights reserved.
//

#import "LYIntroductionView.h"
#import "UIBorderImageView.h"

@interface LYIntroductionView()

@property (strong, nonatomic) UIView *backgroundView;
@property (strong, nonatomic) UIBorderImageView *hintView;

@end

@implementation LYIntroductionView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self addSubview:self.backgroundView];
    }
    return self;
}

- (void)hintViewInitWithFrame:(CGRect)frame {
    [[self.hintView.layer.sublayers lastObject]removeFromSuperlayer];
    self.hintView.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
    self.hintView.backgroundColor = [UIColor colorWithRed:1.0 green:0 blue:0 alpha:0.3];
    [self.hintView setDashLineBorderWithColor:[UIColor redColor]];
    [self addSubview:self.hintView];
//    [self.introductionView setImage:[UIImage imageNamed:@""]];
}

- (void)tapOnHintView{
    [self.delegate tapEventOnHintView:true];
}

- (void)tapNotOnHintView{
    [self.delegate tapEventOnHintView:false];
}

#pragma getter && setter
- (UIView *)backgroundView {
    if(_backgroundView == nil){
        _backgroundView = [[UIView alloc] initWithFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, self.frame.size.height)];
        _backgroundView.backgroundColor = [UIColor clearColor];
        _backgroundView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapNotOnHintView)];
        [_backgroundView addGestureRecognizer:tapGesture];
    }
    return _backgroundView;
}

- (UIImageView *)hintView{
    if(_hintView == nil){
        _hintView = [[UIBorderImageView alloc]init];
        _hintView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapOnHintView)];
        [self.hintView addGestureRecognizer:tapGesture];
    }
    return _hintView;
}

@end
