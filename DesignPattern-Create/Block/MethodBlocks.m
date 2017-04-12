//
//  MethodBlocks.m
//  DesignPattern-Create
//
//  Created by liangbai on 2017/3/15.
//  Copyright © 2017年 liangbai. All rights reserved.
//
//  Block 的实现语法
//  return_type (^block_name)(parameters)
//   返回类型         名字           参数

#import "MethodBlocks.h"

@implementation MethodBlocks

- (instancetype)init {
    self = [super init];
    if (self) {
        
//      (1) 使用 block 函数来返回结果
        float (^simpleAddation)(float, float) = ^(float a, float b) {
            return a +b;
        };
        
        NSLog(@"total = %f", simpleAddation(2.3 , 3.8));
        
    
//      (2) 使用 block 函数执行相关方法
        void (^simpleProduct)(float, float) = ^(float a, float b) {
            float total  = a * b;
            NSLog(@"Product = %f", total);
        };
        
        simpleProduct(3, 4);
        
//      (3) 使用 typedef 进行别名的应用
        simpleAdd add = ^(float a, float b){
            float total = a + b;
            return total;
        };
        
        NSLog(@"simpleAdd = %f", add(5, 9));
        
    }
    return self;
}

//- (float)(^simpleProduct)(float, float) = ^(float a, float b) {
//    
//};

/*
 *(1)使用 块 （Block）是注意修改块内容的方式
 *(2)使用 块 （Block）防止造成循环引用
 *(3)使用 块 （Block）使用 handler 降低代码分散度
 *
 */

@end


