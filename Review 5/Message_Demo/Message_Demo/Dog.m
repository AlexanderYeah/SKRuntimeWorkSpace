//
//  Dog.m
//  Message_Demo
//
//  Created by AY on 2018/3/13.
//  Copyright © 2018年 AY. All rights reserved.
//

#import "Dog.h"
#import <objc/message.h>
#import "Cat.h"
@implementation Dog

- (void)eat
{

	NSLog(@"吃饭了");
}

void unkonwnMethod(){
	NSLog(@"未注册的方法被我添加了");
}

//+(BOOL)resolveInstanceMethod:(SEL)sel
//{
//	
//	if (sel == @selector(unkonwnMethod)) {
//		
//		
//		class_addMethod([Dog class], sel, (IMP)unkonwnMethod,"");
//		
//	}
//	
//	[super resolveInstanceMethod:sel];
//	
//	return YES;
//	
//
//}


//- (id)forwardingTargetForSelector:(SEL)aSelector
//{
//	
//	// aSelector  就是存放要转发给其他类的方法
//	
//	// 创建一个要转发给其他的类
//	NSString *targetCls = @"Cat";
//	
//	// 其实只要返回对象不为self 和 nil 就会把消息转发给返回的对象
//	return NSClassFromString(targetCls);
//
//	
//}

// 生成一个签名
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
	 return [NSMethodSignature signatureWithObjCTypes:"@@:"];

}

// 前面两步都失败 走到这里
- (void)forwardInvocation:(NSInvocation *)anInvocation
{
	NSString *key = NSStringFromSelector([anInvocation selector]);
	
	NSLog(@"Class %@ can't responer %@ methond",[self class],key);
	

	
	
	NSLog(@"11");
}
@end
