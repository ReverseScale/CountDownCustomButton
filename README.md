# CountDownCustomButton

![image](http://og1yl0w9z.bkt.clouddn.com/17-7-4/60056879.jpg)

![](https://img.shields.io/badge/platform-iOS-red.svg) ![](https://img.shields.io/badge/language-Objective--C-orange.svg) ![](https://img.shields.io/badge/download-254K-brightgreen.svg
) ![](https://img.shields.io/badge/license-MIT%20License-brightgreen.svg) 

Encapsulate common verification code countdown functions, and you also have a clearly structured login and registration page.

Added: Example of timing for newly opened threads

## 🎨 Why test the UI?

| 1.List page | 2.Show page | 3.Show page |
| ------------- | ------------- | ------------- |
| ![](http://og1yl0w9z.bkt.clouddn.com/18-3-20/16783465.jpg) | ![](http://og1yl0w9z.bkt.clouddn.com/18-3-20/46641643.jpg) | ![](http://og1yl0w9z.bkt.clouddn.com/18-3-20/81026781.jpg) |
| Building a basic framework with a storyboard | Countdown through packaging | Multithreading countdown |

## 🤖 Requirements

* iOS 9.0+
* Xcode 9.0+
* Objective-C

## 🚀 Getting started
* 1. Less files, simple code
* 2. Does not rely on any other third party library
* 3. Callback using Block mode, efficient and efficient structure
* 4. NSTimer thread safety, no manual management release
* 5. Highly customizable

### 🎯 Installation

#### Install
```
pod 'CountDownCustomButtonLib', '~> 0.3.0’
```

## 🛠 Configuration
### Import header files
```
#import "CountDownCustomButton.h"
```
### Declaration attribute
```
@interface ViewController (){
    CountDownCustomButton *_countDownCode;
}
```
### Code
```
// Time button
- (void)setupCountTimeButton {
    _countDownCode = [CountDownCustomButton buttonWithType:UIButtonTypeCustom];
    _countDownCode.frame = CGRectMake(81, 200, 148, 32);
    [_countDownCode setTitle:@"Get verification code" forState:UIControlStateNormal];
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
            return @"Click to retrieve";
        }];
    }];
}
```
### Other ways to declare
```
/// Countdown button clickback
- (void)countDownButtonHandler:(TouchedCountDownButtonHandler)touchedCountDownButtonHandler;
// Countdown time change callback
- (void)countDownChanging:(CountDownChanging)countDownChanging;
// Countdown end callback
- (void)countDownFinished:(CountDownFinished)countDownFinished;
/// Start counting down
- (void)startCountDownWithSecond:(NSUInteger)second;
/// Stop countdown
- (void)stopCountDown;
```

### Timing for newly opened threads
```
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    CaptchaTimerManager *manager = [CaptchaTimerManager sharedTimerManager];
    int temp = manager.timeout;
    if (temp > 0) {
        _timeout= temp; //倒计时时间
        [self timerCountDown];
    }
}
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
```

## ⚖ License

```
MIT License

Copyright (c) 2017 ReverseScale

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

## 😬 Contributions

* WeChat : WhatsXie
* Email : ReverseScale@iCloud.com
* Blog : https://reversescale.github.io

---
# 中文说明
封装常用的验证码倒计时功能，还你一个结构清晰的登录、注册页面。

新增：新开线程进行计时的示例

## 🎨 测试 UI 什么样子？
|1.列表页 |2.展示页 |3.展示页 |
| ------------- | ------------- | ------------- |
| ![](http://og1yl0w9z.bkt.clouddn.com/18-3-20/16783465.jpg) | ![](http://og1yl0w9z.bkt.clouddn.com/18-3-20/46641643.jpg) | ![](http://og1yl0w9z.bkt.clouddn.com/18-3-20/81026781.jpg) |
| 通过 storyboard 搭建基本框架 | 通过封装实现倒计时 | 多线程倒计时实现 |

## 🤖 要求

* iOS 9.0+
* Xcode 9.0+
* Objective-C

## 🚀 准备开始
* 1.文件少，代码简洁
* 2.不依赖任何其他第三方库
* 3.使用Block方式回调，效率高效，结构清晰
* 4.NSTimer线程安全，无需手动管理释放
* 5.具备较高自定义性

### 🎯 安装方法

#### 安装
```
pod 'CountDownCustomButtonLib', '~> 0.3.0’
```

## 🛠 配置
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

### 新开线程进行计时
```
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    CaptchaTimerManager *manager = [CaptchaTimerManager sharedTimerManager];
    int temp = manager.timeout;
    if (temp > 0) {
        _timeout= temp; //倒计时时间
        [self timerCountDown];
    }
}
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
```

## ⚖ 协议

```
MIT License

Copyright (c) 2017 ReverseScale

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

## 😬  联系

* 微信 : WhatsXie
* 邮件 : ReverseScale@iCloud.com
* 博客 : https://reversescale.github.io

