//
//  ALBarButtonView.h
//  ALAppDemo
//
//  Created by Alan on 2017/11/30.
//  Copyright © 2017年 Alan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ALBarButtonViewPosition) {
    ALBarButtonViewPositionLeft,
    ALBarButtonViewPositionRight,
};

@interface ALBarButtonView : UIView

@property (nonatomic, assign) ALBarButtonViewPosition position;

@end
