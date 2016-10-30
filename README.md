# LYIntroduction
LYIntroduction is an iOS class group that you can easily add Introduction Tutorial to your App or hint something important on the screen.
***
## Usage
```obj-c
    /* Set property to customize your introduction tutorial && Each property has default value.So it's OK if don't set any property.
     */
//    [LYIntroductionHelper shared].hintBorderScale = 1.5f;
//    [LYIntroductionHelper shared].hintCornerRadius = 20.f;
//    [LYIntroductionHelper shared].hintBackgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.2];
//    [LYIntroductionHelper shared].hintBorderColor = [UIColor redColor];
//    [LYIntroductionHelper shared].baseBackgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.4];
//    [LYIntroductionHelper shared].isAnimated = NO;
    
    // Set the hint's position and the tap-Event callback block.
    void (^hintHandler)(BOOL) = ^(BOOL onHint){
        if(onHint){
            [[LYIntroductionHelper shared] dismissIntroduction]; //Dissmiss the introduction tutorial
            NSLog(@"Tap on hint");
        }else{
            NSLog(@"Not Tap on hint");
        }
        
    };
    [[LYIntroductionHelper shared] addHintViewWithTargetView:self.button1 hintText:@"This is an introduction tutorial by LYInrtoduction. Please tap the button." showNow:YES tapOnHint:hintHandler];
    
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
```

## Demo
![image](https://github.com/RyanLeeLY/LYIntroduction/blob/master/DemoScreenShot.png)