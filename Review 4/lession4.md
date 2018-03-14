# 动态的添加方法
创建一个Dog 类，动态地给这个Dog类添加一个eat的方法。

实现步骤  

* 1 首先一个类未实现某个方法的时候，就会走该类的下面两个方法  

> 调用类未实现的类方法 
> > //+ (BOOL)resolveClassMethod:(SEL)sel  


> // 调用类未实现的对象方法
> > +(BOOL)resolveInstanceMethod:(SEL)sel   

 
* 2 在走到以上方法的时候 去调用对应的方法
`
	void eat(){
	NSLog(@"野狗吃饭了");
}

// 调用类未实现的对象方法
+ (BOOL)resolveInstanceMethod:(SEL)sel
{
	NSString *str = NSStringFromSelector(sel);
	
	
	NSLog(@"%@",str);
	if (sel == @selector(eat)) {
		// 动态的添加方法
		// 第一个参数 : 添加方法的类名
		// 第二个参数 : 方法编号
		// IMP（Implementation）:方法实现 传入一个指针
		// const char *types : 类型
		class_addMethod([Dog class], sel, (IMP)eat,"");
		
	}
	[super resolveInstanceMethod:sel];
	return YES;
}
`


