# LYGuide
LYGuide is an iOS class group that you can easily add Introduction Tutorials to your App or hint something important on the screen. LYGuide可以轻松地为你的App添加引导说明，你可以用它引导用户去关注屏幕上的重要视图或信息。

## Easy to use（用法简单）
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

## Introduction Tutorials Group（一组引导说明）
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

    [LYGuide registerGuides:[NSArray arrayWithObjects:g1,g2,nil] target:self completion:nil]; // Resgister guides for target(ViewController).
    
    [LYGuide showNextFrom:self];
```

## Customized Appearance（可定制外观）
```obj-c
/* Set property to customize your introduction tutorial && Each property has default value.
So it's OK if don't set any property.
*/
    [[LYGuide defaultConfig] setBorderColor:[UIColor redColor]];
    [[LYGuide defaultConfig] setCornerRadius:20.f];
    [[LYGuide defaultConfig] setBorderScale:1.8f];
    // ...
```
***

## More Deatails（更多细节）
#### Event-Passthrough（事件传递）
* If you want you own views under the hint to receive the touch-events, set the value to NO. The default value is YES. That means your views can't receive any touch-events.


```obj-c
    [[LYGuide defaultConfig] setIntercepted:NO];
```

#### Animation（动画）
* If you don't want animation, set the value to NO.


```obj-c
    [[LYGuide defaultConfig] setAnimated:NO];
```

## CocoaPods
pod "LYGuide", '0.0.1'


## Demo
![image](https://github.com/RyanLeeLY/LYGuide/blob/master/0.png)
#### LYGuide View(效果展示)
![image](https://github.com/RyanLeeLY/LYGuide/blob/master/1.png)
#### Self-adaptaion（自适应）
![image](https://github.com/RyanLeeLY/LYGuide/blob/master/2.png)
