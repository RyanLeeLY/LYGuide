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
    [[LYIntroductionHelper shared]addHintViewWithPositionX:0.5 Y:0.5 widthRatio:0.1 heightRatio:0.1 showNow:YES tapOnHint:^(BOOL onHint){
        if(onHint){
            NSLog(@"Tap on hint");
        }else{
            NSLog(@"Not Tap on hint");
        }
        
    }];
    
    [[LYIntroductionHelper shared] addHintViewWithTargetView:self.button1 showNow:YES tapOnHint:^(BOOL onHint){
        if(onHint){
            NSLog(@"Tap on hint");
        }else{
            NSLog(@"Not Tap on hint");
        }
        
    }];
//    [[LYIntroductionHelper shared] dismissIntroduction];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
