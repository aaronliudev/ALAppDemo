//
//  ALBaseVC.m
//  ALAppDemo
//
//  Created by Alan on 2017/8/30.
//  Copyright © 2017年 Alan. All rights reserved.
//

#import "ALBaseVC.h"
//#import "UINavigationBar+Category.h"
#import "UIBarButtonItem+ALAdd.h"

@interface ALBaseVC () 

@end

@implementation ALBaseVC

//MARK: - Life Cycle
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self configDefaultValue];
    }
    return self;
}

//MARK: - View Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"这是一个测试";
    
    [self setupBackBarButton];
    [self configPopGesture];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    if (![self isNavigationBaseVc]) {
        if (self.popGestureIsDisabled) {
            [self disabledPopGesture];
        }
        else {
            [self configPopGesture];
        }
    }
}

- (void)configDefaultValue
{
    
}

- (void)setupBackBarButton
{
    UIBarButtonItem *backItem = [UIBarButtonItem backBarButtonItemWithTarget:self selector:@selector(leftBtnAction)];
    self.navigationItem.leftBarButtonItem = backItem;
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
}
//MARK: - Public Method
- (void)hideBackBtn
{
    self.navigationItem.leftBarButtonItem = nil;
    [self.navigationItem setHidesBackButton:YES];
}

//MARK: - Navigation list view
- (BOOL)isNavigationBaseVc
{
    return self.navigationController && [[self.navigationController.viewControllers firstObject] isEqual:self];
}

- (BOOL)isNavigationTopVc
{
    return self.navigationController && [[self.navigationController.viewControllers lastObject] isEqual:self];
}

//MARK: - Handler Evnet
- (void)leftBtnAction
{
    if ([self isModal]) { // present
        if([self isNavigationBaseVc]) { // 如果是rootVC，默认dismiss
            [self dismissViewControllerAnimated:YES completion:^{}];
        } else { // 如果不是rootVC，默认返回
            [self.navigationController popViewControllerAnimated:YES];
        }
    } else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

//MARK:- Private Method
//MARK: - Pop Gesture
- (void)configPopGesture
{
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    self.navigationController.interactivePopGestureRecognizer.delegate = (id<UIGestureRecognizerDelegate>)self;
}

- (void)disabledPopGesture
{
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    self.navigationController.interactivePopGestureRecognizer.delegate = nil;
}

/// 返回按钮标题
- (NSString *)leftBtnTitle
{
    if ([self isModal]) { // present
        if([self isNavigationBaseVc]) { // 如果是rootVC，默认显示取消
            return @"取消";
        } else { // 如果不是rootVC，默认显示返回
            return @"返回";
        }
    } else {
        if(![self.navigationController.viewControllers.firstObject isEqual:self]) { // 如果是rootVC，默认显示取消
            return @"返回";
        }
    }
    return nil;
}

/// 是否通过present进来的界面
- (BOOL)isModal
{
    if([self presentingViewController])
        return YES;
    else if([[[self navigationController] presentingViewController] presentedViewController] == [self navigationController])
        return YES;
    else if([[[self tabBarController] presentingViewController] isKindOfClass:[UITabBarController class]])
        return YES;
    return NO;
}

//MARK: - OVerride Method
- (BOOL)shouldAutorotate
{
    return NO;
}

//MARK: - Get Method


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
