//
//  BaseView.m
//  DesignPattern-Create
//
//  Created by liangbai on 2017/3/21.
//  Copyright © 2017年 liangbai. All rights reserved.
//

#import "BaseView.h"

@interface BaseView ()

@property(nonatomic, strong) UILabel *label;

@end

@implementation BaseView

- (instancetype)init {
    self = [super init];
    if (self) {
        NSLog(@"初始化 ： init");
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        NSLog(@"初始化 ： initWithFrame");
        _label = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 50, 15)];
        
        _label.font = [UIFont systemFontOfSize:14.0];
        
        [self addSubview:_label];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        NSLog(@"初始化 ： initWithCoder");
    }
    return self;
}

- (void)setLabelTextColor:(UIColor *)labelTextColor {
    _label.textColor = labelTextColor;
}

-(void)setNameOfView:(NSString *)nameOfView{
    _label.text = nameOfView;
}

@end
