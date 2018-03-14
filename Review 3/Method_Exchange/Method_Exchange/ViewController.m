//
//  ViewController.m
//  Method_Exchange
//
//  Created by AY on 2018/3/13.
//  Copyright © 2018年 AY. All rights reserved.
//

#import "ViewController.h"
#import "NSString+SayHello.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	
	// 调用 sayHelloWorld 打印 helloChina
	[NSString sayHelloWorld];
	
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


@end
