//
//  ViewController.m
//  DesignPattern-Create
//
//  Created by liangbai on 2017/2/28.
//  Copyright © 2017年 liangbai. All rights reserved.
//

#import "ViewController.h"
#import "SimpleFactory.h"
#import "Animals.h"

//DesignPattern Company
#import "CompanyFactory.h"
#import "ManagerFactory.h"
#import "FinanceFactory.h"
#import "DepartmentProduct.h"
#import "ManagerProduct.h"
#import "FinanceProduct.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Animals *animal = [[SimpleFactory shareInstance] getConcreteAnimals:@"dog"];
    [animal sumOfLegs];
    [animal vocalise];
    [animal eat];
    
    [self testDesignPatternFactory];
}

- (void)testDesignPatternFactory {
    
    CompanyFactory *companyFactory = [[ManagerFactory alloc] init];
    DepartmentProduct *departmentProduct = companyFactory.createDepartment;
    
    [departmentProduct functionDepartment];
    [departmentProduct nameDepartment];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
