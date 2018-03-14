//
//  ViewController.m
//  Message_Demo
//
//  Created by AY on 2018/3/13.
//  Copyright © 2018年 AY. All rights reserved.
//

#import "ViewController.h"

#import "Dog.h"
#import <objc/message.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	Dog *d = [[Dog alloc]init];
	
	objc_msgSend(d,@selector(eat));
	
	// 发送一个未实现的方法
	objc_msgSend(d, @selector(unkonwnMethod));
	
	
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


@end
