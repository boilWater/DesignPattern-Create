//
//  ViewA.m
//  DesignPattern-Create
//
//  Created by liangbai on 2017/3/21.
//  Copyright © 2017年 liangbai. All rights reserved.
//

#import "ViewA.h"

@implementation ViewA

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    if (!self.isUserInteractionEnabled || self.hidden || self.alpha <= 0.01) {
        return nil;
    }
    NSLog(@"ResponderChain : %@", [self class]);
    if ([self pointInside:point withEvent:event]) {
        for (UIView *subView in [self.subviews reverseObjectEnumerator]) {
            CGPoint converPoin = [subView convertPoint:point fromView:self];
            UIView *hitTestView = [subView hitTest:converPoin withEvent:event];
            if (hitTestView) {
                NSLog(@"ViewA : hitTestView -> %@", [hitTestView class]);
                return hitTestView;
            }
        }
        return self;
    }
    return nil;
}

@end
