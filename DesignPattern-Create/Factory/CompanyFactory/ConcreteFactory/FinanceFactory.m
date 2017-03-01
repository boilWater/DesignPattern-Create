//
//  FinanceFactory.m
//  DesignPattern-Create
//
//  Created by liangbai on 2017/3/1.
//  Copyright © 2017年 liangbai. All rights reserved.
//

#import "FinanceFactory.h"
#import "FinanceProduct.h"

@implementation FinanceFactory

- (DepartmentProduct *)createDepartment {
    DepartmentProduct *financeProduct;
    if (nil == financeProduct) {
        financeProduct = [[FinanceProduct alloc] init];
    }
    return financeProduct;
}

@end
