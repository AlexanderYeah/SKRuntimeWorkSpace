//
//  ViewController.m
//  Add_Method
//
//  Created by AY on 2018/3/13.
//  Copyright © 2018年 AY. All rights reserved.
//

#import "ViewController.h"

#import "Dog.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	
	Dog *d = [[Dog alloc]init];
	
	// 调用一个dog 类中没有定义的方法
	[d performSelector:@selector(eat) withObject:nil];
	
	
	
	
	
	
	
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


@end
