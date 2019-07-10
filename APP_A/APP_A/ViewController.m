//
//  ViewController.m
//  APP_A
//
//  Created by 彭双塔 on 2019/7/9.
//  Copyright © 2019 pst. All rights reserved.
//

#import "ViewController.h"
#define Screen_Width [UIScreen mainScreen].bounds.size.width
#define Screen_Height [UIScreen mainScreen].bounds.size.height
@interface ViewController ()
/** 跳转到App_B */
@property (nonatomic,strong) UIButton *btn;
/** 跳转到App_B_page_one */
@property (nonatomic,strong) UIButton *pageOneBtn;
/** 跳转到App_B_page_two */
@property (nonatomic,strong) UIButton *pageTwoBtn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self btn];
    [self pageTwoBtn];
    [self pageOneBtn];
}
-(UIButton *)btn{
    if (!_btn) {
        _btn = [UIButton new];
        _btn.frame = CGRectMake(Screen_Width/2 - 166.0/2, 100,166.0,44.0);
        [_btn setBackgroundColor:[UIColor orangeColor]];
        [_btn setTitle:@"jump_APP_B" forState:0];
        [_btn setTitleColor:[UIColor whiteColor] forState:0];
        _btn.layer.cornerRadius = 44.0/2;
        _btn.layer.masksToBounds = YES;
        _btn.tag = 1;
        [_btn addTarget:self action:@selector(clicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_btn];
    }
    return _btn;
}
-(UIButton *)pageOneBtn{
    if (!_pageOneBtn) {
        _pageOneBtn = [UIButton new];
        _pageOneBtn.frame = CGRectMake(Screen_Width/2 - 166.0/2, 100 + 44 + 10,166.0,44.0);
        [_pageOneBtn setBackgroundColor:[UIColor orangeColor]];
        [_pageOneBtn setTitle:@"jump_APP_B_One" forState:0];
        [_pageOneBtn setTitleColor:[UIColor whiteColor] forState:0];
        _pageOneBtn.layer.cornerRadius = 44.0/2;
        _pageOneBtn.layer.masksToBounds = YES;
        _pageOneBtn.tag = 2;
        [_pageOneBtn addTarget:self action:@selector(clicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_pageOneBtn];
    }
    return _pageOneBtn;
}
-(UIButton *)pageTwoBtn{
    if (!_pageTwoBtn) {
        _pageTwoBtn = [UIButton new];
        _pageTwoBtn.frame = CGRectMake(Screen_Width/2 - 166.0/2, 100 + 44 + 10 + 44 + 10,166.0,44.0);
        [_pageTwoBtn setBackgroundColor:[UIColor orangeColor]];
        [_pageTwoBtn setTitle:@"jump_APP_B_Two" forState:0];
        [_pageTwoBtn setTitleColor:[UIColor whiteColor] forState:0];
        _pageTwoBtn.layer.cornerRadius = 44.0/2;
        _pageTwoBtn.layer.masksToBounds = YES;
        _pageTwoBtn.tag = 3;
        [_pageTwoBtn addTarget:self action:@selector(clicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_pageTwoBtn];
    }
    return _pageTwoBtn;
}
-(void)clicked:(UIButton *)sender{
    UIPasteboard *p = [UIPasteboard generalPasteboard];
    [p setString:@"来自AppA的数据"];
    if (sender.tag == 1) {
        NSURL *url = [NSURL URLWithString:@"AppB://"];
        BOOL canOpen = [[UIApplication sharedApplication] canOpenURL:url];
        if (canOpen) {
            if (@available(iOS 10.0,*)) {
                [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:^(BOOL success) {
                    NSLog(@"跳转app成功");
                }];
            }
            else{
                [[UIApplication sharedApplication] openURL:url];
            }
        }
        else{
            NSLog(@"没有安装该app");
        }
    }
    if (sender.tag == 2) {
        NSURL *url = [NSURL URLWithString:@"AppB://pageOne"];
        BOOL canOpen = [[UIApplication sharedApplication] canOpenURL:url];
        if (canOpen) {
            if (@available(iOS 10.0,*)) {
                [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:^(BOOL success) {
                    NSLog(@"跳转app成功");
                }];
            } else {
                [[UIApplication sharedApplication] openURL:url];
            }
        } else {
            NSLog(@"没有安装该app");
        }
    }
    if (sender.tag == 3) {
        NSURL *url = [NSURL URLWithString:@"AppB://pageTwo"];
        BOOL canOpen = [[UIApplication sharedApplication] canOpenURL:url];
        if (canOpen) {
            if (@available(iOS 10.0,*)) {
                [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:^(BOOL success) {
                    NSLog(@"跳转app成功");
                }];
            } else {
                [[UIApplication sharedApplication] openURL:url];
            }
        } else {
            NSLog(@"没有安装该app");
        }
    }
}
@end
