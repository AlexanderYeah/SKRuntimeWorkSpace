# 动态的修改方法
### 利用runtime 动态地修改方法  
需求: 扩展一个NSString+SayHello 的类，然后交换其内部的方法。调用helloworld 打印helloChina

+ (void)sayHelloWorld;

+ (void)sayHelloChina;


实现步骤：  

*  #import <objc/message.h>  
*  核心代码  

```
	// 此文件load 的时候  进行交换方法
	
	// 1 生成description  method
	// 第一个参数  类  第二个参数是方法 返回一个method 系统的方法
	Method descMethod =  class_getClassMethod([NSString class], @selector(sayHelloChina));
	// 2 自定义的方法
	Method customMethod = class_getClassMethod([NSString class], @selector(sayHelloWorld));
	// 3 进行方法的交换
	method_exchangeImplementations(descMethod, customMethod);
```
