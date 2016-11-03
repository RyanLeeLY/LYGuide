# LYIntroduction
LYIntroduction is an iOS class group that you can easily add Introduction Tutorial to your App or hint something important on the screen.

## Easy to use
```obj-c
   [[LYGuide guideWithText:@"Test" target:self.button1.ly_absolute_frame handler:^(LYGuide *guide, BOOL onHint) {
        if(onHint){
            [guide dismiss];  //Dissmiss the introduction tutorial
            NSLog(@"Tap on hint");
        }else{
            NSLog(@"Not Tap on hint");
        }
    }] show];
```
* You just need to complete the callback block (Be called when touch-up event happened) and show it.

## More Introduction Tutorial
```obj-c
	LYGuide *g1 = [LYGuide guideWithText:@"Test1" target:self.button2.ly_absolute_frame handler:^(LYGuide *guide, BOOL onHint) {
        if(onHint){
            [guide dismiss];  //Dissmiss the introduction tutorial
            NSLog(@"Tap on hint");
        }else{
            NSLog(@"Not Tap on hint");
        }
    }];
    
    LYGuide *g2 = [LYGuide guideWithText:@"Test2" target:self.button2.ly_absolute_frame handler:^(LYGuide *guide, BOOL onHint) {
        if(onHint){
            [guide dismiss];  //Dissmiss the introduction tutorial
            NSLog(@"Tap on hint");
        }else{
            NSLog(@"Not Tap on hint");
        }
    }];

    [LYGuide registerGuides:[NSArray arrayWithObjects:g1,g2,nil] from:self completion:nil];
    
    [LYGuide showNextFrom:self];
```

## Customized Appearance
```obj-c
/* Set property to customize your introduction tutorial && Each property has default value.
So it's OK if don't set any property.
*/
    [[LYGuide defaultConfig] setBorderColor:[UIColor redColor]];
    [[LYGuide defaultConfig] setCornerRadius:20.f];
    [[LYGuide defaultConfig] setBorderScale:1.8f];
```
***
## Demo
![image](https://github.com/RyanLeeLY/LYIntroduction/blob/master/0.png)
#### LYIntroduction View(效果展示)
![image](https://github.com/RyanLeeLY/LYIntroduction/blob/master/1.png)
<br>
![image](https://github.com/RyanLeeLY/LYIntroduction/blob/master/gif0.gif)
#### Self-adaptaion（自适应）
![image](https://github.com/RyanLeeLY/LYIntroduction/blob/master/4.png)