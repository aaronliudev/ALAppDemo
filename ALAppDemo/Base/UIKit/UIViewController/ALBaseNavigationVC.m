//
//  ALBaseNavigationVC.m
//  ALAppDemo
//
//  Created by Alan on 2017/12/25.
//  Copyright © 2017年 Alan. All rights reserved.
//

#import "ALBaseNavigationVC.h"

@interface ALBaseNavigationVC ()

@end

@implementation ALBaseNavigationVC

+ (void)initialize
{
    [[UINavigationBar appearance] setTintColor:BlackTextColor];
//    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithHex:0xF6F6F7 andAlpha:1]];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18],
                                                           NSForegroundColorAttributeName:BlackTextColor}];
    // 要设置那条细线，需要设置background Image
    [[UINavigationBar appearance] setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setShadowImage:[UIImage imageNamed:@"navigationBar_line"]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//MARK:- Override Method
//MARK:- UIStatusBarStyle
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return [self.topViewController preferredStatusBarStyle];
}

//MARK:- Orientation
- (BOOL)shouldAutorotate
{
    return NO;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationPortrait;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return interfaceOrientation == UIDeviceOrientationPortrait ;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

@end
