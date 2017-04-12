//
//  ViewB.m
//  DesignPattern-Create
//
//  Created by liangbai on 2017/3/22.
//  Copyright © 2017年 liangbai. All rights reserved.
//

#import "ViewB.h"

@implementation ViewB

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    if (!self.isUserInteractionEnabled || self.isHidden || self.alpha <= 0.01) {
        return nil;
    }
    NSLog(@"ResponderChain : %@", [self class]);
    if ([self pointInside:point withEvent:event]) {
        for (UIView *subView in [self.subviews reverseObjectEnumerator]) {
            CGPoint converPoint = [subView convertPoint:point fromView:self];
            UIView *hitTestView = [subView hitTest:converPoint withEvent:event];
            if (hitTestView) {
                NSLog(@"ViewB : hitTestView -> %@", [hitTestView class]);
                return hitTestView;
            }
        }
        return self;
    }
    return nil;
}


@end
