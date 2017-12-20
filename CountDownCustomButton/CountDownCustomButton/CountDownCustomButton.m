//
//  CountDownCustomButton.m
//  CountDownCustomButton
//
//  Created by WhatsXie on 2017/5/8.
//  Copyright © 2017年 StevenXie. All rights reserved.
//

#import "CountDownCustomButton.h"

@interface CountDownCustomButton (){
    TouchedCountDownButtonHandler _touchedCountButtonHandler;
    
    NSInteger _second;
    NSInteger _totalSecond;
    NSTimer *_timer;
    NSDate *_startDate;
    
    CountDownChanging _countDownChanging;
    CountDownFinished _countDownFinished;
}
@end

@implementation CountDownCustomButton

#pragma -mark 点击事件
- (void)countDownButtonHandler:(TouchedCountDownButtonHandler)touchedCountButtonHandler{
    _touchedCountButtonHandler = [touchedCountButtonHandler copy];
    [self addTarget:self action:@selector(touched:) forControlEvents:UIControlEventTouchUpInside];
}
- (void)touched:(CountDownCustomButton *)sender {
    if (_touchedCountButtonHandler) {
        _touchedCountButtonHandler(sender, sender.tag);
    }
}
#pragma -mark 倒计时
- (void)startCountDownWithSecond:(NSUInteger)totalSecond {
    _totalSecond = totalSecond;
    _second = totalSecond;
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerStart:) userInfo:nil repeats:YES];
    _startDate = [NSDate date];
    [[NSRunLoop currentRunLoop]addTimer:_timer forMode:NSRunLoopCommonModes];
}
- (void)timerStart:(NSTimer *)theTimer {
    double deltaTime = [[NSDate date] timeIntervalSinceDate:_startDate];
    _second = _totalSecond - (NSInteger)(deltaTime + 0.5);
    if (_second < 0.0) {
        [self stopCountDown];
    } else {
        if (_countDownChanging) {
            [self setTitle:_countDownChanging(self, _second) forState:UIControlStateNormal];
            [self setTitle:_countDownChanging(self, _second) forState:UIControlStateDisabled];
        } else {
            NSString *title = [NSString stringWithFormat:@"%zd秒", _second];
            [self setTitle:title forState:UIControlStateNormal];
            [self setTitle:title forState:UIControlStateDisabled];
        }
    }
}
- (void)stopCountDown {
    if (_timer) {
        if ([_timer respondsToSelector:@selector(isValid)]) {
            if ([_timer isValid]) {
                [_timer invalidate];
                _second = _totalSecond;
                if (_countDownFinished) {
                    [self setTitle:_countDownFinished(self, _totalSecond) forState:UIControlStateNormal];
                    [self setTitle:_countDownFinished(self, _totalSecond) forState:UIControlStateDisabled];
                } else {
                    [self setTitle:@"重新获取" forState:UIControlStateNormal];
                    [self setTitle:@"重新获取" forState:UIControlStateDisabled];
                }
            }
        }
    }
}
#pragma -mark block
- (void)countDownChanging:(CountDownChanging)countDownChanging {
    _countDownChanging = [countDownChanging copy];
}
- (void)countDownFinished:(CountDownFinished)countDownFinished {
    _countDownFinished = [countDownFinished copy];
}
@end
