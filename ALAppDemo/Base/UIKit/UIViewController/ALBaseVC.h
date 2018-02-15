//
//  ALBaseVC.h
//  ALAppDemo
//
//  Created by Alan on 2017/8/30.
//  Copyright © 2017年 Alan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ALBaseVC : UIViewController

/// 禁用左滑返回手势
@property (nonatomic, assign) BOOL popGestureIsDisabled;

/// 隐藏返回按钮
- (void)hideBackBtn;
/// is navigation base view
- (BOOL)isNavigationBaseVc;
/// is navigation top view
- (BOOL)isNavigationTopVc;

/// 返回按钮点击事件
- (void)leftBtnAction;

@end
