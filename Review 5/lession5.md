# 消息转发机制
OC 中的方法执行，是利用其消息转发机制实现的。

> 	Dog *d = [[Dog alloc]init];			
>	objc_msgSend(d,@selector(eat));

objc 向一个对象发送消息的时候，runtime库会根据对象的isa指针找到该对象实际所属的类，然后在该类中的方法列表以及其父类方法列表中寻找方法运行。如果在层层的寻找汇总，均未找到对应方法的实现的时候，就会抛出 unrecognized selector sent to XXX 异常。程序就会崩溃。

## Tips: 允许使用运行时代码

BuildSettings --> 搜索msg--> Enable Strict Checking of 
objc_msg_send Calls  置位 NO

# 消息转发 unrecognized selector 的最后三道防线

## 1 所属的类动态方法解析
在该类以及父类的方法列表均为找到指定方法的时候，就会来到此方法，看是否可以动态的添加对应的方法。
> +(BOOL)resolveInstanceMethod:(SEL)sel  

```
void unkonwnMethod(){
	NSLog(@"未注册的方法被我添加了");
}

+(BOOL)resolveInstanceMethod:(SEL)sel
{
	
	if (sel == @selector(unkonwnMethod)) {
		
		
		class_addMethod([Dog class], sel, (IMP)unkonwnMethod,"");
		
	}
	
	[super resolveInstanceMethod:sel];
	
	return YES;
	

}
```  

## 2 消息重定向（第一步失败走到这里）
当对象所属类不能动态添加方法后，runtime就会询问当前的接受者是否有其他对象可以处理这个未知的selector，相关方法声明如下:

> - (id)forwardingTargetForSelector:(SEL)aSelector

```
- (id)forwardingTargetForSelector:(SEL)aSelector
{
	
	// aSelector  就是存放要转发给其他类的方法
	
	// 创建一个要转发给其他的类
	NSString *targetCls = @"Cat";
	
	// 其实只要返回对象不为self 和 nil 就会把消息转发给返回的对象
	return NSClassFromString(targetCls);

	
}
```

## 3 方法转发（前两步都失败走这里）
当没有备援接收者时，就只剩下最后一次机会，那就是消息重定向。这个时候runtime会将未知消息的所有细节都封装为NSInvocation对象，然后调用下述方法:
> - (id)forwardingTargetForSelector:(SEL)aSelector  
  
下面的唯一参数是NSInvocation 类型的对象，该对象封装了原始的消息和消息额参数。
注意：参数 anInvocation 是从哪来的？

在 forwardInvocation: 消息发送前，Runtime 系统会向对象发送methodSignatureForSelector: 消息，并取到返回的方法签名用于生成 NSInvocation 对象。所以重写 forwardInvocation: 的同时也要重写 methodSignatureForSelector: 方法，否则会抛异常。  
  
```// 生成一个签名
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

```  
当一个对象由于没有响应的方法实现响应某消息的时候，运行时系统通过forwardInvocation: 方法，将消息转发给其他对象。
forwardInvocation: 方法就是一个不能识别消息的分发中心，将这些不能识别的消息转发给不同的接收对象，或者转发给同一个对象，或再将消息翻译成另外的消息或者吃掉某些消息，因此及时没有方法的实现也不会报错。如以上的示例 都是将消息吃掉，及时没有方法实现也不回报错。 


```- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    if ([someOtherObject respondsToSelector:
            [anInvocation selector]])
        [anInvocation invokeWithTarget:someOtherObject];
    else
        [super forwardInvocation:anInvocation];
}


```
![11](https://github.com/AlexanderYeah/SKRuntimeWorkSpace/blob/master/Review%205/lession5.png)

