//
//  CountDownCustomButton.h
//  CountDownCustomButton
//
//  Created by WhatsXie on 2017/5/8.
//  Copyright © 2017年 StevenXie. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CountDownCustomButton;

typedef NSString *(^CountDownChanging)(CountDownCustomButton *countDownButton ,NSUInteger second);
typedef NSString *(^CountDownFinished)(CountDownCustomButton *countDownButton ,NSUInteger second);
typedef void (^TouchedCountDownButtonHandler)(CountDownCustomButton *countDownButton, NSInteger tag);

@interface CountDownCustomButton : UIButton
@property(nonatomic, strong) id userInfo;

///倒计时按钮点击回调
- (void)countDownButtonHandler:(TouchedCountDownButtonHandler)touchedCountDownButtonHandler;
//倒计时时间改变回调
- (void)countDownChanging:(CountDownChanging)countDownChanging;
//倒计时结束回调
- (void)countDownFinished:(CountDownFinished)countDownFinished;
///开始倒计时
- (void)startCountDownWithSecond:(NSUInteger)second;
///停止倒计时
- (void)stopCountDown;
@end
