//
//  GCDTimerViewController.m
//  CountDownCustomButton
//
//  Created by WhatsXie on 2017/12/20.
//  Copyright © 2017年 StevenXie. All rights reserved.
//

#import "GCDTimerViewController.h"
#import "CaptchaTimerManager.h"
@interface GCDTimerViewController ()
@property (weak, nonatomic) IBOutlet UIButton *timeButton;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (nonatomic, assign) __block int timeout;
@end

@implementation GCDTimerViewController

//页面出现前取出计时器单例的时间进行判断是否还在倒计时
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    CaptchaTimerManager *manager = [CaptchaTimerManager sharedTimerManager];
    int temp = manager.timeout;
    if (temp > 0) {
        _timeout= temp; //倒计时时间
        [self timerCountDown];
    }
}
//页面消失前记录倒计时时间到单例里
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    if (self.timeout > 0) {
        CaptchaTimerManager *manager = [CaptchaTimerManager sharedTimerManager];
        if (manager.timeout == 0) {
            manager.timeout = _timeout;
            [manager countDown];
        }
        _timeout = 0;//置为0，释放controller
    }
}

//按钮点击事件
- (IBAction)touch1:(id)sender {
    _timeout = 60; //倒计时时间
    [self timerCountDown];
    
}

//控制器里的计时器
- (void)timerCountDown{
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if (_timeout <= 0) { //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //这里写倒计时结束button的处理
                [_timeButton setEnabled:YES];
                _timeLabel.text = @"⌛";
            });
        } else {
            dispatch_async(dispatch_get_main_queue(), ^{
                //这里写倒计时期间button的处理（重设button的tiitle、用户交互等）
                [_timeButton setEnabled:NO];
                _timeLabel.text = [[NSString alloc] initWithFormat:@"⏳ - %d",_timeout];
            });
            _timeout--;
        }
    });
    dispatch_resume(_timer);
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // button初始化处理.
}

@end
