//
//  Animals.m
//  DesignPattern-Create
//
//  Created by liangbai on 2017/2/28.
//  Copyright © 2017年 liangbai. All rights reserved.
//

#import "Animals.h"

@implementation Animals

- (NSInteger)sumOfLegs {
    [self needOverrideWriteWithMethodName:@"sumOfLegs"];
    return 0;
}

- (void)eat {
    [self needOverrideWriteWithMethodName:@"eat"];
}

- (NSString *)vocalise {
    [self needOverrideWriteWithMethodName:@"vocalise"];
    return nil;
}

- (void)needOverrideWriteWithMethodName:(NSString *)methodName{
    @throw [NSException exceptionWithName:NSStringFromClass([self class]) reason:@"Method must override in Animals Class" userInfo:@{
                                                                                                                                     @"name":methodName,
                                                                                                                                     @"class":NSStringFromClass([self class])
                                                                                                                                     }];
}

@end
