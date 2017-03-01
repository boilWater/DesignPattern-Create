//
//  SimpleFactory.h
//  DesignPattern-Create
//
//  Created by liangbai on 2017/2/28.
//  Copyright © 2017年 liangbai. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Animals;

@interface SimpleFactory : NSObject

+ (instancetype)shareInstance;

- (Animals *)getConcreteAnimals:(NSString *)nameAnimal;

@end
