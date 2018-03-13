# runtime改变一个类的私有属性  
### 在.m文件中声明的私有属性可以通过runtime进行访问到，相关成员变量的解读。

### Ivar 实例变量类型 是一个指向objc_ivar 结构体的指针
### class_copyIvarList 获取一个类的所有的成员变量  
### ivar_getName 获取成员变量名字  
### ivar_getTypeEncoding 获取成员变量的类型编码  
### class_getInstanceVariable 获取指定名称的成员  


```
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
  ```
