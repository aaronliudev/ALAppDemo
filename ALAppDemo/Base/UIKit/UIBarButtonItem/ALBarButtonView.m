//
//  ALBarButtonView.m
//  ALAppDemo
//
//  Created by Alan on 2017/11/30.
//  Copyright © 2017年 Alan. All rights reserved.
//

#import "ALBarButtonView.h"

@interface ALBarButtonView ()

@property (nonatomic, assign) BOOL s_applied;

@end

@implementation ALBarButtonView

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // iOS11 Find The UIButtonBarStackView
    if (self.s_applied || [[[UIDevice currentDevice] systemVersion] doubleValue]  < 11)
    {
        return;
    }
    
    // Find the _UIButtonBarStackView containing this view, which is a UIStackView, up to the UINavigationBar
    UIView *view = self;
    while (![view isKindOfClass:[UINavigationBar class]] && [view superview] != nil)
    {
        view = [view superview];
        if ([view isKindOfClass:[UIStackView class]] && [view superview] != nil)
        {
            if (self.position == ALBarButtonViewPositionLeft)
            {
                [view.superview addConstraint:[NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:view.superview attribute:NSLayoutAttributeLeading multiplier:1.0 constant:4]];
                self.s_applied = YES;
            }
            else if (self.position == ALBarButtonViewPositionRight)
            {
                [view.superview addConstraint:[NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:view.superview attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:-4.0]];
                self.s_applied = YES;
            }
            break;
        }
    }
}

@end
