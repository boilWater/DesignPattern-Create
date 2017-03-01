//
//  CompanyFactory.m
//  DesignPattern-Create
//
//  Created by liangbai on 2017/3/1.
//  Copyright © 2017年 liangbai. All rights reserved.
//

#import "CompanyFactory.h"

@implementation CompanyFactory

static CompanyFactory *instance = nil;

- (instancetype)shareInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[CompanyFactory alloc] init];
    });
    return instance;
}

- (DepartmentProduct *)createDepartment {
    return nil;
}

@end
