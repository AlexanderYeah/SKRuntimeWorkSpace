//
//  NSString+SayHello.m
//  Method_Exchange
//
//  Created by AY on 2018/3/13.
//  Copyright © 2018年 AY. All rights reserved.
//

#import "NSString+SayHello.h"
#import <objc/message.h>

@implementation NSString (SayHello)

+ (void)load
{
	// 此文件load 的时候  进行交换方法
	
	// 1 生成description  method
	// 第一个参数  类  第二个参数是方法 返回一个method 系统的方法
	Method descMethod =  class_getClassMethod([NSString class], @selector(sayHelloChina));
	// 2 自定义的方法
	Method customMethod = class_getClassMethod([NSString class], @selector(sayHelloWorld));
	// 3 进行方法的交换
	method_exchangeImplementations(descMethod, customMethod);
	
	

}

+ (void)sayHelloChina
{
	NSLog(@"HelloChina");
	
}

+ (void)sayHelloWorld
{

	NSLog(@"HelloWorld");
	
}

@end
