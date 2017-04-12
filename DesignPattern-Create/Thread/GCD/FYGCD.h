//
//  FYGCD.h
//  DesignPattern-Create
//
//  Created by liangbai on 2017/3/28.
//  Copyright © 2017年 liangbai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FYGCD : NSObject

+ (instancetype)shareInstance;

- (void)timerOnDispatch;

//测试线性队列
- (void)serialGCD;

- (void)currentGCD;

@end
