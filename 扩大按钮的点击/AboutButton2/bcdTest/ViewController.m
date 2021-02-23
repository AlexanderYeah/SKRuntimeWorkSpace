//
//  ViewController.m
//  bcdTest
//
//  Created by zengqiang xing on 2018/6/3.
//  Copyright © 2018年 zengqiang xing. All rights reserved.
//  

#import "ViewController.h"
#import "UIButton+EnlargeEdge.h"
@interface ViewController ()

@property(nonatomic,strong)UIButton *button1;
@property(nonatomic,strong)UIButton *button2;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button1.frame = CGRectMake(150, 100, self.view.bounds.size.width-300, self.view.bounds.size.width-300);
    self.button1.backgroundColor = [UIColor blueColor];
    self.button1.tag = 1;
    [self.button1 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.button1 setEnLargeEdge:10];
    [self.view addSubview:self.button1];
    
    
    self.button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button2.frame = CGRectMake(150, 300, self.view.bounds.size.width-300, self.view.bounds.size.width-300);
    self.button2.backgroundColor = [UIColor greenColor];
    self.button2.tag = 2;
    [self.button2 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.button2 setEnlargeEdgeWithTop:50 right:50 bottom:200 left:50];
    [self.view addSubview:self.button2];
    
}

- (void)buttonClick:(UIButton *)btn {
    NSString *msg = nil;
    if (btn.tag == 1) {
        msg = @"点击button1";
    } else if (btn.tag == 2) {
        msg = @"点击button2";
    }
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:msg preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:action];
    [self presentViewController:alertController animated:YES completion:nil];
}


@end
