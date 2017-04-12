//
//  FYGCD.m
//  DesignPattern-Create
//
//  Created by liangbai on 2017/3/28.
//  Copyright © 2017年 liangbai. All rights reserved.
//

#import "FYGCD.h"
#import <UIKit/UIKit.h>

@interface FYGCD ()

@property(nonatomic, strong) NSString *animalSubjects;
@property(nonatomic, strong) NSString *monkey;
@property(nonatomic, strong) dispatch_source_t timer;

@end

@implementation FYGCD

+ (instancetype)shareInstance {
    static FYGCD *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[FYGCD alloc] init];
    });
    return instance;
}

- (void)testGCD {
    
/************************ dispatch queue ***************************/
    
    dispatch_queue_t queue = dispatch_queue_create("com.effectiveobject.syncQueue", NULL);
    dispatch_sync(queue, ^{
//        同步执行的内容
    });
    
    
    dispatch_barrier_sync(queue, ^{
//        并发队列中使用栅栏队列，在执行过程中只能单独执行(同步)
    });
    dispatch_barrier_async(queue, ^{
//        并发队列中使用栅栏队列，在执行过程中只能单独执行(异步)
    });
    
/******************** dispatch_group 的所用方式 **********************/
    
//（1）指定任务所属的小组
//    GCD 的小组执行情况,指定线程执行的所在小组（dispatch_group_t）
//    和 dispatch_async 使用类似，只是指定 block 执行所在的组
    dispatch_group_t patchGroup = dispatch_group_create();
    dispatch_queue_t patahQueue = dispatch_queue_create("com.jineffectiveobject.syncGroup", NULL);
    dispatch_group_async(patchGroup, patahQueue, ^{
//        指定执行的 block 所在的 group
    });

//（2）指定任务所属的小组
    dispatch_group_enter(patchGroup);
    
    dispatch_group_leave(patchGroup);
//    不知道怎么使用？😎
    
//（3）等待 dispatch group 执行完全
//    dispatch_time_t patchTime = 20;
//    dispatch_group_wait : 是在可以设置等待 group 完成的时间
//    dispatch_group_notify : 可以指定等待 group 后，在哪个线程执行 block 块
    dispatch_group_wait(patchGroup, DISPATCH_TIME_FOREVER);
    dispatch_group_notify(patchGroup, dispatch_get_main_queue(), ^{
        
    });
    
//（4）在主线程的 group 完成后 执行 block
    //创建 线程group和创建一个全局线程
    //把要执行的任务和线程 group & 线程绑定
    //执行线程 group 在主线程中调用 方法2
    NSArray *array = @[@"jack", @"jin", @"liang", @"bai"];
//    串行队列
    dispatch_group_t mainGroup = dispatch_group_create();
    
//    并行队列
    dispatch_queue_t highPatchQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
    dispatch_queue_t defaultQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_queue_t lowQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0);
    
    dispatch_queue_t backgroundQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    
//    自定义串行和并行队列
    dispatch_queue_t customSerialQueue = dispatch_queue_create("com.jinCreateSerialQueue", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t customConCurrentQueue = dispatch_queue_create("com.jinCreateConCurrentQueue", DISPATCH_QUEUE_CONCURRENT);
//    在自定义的队列中设置明显的标签, 默认的情况下是串行
    NSString *tags = [NSString stringWithFormat:@"%@.islation.%p", [self class], self];
    dispatch_queue_t customTagsSerialQueue = dispatch_queue_create([tags UTF8String], 0);   
    
    for (NSString *str in array) {
        dispatch_group_async(mainGroup, highPatchQueue, ^{
            NSLog(@"str : %@", str);
        });
    }
    
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    dispatch_group_notify(mainGroup, mainQueue, ^{
//        方法2
    });
    
//    (5)循环执行语句 for
    dispatch_queue_t loopQueue = dispatch_queue_create("com.jineffectivestudy.syncApply", 0);
    dispatch_apply(9, loopQueue, ^(size_t i) {
        
    });
    
//    (6)执行一次的
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
    });
    
//  （7）在一段时间后执行,使用方式类似于 NSTimer
    double delayInSeconds = 2.0;
    dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(delayTime, dispatch_get_main_queue(), ^{
        
    });
}


//监视进程
- (void)monitoringProcessOnDispatch {
//    NSRunningApplication 
}

//GCD实现定时器 dispatch_time_t
- (void)timerOnDispatch {
    self.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
    dispatch_time_t start = dispatch_time(DISPATCH_TIME_NOW, (int64_t)1*NSEC_PER_SEC);
    uint64_t interval = (int64_t)1 * NSEC_PER_SEC;
    dispatch_source_set_timer(self.timer, start, interval, 0);
    __block NSInteger count = 0;
    dispatch_source_set_event_handler(self.timer, ^{
        NSLog(@"%@在 %ld 使用GCD调用定时器在.%p", [self class], count, self);
        count++;
    });
    dispatch_resume(self.timer);
}

//GCD实现数据缓存，dispatch_data_t 可以利用碎片化内存


//测试 serial GCD
- (void)serialGCD {
    __block NSInteger count = 0;
    NSString *queueLabel = [NSString stringWithFormat:@"%@.isaloution%p.inSerialGCD", [self class], self];
    dispatch_queue_t serialQueue = dispatch_queue_create([queueLabel UTF8String], DISPATCH_QUEUE_SERIAL);
    dispatch_async(serialQueue, ^{
        NSLog(@"第 %ld 个线程在队列：%@", (long)count, queueLabel);
        count++;
    });
    
    dispatch_async(serialQueue, ^{
        NSLog(@"第 %ld 个线程在队列：%@", (long)count, queueLabel);
        count++;
    });
    
    dispatch_async(serialQueue, ^{
        NSLog(@"第 %ld 个线程在队列：%@", (long)count, queueLabel);
        count++;
    });
}

- (void)currentGCD {
    __block NSInteger count = 0;
    NSString *queueLabel = [NSString stringWithFormat:@"%@.isaloution%p.inCurrentGCD", [self class], self];
    dispatch_queue_t serialQueue = dispatch_queue_create([queueLabel UTF8String], DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(serialQueue, ^{
        NSLog(@"第 %ld 个线程在队列：%@", (long)count, queueLabel);
        count++;
    });
    
    dispatch_async(serialQueue, ^{
        NSLog(@"第 %ld 个线程在队列：%@", (long)count, queueLabel);
        count++;
    });
    
    dispatch_async(serialQueue, ^{
        NSLog(@"第 %ld 个线程在队列：%@", (long)count, queueLabel);
        count++;
    });
    
    dispatch_async(serialQueue, ^{
        NSLog(@"第 %ld 个线程在队列：%@", (long)count, queueLabel);
        count++;
    });

    
    dispatch_async(serialQueue, ^{
        NSLog(@"第 %ld 个线程在队列：%@", (long)count, queueLabel);
        count++;
    });

    dispatch_async(serialQueue, ^{
        NSLog(@"第 %ld 个线程在队列：%@", (long)count, queueLabel);
        count++;
    });

    dispatch_async(serialQueue, ^{
        NSLog(@"第 %ld 个线程在队列：%@", (long)count, queueLabel);
        count++;
    });

}


@end





