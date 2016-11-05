//
//  LYGuideManager.m
//  LYIntroductionDemo
//
//  Created by 李尧 on 2016/11/3.
//  Copyright © 2016年 ryanleely. All rights reserved.
//

#import "LYGuideManager.h"
#import "LYGuide.h"

NSString * const kLYGuidePrefix = @"com.ryanleely.LYIntroduction";
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

- (BOOL)showNextFrom:(id)obj {
    NSString *className = [NSString stringWithUTF8String:object_getClassName(obj)];
    NSString *key = [kLYGuidePrefix stringByAppendingString:className];
    NSArray<LYGuide *> *guides = [self.guidesDic objectForKey:key];
    __block BOOL result = NO;
    [guides enumerateObjectsUsingBlock:^(LYGuide *guide, NSUInteger idx, BOOL *stop) {
        if(guide.displayed == NO){
            [guide show];
            result = YES;
            *stop = YES;
            if(idx == ([guides count]-1)){
                LYGuidesCompletionBlock completion = [self.guidesBlockDic objectForKey:key];
                completion(YES);
            }
        }
    }];
    return result;
}

- (void)registerGuides:(NSArray<LYGuide *>*)guides
                  from:(id)obj
            completion:(LYGuidesCompletionBlock)block
{
    NSString *className = [NSString stringWithUTF8String:object_getClassName(obj)];
    NSString *key = [kLYGuidePrefix stringByAppendingString:className];
    [self.guidesDic setValue:guides forKey:key];
    [self.guidesBlockDic setValue:block forKey:key];
}
@end
