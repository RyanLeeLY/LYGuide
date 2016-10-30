//
//  ViewController.m
//  LYIntroductionDemo
//
//  Created by 李尧 on 2016/10/29.
//  Copyright © 2016年 ryanleely. All rights reserved.
//

#import "ViewController.h"
#import "LYIntroductionHelper.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIButton *button1;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated{
        [self useLYIntroduction];
}
- (IBAction)buttonPressed:(UIButton *)sender {
    [self useLYIntroduction];
}

- (void)useLYIntroduction{
    /* Set property to customize your introduction tutorial && Each property has default value.So it's OK if don't set any property.
     */
//    [LYIntroductionHelper shared].hintBorderScale = 1.5f;
//    [LYIntroductionHelper shared].hintCornerRadius = 20.f;
//    [LYIntroductionHelper shared].hintBackgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.2];
//    [LYIntroductionHelper shared].hintBorderColor = [UIColor redColor];
//    [LYIntroductionHelper shared].baseBackgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.4];
//    [LYIntroductionHelper shared].isAnimated = NO;
    
    // Set the hint's position and the tap-Event callback block.
    [[LYIntroductionHelper shared] addHintViewWithTargetView:self.button1 hintText:@"This is an introduction tutorial by LYInrtoduction. Please tap the button." showNow:YES tapOnHint:^(BOOL onHint){
        if(onHint){
            [[LYIntroductionHelper shared] dismissIntroduction]; //Dissmiss the introduction tutorial
            NSLog(@"Tap on hint");
        }else{
            NSLog(@"Not Tap on hint");
        }
        
    }];
    
    /* Another usage
     
     [[LYIntroductionHelper shared]addHintViewWithPositionX:0.5 Y:0.5 widthRatio:0.1 heightRatio:0.1 showNow:YES tapOnHint:^(BOOL onHint){
     if(onHint){
     NSLog(@"Tap on hint");
     }else{
     NSLog(@"Not Tap on hint");
     }
     }];
     */

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
