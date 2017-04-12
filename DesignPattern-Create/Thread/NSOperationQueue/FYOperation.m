//
//  FYOperation.m
//  DesignPattern-Create
//
//  Created by liangbai on 2017/3/24.
//  Copyright © 2017年 liangbai. All rights reserved.
//

#import "FYOperation.h"
#import "FYGCD.h"

@implementation FYOperation


- (void)main {
    
}


- (void)start {
    
    
}


- (void)cancel {
}

- (void)waitUntilFinished {
    
}

/**
 * (1)使用 performSelector
 *（2）使用 performSelector:withObject:
 *（3）使用 performSelector:withObject:withObject:
 *（4）
 *（5）
 *（6）
 *（7）
 */
- (void)testGCD {
    FYGCD *fyGCD = [[FYGCD alloc] init];
    SEL select;
    if (@(1)) {
        select = @selector(cancel);
    }else if (@(2)){
        select = @selector(start);
    }
    id ret = [fyGCD performSelector:(SEL)select];
    
    [fyGCD performSelector:@selector(cancel) withObject:nil afterDelay:2.0];
    [fyGCD performSelector:@selector(cancel) onThread:nil withObject:nil waitUntilDone:YES];
    [fyGCD performSelectorOnMainThread:nil withObject:nil waitUntilDone:YES];
}

@end
