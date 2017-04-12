//
//  ViewA1.m
//  DesignPattern-Create
//
//  Created by liangbai on 2017/3/21.
//  Copyright © 2017年 liangbai. All rights reserved.
//

#import "ViewA1.h"

@implementation ViewA1

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    if (!self.isUserInteractionEnabled || self.isHidden || self.alpha <= 0.01) {
        return nil;
    }
    NSLog(@"ResponderChain : %@", [self class]);
    CGRect touchRect = CGRectInset(self.bounds, -10, -10);
    if (CGRectContainsPoint(touchRect, point)) {
        for (UIView *subView in [self.subviews reverseObjectEnumerator]) {
            CGPoint converPoint = [subView convertPoint:point fromView:self];
            UIView *hitTestView = [subView hitTest:converPoint withEvent:event];
            if (hitTestView) {
                NSLog(@"ViewA1 : hitTestView -> %@", [hitTestView class]);
                return hitTestView;
            }
        }
        return self;
    }
    return nil;
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UIResponder *next = [self nextResponder];
    NSMutableString *prefix  = @"".mutableCopy;
    
    while (nil != next) {
        NSLog(@"%@%@", prefix, [next class]);
        [prefix appendString:@"--"];
        next = [next nextResponder];
    }
}

@end
