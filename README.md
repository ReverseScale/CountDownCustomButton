# CountDownCustomButton

![image](http://og1yl0w9z.bkt.clouddn.com/17-7-4/60056879.jpg)

![](https://img.shields.io/badge/platform-iOS-red.svg) ![](https://img.shields.io/badge/language-Objective--C-orange.svg) ![](https://img.shields.io/badge/download-254K-brightgreen.svg
) ![](https://img.shields.io/badge/license-MIT%20License-brightgreen.svg) 

封装常用的验证码倒计时功能，还你一个结构清晰的登录、注册页面。

### 我的技术博客：https://reversescale.github.io 欢迎来踩

![image](http://og1yl0w9z.bkt.clouddn.com/17-7-4/31536145.jpg)

## Requirements 要求
* iOS 7+
* Xcode 8+

## Usage 使用方法
### 第一步 引入头文件
```
#import "CountDownCustomButton.h"
```
### 第二步 声明属性
```
@interface ViewController (){
    CountDownCustomButton *_countDownCode;
}
```
### 第三部 代码实现
```
// 计时按钮
- (void)setupCountTimeButton {
    _countDownCode = [CountDownCustomButton buttonWithType:UIButtonTypeCustom];
    _countDownCode.frame = CGRectMake(81, 200, 148, 32);
    [_countDownCode setTitle:@"获取验证码" forState:UIControlStateNormal];
    _countDownCode.backgroundColor = [UIColor blueColor];
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
```
### 其他 声明方法
```
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
```

使用简单、效率高效、进程安全~~~如果你有更好的建议,希望不吝赐教!
### 你的star是我持续更新的动力!
===

## 联系方式:
* WeChat : WhatsXie
* Email : ReverseScale@iCloud.com
* QQ : 1129998515


