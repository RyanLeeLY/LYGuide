//
//  LYIntroductionView.m
//  LYIntroductionDemo
//
//  Created by 李尧 on 2016/10/29.
//  Copyright © 2016年 ryanleely. All rights reserved.
//

#import "LYIntroductionView.h"
#import "UIBorderImageView.h"

#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)

@interface LYIntroductionView()

@property (strong, nonatomic) UIView *backgroundView;
@property (strong, nonatomic) UIBorderImageView *hintView;

@end

@implementation LYIntroductionView

@synthesize baseBackgroundColor = _baseBackgroundColor;

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.backgroundView];
    }
    return self;
}

- (void)hintViewUpdateWithFrame:(CGRect)frame borderColor:(UIColor*)bColor backgroundColor:(UIColor*)bgColor cornerRadius:(CGFloat)cornerRadius text:(NSString*)text {
    [[self.hintView.layer.sublayers lastObject]removeFromSuperlayer];
    self.hintView.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
    [self.hintView setDashLineBorderWithColor:bColor background:bgColor cornerRadius:cornerRadius];
    [self addSubview:self.hintView];
    
    if(text != nil){
        self.hintLabel.text = text;
        self.hintLabel.frame = [self calculateHintLabelFrameWithHintViewFrame:self.hintView.frame];
        [self addSubview:_hintLabel];
    }
//    [self.introductionView setImage:[UIImage imageNamed:@""]];
}

- (void)tapOnHintView{
    [self.delegate tapEventOnHintView:true];
}

- (void)tapNotOnHintView{
    [self.delegate tapEventOnHintView:false];
}

- (CGRect)calculateHintLabelFrameWithHintViewFrame:(CGRect)hvFrame{
    // Calculate the size according to the label's font, text, style...
    NSMutableParagraphStyle *paragraphstyle=[[NSMutableParagraphStyle alloc]init];
    paragraphstyle.lineBreakMode=NSLineBreakByWordWrapping;
    NSDictionary *dic=@{NSFontAttributeName:self.hintLabel.font,NSParagraphStyleAttributeName:paragraphstyle.copy};
//    NSDictionary *dic=@{NSFontAttributeName:self.hintLabel.font};
    CGRect rect=[self.hintLabel.text boundingRectWithSize:CGSizeMake(self.frame.size.width, self.frame.size.height) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
    
    // Calculat the position according to the hintViewFrame.
    CGPoint point = CGPointZero;
    if(hvFrame.origin.y+(hvFrame.size.height/2) < self.frame.size.height/2){
        // Text is under the hintView
        point = CGPointMake((self.frame.size.width - rect.size.width)/2, hvFrame.origin.y + hvFrame.size.height+10);
    }else{
        // Text is above the hintView
        point = CGPointMake((self.frame.size.width - rect.size.width)/2, hvFrame.origin.y - rect.size.height-10);
    }
    return CGRectMake(point.x, point.y, rect.size.width, rect.size.height);
}

#pragma getter && setter
- (UIColor *)baseBackgroundColor{
    if(_baseBackgroundColor == nil){
        _baseBackgroundColor = [UIColor clearColor];
    }
    return _baseBackgroundColor;
}

- (void)setBaseBackgroundColor:(UIColor *)newBaseBackgroundColor{
    _baseBackgroundColor = newBaseBackgroundColor;
    self.backgroundView.backgroundColor = newBaseBackgroundColor;
}

- (UIView *)backgroundView {
    if(_backgroundView == nil){
        _backgroundView = [[UIView alloc] initWithFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, self.frame.size.height)];
        _backgroundView.backgroundColor = self.backgroundColor;
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

- (UILabel *)hintLabel{
    if(_hintLabel == nil){
        _hintLabel = [[UILabel alloc] init];
        _hintLabel.adjustsFontSizeToFitWidth = YES;
        [_hintLabel setNumberOfLines:0];
    }
    return _hintLabel;
}

@end
