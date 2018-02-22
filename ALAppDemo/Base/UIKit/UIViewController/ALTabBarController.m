//
//  ALTabBarController.m
//  ALAppDemo
//
//  Created by Alan on 2017/12/11.
//  Copyright © 2017年 Alan. All rights reserved.
//

#import "ALTabBarController.h"

@interface ALTabBarController ()

@end

@implementation ALTabBarController

+ (void)initialize
{
    [[UITabBar appearance] setBackgroundImage:[UIImage new]];
    [[UITabBar appearance] setShadowImage:[UIImage imageWithColor:SepLineColor size:CGSizeMake(SCREEN_WIDTH, AL_1PX_WIDTH)]];
    [[UITabBar appearance] setBackgroundColor:[UIColor whiteColor]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // add subviews
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addSubviews
{
    
}

//MARK: - Orientation
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
    return NO;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

//MARK: - Private Method
- (ALBaseNavigationVC *)createNavVc:(UIViewController *)vc title:(NSString *)title normalImage:(NSString *)normalImgName selectImage:(NSString *)selectImgName
{
    UIImage *normalImage = [[UIImage imageNamed:normalImgName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *selectedImage = [[UIImage imageNamed:selectImgName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UITabBarItem *barItem = [[UITabBarItem alloc] initWithTitle:title image:normalImage selectedImage:selectedImage];
    [barItem setTitleTextAttributes:@{ NSForegroundColorAttributeName : ThemeMainColor } forState:UIControlStateSelected];
    [barItem setTitleTextAttributes:@{ NSForegroundColorAttributeName : GrayTextColor } forState:UIControlStateNormal];
    barItem.titlePositionAdjustment = UIOffsetMake(0, -2);
    vc.tabBarItem = barItem;
    ALBaseNavigationVC *navc = [[ALBaseNavigationVC alloc] initWithRootViewController:vc];
    return navc;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
