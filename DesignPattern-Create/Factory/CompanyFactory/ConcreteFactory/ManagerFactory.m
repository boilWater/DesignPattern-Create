//
//  ManagerFactory.m
//  DesignPattern-Create
//
//  Created by liangbai on 2017/3/1.
//  Copyright © 2017年 liangbai. All rights reserved.
//

#import "ManagerFactory.h"
#import "ManagerProduct.h"

@implementation ManagerFactory

- (DepartmentProduct *)createDepartment {
    DepartmentProduct *managerProduct;
    if (nil == managerProduct) {
        managerProduct = [[ManagerProduct alloc] init];
    }
    return managerProduct;
}

@end
