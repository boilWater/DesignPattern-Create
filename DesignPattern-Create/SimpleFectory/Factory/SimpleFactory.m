//
//  SimpleFactory.m
//  DesignPattern-Create
//
//  Created by liangbai on 2017/2/28.
//  Copyright © 2017年 liangbai. All rights reserved.
//

#import "SimpleFactory.h"
#import "Animals.h"
#import "Dogs.h"
#import "Ducks.h"

@implementation SimpleFactory

static SimpleFactory *instance = nil;

+ (instancetype)shareInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[SimpleFactory alloc] init];
    });
    return instance;
}

#pragma mark private methods

- (Animals *)getConcreteAnimals:(NSString *)nameAnimal {
    Animals *animal = nil;
    if ([nameAnimal isEqualToString:@"dog"]) {
        animal = [[Dogs alloc] init];
    }else if ([nameAnimal isEqualToString:@"duck"]){
        animal = [[Ducks alloc] init];
    }
    return animal;
}


@end
