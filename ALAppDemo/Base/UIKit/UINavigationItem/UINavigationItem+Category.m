//
//  UINavigationItem+Category.m
//  Moments
//
//  Created by Alan on 2017/11/30.
//  Copyright © 2017年 Alan. All rights reserved.
//

#import "UINavigationItem+Category.h"
#import "ALBarButtonView.h"

@implementation UINavigationItem (Category)

#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_7_0
- (void)setLeftBarButtonItem:(UIBarButtonItem *)leftBarButtonItem
{
    if (leftBarButtonItem)
    {
        [self setLeftBarButtonItems:@[leftBarButtonItem]];
    }
}

- (void)setRightBarButtonItem:(UIBarButtonItem *)rightBarButtonItem
{
    if (rightBarButtonItem)
    {
        [self setRightBarButtonItems:@[rightBarButtonItem]];
    }
}

- (void)setRightBarButtonItems:(NSArray *)rightBarButtonItems
{
    UIBarButtonItem *negativeSeperator = [UIBarButtonItem fixedSpaceBarbuttonItem];
    NSMutableArray *right = [[NSMutableArray alloc] init];
    
    if (rightBarButtonItems)
    {
        [right addObject:negativeSeperator];
        [right addObjectsFromArray:rightBarButtonItems];
        [self setRightBarButtonItems:right animated:NO];
    }
    else
    {
        [self setRightBarButtonItems:@[negativeSeperator] animated:NO];
    }
}

- (void)setLeftBarButtonItems:(NSArray *)leftBarButtonItems
{
    UIBarButtonItem *negativeSeperator = [UIBarButtonItem fixedSpaceBarbuttonItem];
    NSMutableArray *right = [[NSMutableArray alloc] init];
    
    if (leftBarButtonItems)
    {
        [right addObject:negativeSeperator];
        [right addObjectsFromArray:leftBarButtonItems];
        [self setLeftBarButtonItems:right animated:NO];
    }
    else
    {
        [self setLeftBarButtonItems:@[negativeSeperator] animated:NO];
    }
}

#endif

@end
