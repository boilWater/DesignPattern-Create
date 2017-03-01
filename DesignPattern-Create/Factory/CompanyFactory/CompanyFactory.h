//
//  CompanyFactory.h
//  DesignPattern-Create
//
//  Created by liangbai on 2017/3/1.
//  Copyright © 2017年 liangbai. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DepartmentProduct;

@interface CompanyFactory : NSObject

- (instancetype)shareInstance;

- (DepartmentProduct *)createDepartment;

@end
