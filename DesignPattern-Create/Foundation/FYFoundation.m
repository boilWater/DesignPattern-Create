//
//  FYFoundation.m
//  DesignPattern-Create
//
//  Created by liangbai on 2017/3/28.
//  Copyright © 2017年 liangbai. All rights reserved.
//

#import "FYFoundation.h"

@interface FYFoundation ()

@property (nonatomic, strong) NSArray *array;

@end

@implementation FYFoundation

+ (instancetype)shareInstance {
    static FYFoundation *shareInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstance = [[FYFoundation alloc] init];
    });
    return shareInstance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)testNSArrayUsingFor {
    for (NSString *str in self.array) {
        NSLog(@"str : %@", str);
    }
}

#pragma -mark setter and getter

- (NSArray *)array {
    if (!_array) {
        _array = [NSArray arrayWithObjects:@"Jack", @"Jin", @"Jie", @"Su", nil];
    }
    return _array;
}

@end
