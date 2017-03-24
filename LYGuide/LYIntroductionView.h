//
//  LYIntroductionView.h
//  LYIntroductionDemo
//
//  Created by big god on 2016/10/29.
//  Copyright © 2016年 ryanleely. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LYIntroductionView;
@protocol LYIntroductionDelegate <NSObject>

- (void) tapEventOnHintView:(BOOL)onHintView;

@end

@interface LYIntroductionView : UIView

@property (nonatomic, weak) id<LYIntroductionDelegate> delegate;

- (void)hintViewUpdateWithFrame:(CGRect)frame
                    borderColor:(UIColor *)bColor
                      hintColor:(UIColor *)hColor
            baseBackgroundColor:(UIColor *)bbgcolor
                   cornerRadius:(CGFloat)cornerRadius
                           text:(NSString *)text
                      textColor:(UIColor *)tColor;

@property (strong, nonatomic) UILabel *hintLabel;

@end
