//
//  UIBarButtonItem+ALAdd.m
//  ReactiveCocoaTest
//
//  Created by Alan on 2016/11/2.
//  Copyright © 2016年 Alan. All rights reserved.
//

#import "UIBarButtonItem+ALAdd.h"
#import "UIControl+ALAdd.h"
//#import "NSString+Size.h"
#import <YYKit.h>
#import "ALBarButtonView.h"

#define HexRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define HexRGBAlpha(rgbValue, a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:(a)]

#define kDefaultNavigationBarHeight 30
#define kDefaultNavigationBarWidth 44

@implementation UIBarButtonItem (ALAdd)
// NavigationBar-Back

+ (UIBarButtonItem *)backBarButtonItemWithTarget:(id)target selector:(SEL)selector
{
    UIButton *button = [UIBarButtonItem customLeftTextButton:NSLocalizedString(@"返回", nil)];
    button.tag = 10001;
    UIImage *image = [[UIImage imageNamed:@"nav_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [button setImage:image forState:UIControlStateNormal];
    [button setImage:[[UIImage imageNamed:@"nav_back_h"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateHighlighted];
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    button.width = 55;
    button.imageEdgeInsets = UIEdgeInsetsMake(0, -4, 0, 0);
    button.titleEdgeInsets = UIEdgeInsetsMake(0, -2, 0, 0);
    
    ALBarButtonView *btnView = [[ALBarButtonView alloc] initWithFrame:button.frame];
    btnView.position = ALBarButtonViewPositionLeft;
    [btnView addSubview:button];
    
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btnView];
    return barButtonItem;
}

+ (UIBarButtonItem *)backBarButtonItemWithBlock:(void(^)())block
{
    UIButton *button = [UIBarButtonItem customLeftTextButton:NSLocalizedString(@"返回", nil)];
    UIImage *image = [[UIImage imageNamed:@"nav_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [button setImage:image forState:UIControlStateNormal];
    [button setImage:[[UIImage imageNamed:@"nav_back_h"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateHighlighted];
    [button al_addBlockForEvent:UIControlEventTouchUpInside block:block];
    
    button.width = 55;
    button.imageEdgeInsets = UIEdgeInsetsMake(0, -4, 0, 0);
    button.titleEdgeInsets = UIEdgeInsetsMake(0, -2, 0, 0);
    
    ALBarButtonView *btnView = [[ALBarButtonView alloc] initWithFrame:button.frame];
    btnView.position = ALBarButtonViewPositionLeft;
    [btnView addSubview:button];
    
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btnView];
    return barButtonItem;
}

+ (UIBarButtonItem *)leftBarButtonItemWithTitle:(NSString *)title target:(id)target selector:(SEL)selector
{
    UIButton *button = [UIBarButtonItem customLeftTextButton:title];
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    
    ALBarButtonView *btnView = [[ALBarButtonView alloc] initWithFrame:button.frame];
    btnView.position = ALBarButtonViewPositionLeft;
    [btnView addSubview:button];
    
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btnView];
    
    return barButtonItem;
}

+ (UIBarButtonItem *)leftBarButtonItemWithTitle:(NSString *)title block:(ALUIBarButtonBlock)block
{
    UIButton *button = [UIBarButtonItem customLeftTextButton:title];
    [button setTitle:title forState:UIControlStateNormal];
    [button al_addBlockForEvent:UIControlEventTouchUpInside block:block];
    
    ALBarButtonView *btnView = [[ALBarButtonView alloc] initWithFrame:button.frame];
    btnView.position = ALBarButtonViewPositionLeft;
    [btnView addSubview:button];
    
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btnView];
    
    return barButtonItem;
}

+ (UIBarButtonItem *)rightBarButtonItemWithTitle:(NSString *)title target:(id)target selector:(SEL)selector
{
    UIButton *button = [UIBarButtonItem customRightTextButton:title];
    button.tag = 10002;
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    
    ALBarButtonView *btnView = [[ALBarButtonView alloc] initWithFrame:button.frame];
    btnView.position = ALBarButtonViewPositionRight;
    [btnView addSubview:button];
    
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btnView];
    
    return barButtonItem;
}

+ (UIBarButtonItem *)rightBarButtonItemWithTitle:(NSString *)title block:(ALUIBarButtonBlock)block
{
    UIButton *button = [UIBarButtonItem customRightTextButton:title];
    button.tag = 10002;
    [button setTitle:title forState:UIControlStateNormal];
    [button al_addBlockForEvent:UIControlEventTouchUpInside block:block];
    
    ALBarButtonView *btnView = [[ALBarButtonView alloc] initWithFrame:button.frame];
    btnView.position = ALBarButtonViewPositionRight;
    [btnView addSubview:button];
    
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btnView];
    
    return barButtonItem;
}


+ (UIBarButtonItem *)leftBarButtonItemWithImageName:(NSString *)imageName
                               highlightedImageName:(NSString *)highlightedImageName
                                             target:(id)target
                                           selector:(SEL)selector
{
    UIButton *button = [UIBarButtonItem customLeftImageButton];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:highlightedImageName] forState:UIControlStateHighlighted];
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    
    ALBarButtonView *btnView = [[ALBarButtonView alloc] initWithFrame:button.frame];
    btnView.position = ALBarButtonViewPositionLeft;
    [btnView addSubview:button];
    
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btnView];
    
    return barButtonItem;
}

+ (UIBarButtonItem *)leftBarButtonItemWithImageName:(NSString *)imageName
                               highlightedImageName:(NSString *)highlightedImageName
                                              block:(ALUIBarButtonBlock)block
{
    UIButton *button = [UIBarButtonItem customLeftImageButton];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:highlightedImageName] forState:UIControlStateHighlighted];
    [button al_addBlockForEvent:UIControlEventTouchUpInside block:block];
    
    ALBarButtonView *btnView = [[ALBarButtonView alloc] initWithFrame:button.frame];
    btnView.position = ALBarButtonViewPositionLeft;
    [btnView addSubview:button];
    
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btnView];
    
    return barButtonItem;
}

+ (UIBarButtonItem *)rightBarButtonItemWithImageName:(NSString *)imageName
                                highlightedImageName:(NSString *)highlightedImageName
                                              target:(id)target
                                            selector:(SEL)selector
{
    UIButton *button = [UIBarButtonItem customLeftRightImageButton];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:highlightedImageName] forState:UIControlStateHighlighted];
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    
    ALBarButtonView *btnView = [[ALBarButtonView alloc] initWithFrame:button.frame];
    btnView.position = ALBarButtonViewPositionRight;
    [btnView addSubview:button];
    
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btnView];
    
    return barButtonItem;
}

+ (UIBarButtonItem *)rightBarButtonItemWithImageName:(NSString *)imageName
                                highlightedImageName:(NSString *)highlightedImageName
                                               block:(ALUIBarButtonBlock)block
{
    UIButton *button = [UIBarButtonItem customLeftRightImageButton];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:highlightedImageName] forState:UIControlStateHighlighted];
    [button al_addBlockForEvent:UIControlEventTouchUpInside block:block];
    
    ALBarButtonView *btnView = [[ALBarButtonView alloc] initWithFrame:button.frame];
    btnView.position = ALBarButtonViewPositionRight;
    [btnView addSubview:button];
    
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btnView];
    
    return barButtonItem;
}

+ (UIBarButtonItem *)leftBarButtonItemWithImageName:(NSString *)imageName
                                  selectedImageName:(NSString *)selectedImageName
                                             target:(id)target
                                           selector:(SEL)selector
{
    UIButton *button = [UIBarButtonItem customLeftImageButton];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:selectedImageName] forState:UIControlStateSelected];
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    
    ALBarButtonView *btnView = [[ALBarButtonView alloc] initWithFrame:button.frame];
    btnView.position = ALBarButtonViewPositionLeft;
    [btnView addSubview:button];
    
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btnView];
    
    return barButtonItem;
}

+ (UIBarButtonItem *)leftBarButtonItemWithImageName:(NSString *)imageName
                                  selectedImageName:(NSString *)selectedImageName
                                              block:(ALUIBarButtonBlock)block
{
    UIButton *button = [UIBarButtonItem customLeftImageButton];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:selectedImageName] forState:UIControlStateSelected];
    [button al_addBlockForEvent:UIControlEventTouchUpInside block:block];
    
    ALBarButtonView *btnView = [[ALBarButtonView alloc] initWithFrame:button.frame];
    btnView.position = ALBarButtonViewPositionLeft;
    [btnView addSubview:button];
    
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btnView];
    
    return barButtonItem;
}

+ (UIBarButtonItem *)rightBarButtonItemWithImageName:(NSString *)imageName
                                   selectedImageName:(NSString *)selectedImageName
                                              target:(id)target
                                            selector:(SEL)selector
{
    UIButton *button = [UIBarButtonItem customLeftRightImageButton];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:selectedImageName] forState:UIControlStateSelected];
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    
    ALBarButtonView *btnView = [[ALBarButtonView alloc] initWithFrame:button.frame];
    btnView.position = ALBarButtonViewPositionRight;
    [btnView addSubview:button];
    
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btnView];
    
    return barButtonItem;
}

+ (UIBarButtonItem *)rightBarButtonItemWithImageName:(NSString *)imageName
                                   selectedImageName:(NSString *)selectedImageName
                                               block:(ALUIBarButtonBlock)block
{
    UIButton *button = [UIBarButtonItem customLeftRightImageButton];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:selectedImageName] forState:UIControlStateSelected];
    [button al_addBlockForEvent:UIControlEventTouchUpInside block:block];
    
    ALBarButtonView *btnView = [[ALBarButtonView alloc] initWithFrame:button.frame];
    btnView.position = ALBarButtonViewPositionRight;
    [btnView addSubview:button];
    
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btnView];
    
    return barButtonItem;
}

+ (UIButton *)customLeftImageButton
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, kDefaultNavigationBarWidth, kDefaultNavigationBarHeight);
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    button.backgroundColor = [UIColor clearColor];
    return button;
}

+ (UIButton *)customLeftRightImageButton
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, kDefaultNavigationBarWidth, kDefaultNavigationBarHeight);
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    button.backgroundColor = [UIColor clearColor];
    return button;
}


+ (UIButton *)customLeftTextButton:(NSString *)title
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    button.backgroundColor = [UIColor clearColor];
    [button setTitleColor:HexRGB(0x191a1c) forState:UIControlStateNormal];
    [button setTitleColor:HexRGBAlpha(0x191a1c, 0.3) forState:UIControlStateHighlighted];
    [button setTitleColor:HexRGBAlpha(0x191a1c, 0.3) forState:UIControlStateDisabled];
    [button setTitle:title forState:UIControlStateNormal];
    UIFont *font = [UIFont systemFontOfSize:16];
    [button.titleLabel setFont:font];
//    CGFloat width = [title widthWithFont:font constrainedToHeight:kDefaultNavigationBarHeight];
//    width += 6;
//    if (width < kDefaultNavigationBarWidth)
    {
//        CGFloat width = kDefaultNavigationBarWidth;
    }
    CGFloat width = kDefaultNavigationBarWidth;
    button.frame = CGRectMake(0, 0, width, kDefaultNavigationBarHeight);
//    button.titleEdgeInsets = UIEdgeInsetsMake(0, -4, 0, 0);
    
    return button;
}

+ (UIButton *)customRightTextButton:(NSString *)title
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    button.backgroundColor = [UIColor clearColor];
    [button setTitleColor:HexRGB(0x191a1c) forState:UIControlStateNormal];
    [button setTitleColor:HexRGBAlpha(0x191a1c, 0.3) forState:UIControlStateHighlighted];
    [button setTitleColor:HexRGBAlpha(0x191a1c, 0.3) forState:UIControlStateDisabled];
    [button setTitle:title forState:UIControlStateNormal];
    UIFont *font = [UIFont systemFontOfSize:16];
    [button.titleLabel setFont:font];
//    CGFloat width = [title widthWithFont:font constrainedToHeight:kDefaultNavigationBarHeight];
//    width += 6;
//    if (width < kDefaultNavigationBarWidth)
    {
//        CGFloat width = kDefaultNavigationBarWidth;
    }
    CGFloat width = kDefaultNavigationBarWidth;
    button.frame = CGRectMake(0, 0, width, kDefaultNavigationBarHeight);
//    button.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -4);
    
    return button;
}

+ (UIBarButtonItem *)fixedSpaceBarbuttonItem
{
    // 调整下位置，和ui设置相比离左边有点远
    UIBarButtonItem *fixedButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    if ([[UIScreen mainScreen] scale] > 2.f) {
        fixedButton.width = -8;
    }
    else {
        fixedButton.width = -4;
    }
    
    return fixedButton;
}

@end
