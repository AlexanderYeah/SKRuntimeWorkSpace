# runtime 的验证 

1 新建一个命令行项目 创建一个Person 类   

2 在 main 函数中进行初始化  

> Person * p = [[Person alloc]init];


3 打开命令行，cd到main 所在的目录，进行编译
>  clang -rewrite-objc main.m  

4 就会看到mian.m 所在目录生成一个main.cpp 文件，打开会看见如下的代码 就是证明