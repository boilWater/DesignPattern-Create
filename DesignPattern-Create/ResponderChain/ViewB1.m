//
//  ViewB1.m
//  DesignPattern-Create
//
//  Created by liangbai on 2017/3/22.
//  Copyright © 2017年 liangbai. All rights reserved.
//

#import "ViewB1.h"

@implementation ViewB1

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
                NSLog(@"ViewB1 : hitTestView -> %@", [hitTestView class]);
                return hitTestView;
            }
        }
        return self;
    }
    return nil;
}


@end
