# runtime改变一个类的私有属性  
### 在.m文件中声明的私有属性可以通过runtime进行访问到，相关成员变量的解读。

### Ivar 实例变量类型 是一个指向objc_ivar 结构体的指针
### class_copyIvarList 获取一个类的所有的成员变量  
### ivar_getName 获取成员变量名字  
### ivar_getTypeEncoding 获取成员变量的类型编码  
### class_getInstanceVariable 获取指定名称的成员