//
//  UINavigationBar+Category.m
//  ALAppDemo
//
//  Created by Alan on 2017/9/4.
//  Copyright © 2017年 Alan. All rights reserved.
//

#import "UINavigationBar+Category.h"

@implementation UINavigationBar (Category)

- (void)layoutSubviews
{
    [super layoutSubviews];
    UIView *subview = [self viewWithTag:10001];
    if (subview) {
        CGRect frame = subview.frame;
        // iOS 10 frame =(20, 7)(55, 30)
        // iOS 11 frame =(0, 0)(55, 30)
//        frame.origin.x = 12;
//        frame.origin.y = (CGRectGetHeight(self.bounds)-CGRectGetHeight(frame))*0.5 + kDefaultNavigationDelY;
//        subview.frame = frame;
    }
    
    subview = [self viewWithTag:10002];
    if (subview) {
        CGRect frame = subview.frame;
        // iOS11 frame = (0,0)(44,32)
        // iOS10 frame = (350,7)(44,30)
//        frame.origin.x = -12;
//        frame.origin.x = CGRectGetWidth(self.bounds)-CGRectGetWidth(frame);
//        frame.origin.y = (CGRectGetHeight(self.bounds)-CGRectGetHeight(frame))*0.5 + kDefaultNavigationDelY;
//        subview.frame = frame;
    }

    subview = [self viewWithTag:10003];
    if (subview) {
        CGRect frame = subview.frame;
        frame.origin.x = (CGRectGetWidth(self.bounds)-CGRectGetWidth(frame))*0.5;
//        frame.origin.y = (CGRectGetHeight(self.bounds)-CGRectGetHeight(frame))*0.5 + kDefaultNavigationDelY;
        subview.frame = frame;
    }
}


@end
