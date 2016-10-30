# LYIntroduction
LYIntroduction is an iOS class group that you can easily add Introduction Tutorial to your App or hint something important on the screen.
***
## Usage
```objective-c
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

```