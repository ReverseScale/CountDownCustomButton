//
//  ViewController.m
//  CountDownCustomButton
//
//  Created by WhatsXie on 2017/5/8.
//  Copyright © 2017年 StevenXie. All rights reserved.
//

#import "ViewController.h"
#import "CountDownCustomButton.h"

@interface ViewController (){
    CountDownCustomButton *_countDownCode;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupCountTimeButton];
    [self setupStopCountButton];
}
// 计时按钮
- (void)setupCountTimeButton {
    _countDownCode = [CountDownCustomButton buttonWithType:UIButtonTypeCustom];
    _countDownCode.frame = CGRectMake(81, 200, 148, 44);
    [_countDownCode setTitle:@"获取验证码" forState:UIControlStateNormal];
    _countDownCode.backgroundColor = [UIColor grayColor];
    _countDownCode.clipsToBounds = YES;
    _countDownCode.layer.cornerRadius = 10;
    [_countDownCode addTarget:self action:@selector(aclion:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_countDownCode];
    
    
    [_countDownCode countDownButtonHandler:^(CountDownCustomButton *sender, NSInteger tag) {
        sender.enabled = NO;
        
        [sender startCountDownWithSecond:60];
        [sender countDownChanging:^NSString *(CountDownCustomButton *countDownButton, NSUInteger second) {
            NSString *title = [NSString stringWithFormat:@"剩余%zd秒",second];
            return title;
        }];
        [sender countDownFinished:^NSString *(CountDownCustomButton *countDownButton, NSUInteger second) {
            countDownButton.enabled = YES;
            return @"点击重新获取";
        }];
    }];
}
// 停止计时按钮
- (void)setupStopCountButton {
    UIButton *stopBtn = [UIButton new];
    stopBtn.frame = CGRectMake(81, 300, 148, 44);
    stopBtn.backgroundColor = [UIColor grayColor];
    [stopBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [stopBtn setTitle:@"点击停止" forState:UIControlStateNormal];
    stopBtn.clipsToBounds = YES;
    stopBtn.layer.cornerRadius = 10;
    [stopBtn addTarget:self action:@selector(stop:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:stopBtn];
}
- (void)aclion:(UIButton *)btn {
    NSLog(@"button title:%@", btn.titleLabel.text);
}
- (void)stop:(id)sender {
    [_countDownCode stopCountDown];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
