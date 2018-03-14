//
//  ViewController.m
//  Lession1
//
//  Created by AY on 2018/3/13.
//  Copyright © 2018年 AY. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	// 类的属性的数量
	unsigned int count = 0;
	
	Person *p = [Person new];
	// 获取类所有的属性变量
	Ivar *members = class_copyIvarList([Person class], &count);
	
	for (int i = 0; i < count; i ++) {
		Ivar ivar = members[i];
		// 取得属性名字并转成字符串类型
		const char * memberName = ivar_getName(ivar);
		// 打印出属性的名字
		NSLog(@"%s",memberName);
		Ivar name = members[0];
		// 修改属性的值
		object_setIvar(p, name, @"AlexanderYeah");
	}
	
	NSLog(@"%@",[p valueForKey:@"name"]);
	
	
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


@end
