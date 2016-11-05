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


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.backgroundView];
    }
    return self;
}

- (void)hintViewUpdateWithFrame:(CGRect)frame
                    borderColor:(UIColor *)bColor
                      hintColor:(UIColor *)hColor
            baseBackgroundColor:(UIColor *)bbgcolor
                   cornerRadius:(CGFloat)cornerRadius
                           text:(NSString *)text
                      textColor:(UIColor *)tColor
{
    [[self.hintView.layer.sublayers lastObject]removeFromSuperlayer];
    self.hintView.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
    [self.hintView setDashLineBorderWithColor:bColor background:hColor cornerRadius:cornerRadius];
    self.backgroundView.backgroundColor = bbgcolor;
    
    // Caculate the mask
    CGRect noMaskRect = CGRectInset(frame, frame.size.width*0.05, frame.size.height*0.05);
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:self.frame];
    [path appendPath:[[UIBezierPath bezierPathWithRoundedRect:noMaskRect cornerRadius:cornerRadius] bezierPathByReversingPath]];
    CAShapeLayer *mask = [CAShapeLayer layer];
    mask.path = path.CGPath;
    
    [self.backgroundView.layer setMask:mask];
    [self addSubview:self.hintView];
    
    if(text != nil){
        self.hintLabel.text = text;
        self.hintLabel.textColor = tColor;
        self.hintLabel.frame = [self calculateHintLabelFrameWithHintViewFrame:self.hintView.frame];
        [self addSubview:_hintLabel];
    }
//    [self.introductionView setImage:[UIImage imageNamed:@""]];
}

- (void)tapOnHintView {
    [self.delegate tapEventOnHintView:true];
}

- (void)tapNotOnHintView {
    [self.delegate tapEventOnHintView:false];
}

- (CGRect)calculateHintLabelFrameWithHintViewFrame:(CGRect)hvFrame {
    // Calculate the size according to the label's font, text, style...
    NSMutableParagraphStyle *paragraphstyle=[[NSMutableParagraphStyle alloc]init];
    paragraphstyle.lineBreakMode=NSLineBreakByWordWrapping;
    NSDictionary *dic=@{NSFontAttributeName:self.hintLabel.font,NSParagraphStyleAttributeName:paragraphstyle.copy};
//    NSDictionary *dic=@{NSFontAttributeName:self.hintLabel.font};
    
    CGFloat maxWidth, maxHeight;
    if(hvFrame.origin.y+(hvFrame.size.height/2) < self.frame.size.height/2){
        // Text is under the hintView
        maxHeight = self.frame.size.height - (hvFrame.origin.y + hvFrame.size.height);
    }else{
        // Text is above the hintView
        maxHeight = hvFrame.origin.y;
    }
    if(hvFrame.origin.x+(hvFrame.size.width/2) < self.frame.size.width/2){
        // Text's leading = hintView's leading
        maxWidth = self.frame.size.width - hvFrame.origin.x;
    }else{
        // Text's leading = hintView's Tailing
        maxWidth = hvFrame.origin.x + hvFrame.size.width;
    }
    CGRect rect=[self.hintLabel.text boundingRectWithSize:CGSizeMake(maxWidth*0.9, maxHeight-(hvFrame.size.height*0.2)*0.9) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
    
    // Calculat the position according to the hintViewFrame.
    CGPoint point = CGPointZero;
    if(hvFrame.origin.y+(hvFrame.size.height/2) < self.frame.size.height/2){
        // Text is under the hintView
        point.y = hvFrame.origin.y + hvFrame.size.height*1.2;
    }else{
        // Text is above the hintView
        point.y = hvFrame.origin.y - rect.size.height*1.2;
    }
    if(hvFrame.origin.x+(hvFrame.size.width/2) < self.frame.size.width/2){
        // Text's leading = hintView's leading
        point.x = hvFrame.origin.x;
    }else{
        point.x = hvFrame.origin.x - (rect.size.width - hvFrame.size.width);
    }
    return CGRectMake(point.x, point.y, rect.size.width, rect.size.height);
}

#pragma getter && setter

- (UIView *)backgroundView {
    if(_backgroundView == nil){
        _backgroundView = [[UIView alloc] initWithFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, self.frame.size.height)];
        _backgroundView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapNotOnHintView)];
        [_backgroundView addGestureRecognizer:tapGesture];
    }
    return _backgroundView;
}

- (UIImageView *)hintView {
    if(_hintView == nil){
        _hintView = [[UIBorderImageView alloc] init];
        _hintView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapOnHintView)];
        [self.hintView addGestureRecognizer:tapGesture];
    }
    return _hintView;
}

- (UILabel *)hintLabel {
    if(_hintLabel == nil){
        _hintLabel = [[UILabel alloc] init];
        _hintLabel.adjustsFontSizeToFitWidth = YES;
        [_hintLabel setNumberOfLines:0];
    }
    return _hintLabel;
}

@end
