//
//  CaptchaTimerManager.h
//  GCDTimerDemo
//
//  Created by WhatsXie on 2017/12/20.
//  Copyright © 2017年 R.S. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CaptchaTimerManager : NSObject
@property (nonatomic, assign)__block int timeout;
+ (id)sharedTimerManager;
- (void)countDown;
@end
