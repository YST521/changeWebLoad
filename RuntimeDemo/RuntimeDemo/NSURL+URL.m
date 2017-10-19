//
//  NSURL+URL.m
//  RuntimeDemo
//
//  Created by yst911521 on 2017/10/19.
//  Copyright © 2017年 YST. All rights reserved.
//

#import "NSURL+URL.h"
#import  <objc/message.h>

@implementation NSURL (URL)

//类加载时调用  
+(void)load{
  
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Method m1 =  class_getClassMethod([NSURL class], @selector(URLWithString:));
        
        Method m2 = class_getClassMethod([self class], @selector(methodC));
        
        method_exchangeImplementations(m1, m2);
    });
  
}

+(instancetype)methodC{
    NSLog(@"66666");
    
    //此处不能用 注释方法 会导致递归调用
   // [NSURL URLWithString:@"http://www.jianshu.com/p/809b17f2b4a0"];
    
    return[[NSURL alloc] initWithString: @"http://www.jianshu.com/p/809b17f2b4a0"];
    
}


@end
