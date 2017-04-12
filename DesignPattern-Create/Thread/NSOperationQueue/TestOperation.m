//
//  TestOperation.m
//  DesignPattern-Create
//
//  Created by liangbai on 2017/3/24.
//  Copyright © 2017年 liangbai. All rights reserved.
//

#import "TestOperation.h"

@implementation TestOperation

- (void)useOperationQueue {
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    NSOperation *operationA = [[NSOperation alloc] init];
    NSOperation *operationB = [[NSOperation alloc] init];
    
    [operationA addDependency:operationB];
     
    
    [queue addOperation:operationA];
    [queue addOperation:operationB];
    
//TODO 1    确保 operationB 在 operationA 之前执行
    
//TODO 2    使用 operationQueueBlock
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        
    }];
    
    
}

/*👇🏼👇🏼👇🏼👇🏼👇🏼👇🏼👇🏼👇🏼👇🏼👇🏼👇🏼👇🏼👇🏼👇🏼👇🏼👇🏼👇🏼👇🏼👇🏼👇🏼👇🏼👇🏼👇🏼👇🏼👇🏼👇🏼👇🏼👇🏼👇🏼👇🏼👇🏼👇🏼👇🏼👇🏼👇🏼👇🏼👇🏼👇🏼👇🏼👇🏼
 (1) Operation 设置线程执行的顺序
 (2) OperationQueue 添加线程到线程池
 
 (3)主线程一般设置好 runloop, 其他线程默认情况下不设置 runloop
 
 (4)线程的并发
    ①竞态条件 ~ 需要采用互斥的机制来实现对竞态并发的解决
 
    ②
 
👆🏻👆🏻👆🏻👆🏻👆🏻👆🏻👆🏻👆🏻👆🏻👆🏻👆🏻👆🏻👆🏻👆🏻👆🏻👆🏻👆🏻👆🏻👆🏻👆🏻👆🏻👆🏻👆🏻👆🏻👆🏻👆🏻👆🏻👆🏻👆🏻👆🏻👆🏻👆🏻👆🏻👆🏻👆🏻👆🏻👆🏻👆🏻👆🏻👆🏻*/

@end
