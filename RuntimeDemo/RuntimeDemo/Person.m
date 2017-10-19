//
//  Person.m
//  RuntimeDemo
//
//  Created by yst911521 on 2017/10/19.
//  Copyright © 2017年 YST. All rights reserved.
//

#import "Person.h"
#import <objc/message.h>

@implementation Person

//一个没有被实现的类方法
//+(BOOL)resolveClassMethod:(SEL)sel{
//
//
//}

+(BOOL)resolveInstanceMethod:(SEL)sel{
    
    NSLog(@"%@",NSStringFromSelector(sel));
    
    //1 类名 2 sel编号 3 c语言方法 4 返回值参数类型
    
    class_addMethod([Person class], sel,  (IMP)hahah, "v@:@");
    
    
    
    
    
    return [super resolveInstanceMethod:sel];
}

//c 语言方法
 void happy(){
    
    NSLog(@"不吃了");
}

//每个 OC方法都有两个参数  1 方法调用者 2 方法编号
void hahah(id self,SEL _cmd, NSString *str){
    
    NSLog(@"带参数的方法 %@",str);
}

@end
