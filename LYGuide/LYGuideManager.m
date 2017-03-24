//
//  LYGuideManager.m
//  LYIntroductionDemo
//
//  Created by 李尧 on 2016/11/3.
//  Copyright © 2016年 ryanleely. All rights reserved.
//

#import "LYGuideManager.h"
#import "LYGuide.h"
#import "LYGuideConfig.h"

NSString const* kLYGuidePrefix = @"com.ryanleely.LYIntroduction";
@interface LYGuideManager()

@property (strong, nonatomic) NSMutableDictionary *guidesDic;
@property (strong, nonatomic) NSMutableDictionary *guidesBlockDic;
@end


@implementation LYGuideManager

static LYGuideManager *defaultManager = nil;
+ (LYGuideManager *)shared {
    static dispatch_once_t token;
    dispatch_once(&token,^{
        if(defaultManager == nil){
            defaultManager = [[LYGuideManager alloc] init];
            defaultManager.guidesDic = [[NSMutableDictionary alloc] init];
            defaultManager.guidesBlockDic = [[NSMutableDictionary alloc] init];
        }
    } );
    return defaultManager;
}

- (BOOL)showNextFrom:(Class)cls {
    NSString *key = [kLYGuidePrefix stringByAppendingString:NSStringFromClass(cls)];
    NSArray<LYGuide *> *guides = [self.guidesDic objectForKey:key];
    for (int i = 0; i < [guides count]; i++) {
        if (i != 0) {
            if (guides[i].currentRepeatCount < guides[i-1].currentRepeatCount) {
                [guides[i] show];
                if (i == [guides count] - 1) {
                    LYGuidesCompletionBlock completion = [self.guidesBlockDic objectForKey:key];
                    completion(YES);
                }
                return YES;
            }
        } else {
            if (guides[0].currentRepeatCount == guides.lastObject.currentRepeatCount) {
                [guides[i] show];
                if (i == [guides count] - 1) {
                    LYGuidesCompletionBlock completion = [self.guidesBlockDic objectForKey:key];
                    completion(YES);
                }
                return YES;
            }
        }
    }
    return NO;
}

- (void)registerGuides:(NSArray<LYGuide *>*)guides
                  target:(Class)cls
            completion:(LYGuidesCompletionBlock)block {
    NSString *key = [kLYGuidePrefix stringByAppendingString:NSStringFromClass(cls)];
    [self.guidesDic setValue:guides forKey:key];
    [self.guidesBlockDic setValue:block forKey:key];
}
@end
