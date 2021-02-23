//
//  NSArray+SafeFliter.m
//  safeArray
//
//  Created by Alexander on 2021/2/23.
//  Copyright © 2021 alexander. All rights reserved.
//

#import "NSArray+SafeFliter.h"
#import <objc/runtime.h>

@implementation NSArray (SafeFliter)

+ (void)load {

// 在load方法里面进行交换
    Method originalMethod = class_getClassMethod(self, @selector(arrayWithObjects:count:));
    Method swizzledMethod = class_getClassMethod(self, @selector(na_arrayWithObjects:count:));
    method_exchangeImplementations(originalMethod, swizzledMethod);
     
//
//
//	static dispatch_once_t onceToken;
//
//    dispatch_once(&onceToken, ^{
//       //方法交换只要一次就好
//       //NSMutableArray
//       Method mutableObjectAtIndex = class_getInstanceMethod(objc_getClass("__NSArrayM"), @selector(objectAtIndex:));
//
//       Method mutablenewObjectAtIndex = class_getInstanceMethod(objc_getClass("__NSArrayM"), @selector(safeObjectAtIndex:));
//
//       method_exchangeImplementations(mutableObjectAtIndex, mutablenewObjectAtIndex);
//
//    });


    
}

-(id)safeObjectAtIndex:(NSInteger)index{

    

    if ( (index > self.count-1)||(index < 0)||!self.count) {

       return @"越界";

    }

   return [self safeObjectAtIndex:index];

}




+ (instancetype)na_arrayWithObjects:(const id [])objects count:(NSUInteger)cnt {

    id nObjects[cnt];
    int i=0, j=0;
    for (; i<cnt && j<cnt; i++) {
        if (objects[i]) {
            nObjects[j] = objects[i];
            j++;
        }
    }
    
    return [self na_arrayWithObjects:nObjects count:j];
}


@end
