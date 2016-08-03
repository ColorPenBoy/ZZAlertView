//
//  ViewController.m
//  ZZAlertViewDemo
//
//  Created by colorpen on 16/8/3.
//  Copyright © 2016年 colorpen. All rights reserved.
//

#import "ViewController.h"
#import "ZZAlertView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        
    });
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    NSMutableAttributedString * attStr = [[NSMutableAttributedString alloc] initWithString:@"我就是一个消息，我就是一个消息，我就是一个消息，我就是一个消息，我就是一个消息一个消息，我就是一个消息，我就是一个消息，我就是一个消息"];
    [attStr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(4, 5)];
    [attStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:20.0f] range:NSMakeRange(4, 5)];
    
    [ZZAlertView alertWithMessage:attStr cancelBtnName:@"取消" otherBtnName:@"确认" callBackBlock:^(NSInteger index) {
        
        NSLog(@"d点击 - %@",@(index));
        
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
