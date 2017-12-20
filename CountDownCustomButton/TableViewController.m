//
//  TableViewController.m
//  CountDownCustomButton
//
//  Created by WhatsXie on 2017/7/6.
//  Copyright © 2017年 StevenXie. All rights reserved.
//

#import "TableViewController.h"
#import "TimerViewController.h"
#import "GCDTimerViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        TimerViewController *timeViewController = [TimerViewController new];
        timeViewController.title = @"单线程-倒计时";
        [self.navigationController pushViewController:timeViewController animated:YES];
    } else {
        GCDTimerViewController *cgdViewController = [GCDTimerViewController new];
        cgdViewController.title = @"多线程-倒计时";
        [self.navigationController pushViewController:cgdViewController animated:YES];
    }
}

@end
