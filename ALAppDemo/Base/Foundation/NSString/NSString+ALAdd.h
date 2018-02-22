//
//  NSString+ALAdd.h
//  ALAppDemo
//
//  Created by Alan on 2018/2/22.
//  Copyright © 2018年 Alan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ALAdd)

/// 是否是正确的邮箱地址
- (BOOL)isEmail;

/// 是否是大陆手机号
- (BOOL)isPhoneNumber;
/// 是否是有效身份证号
- (BOOL)isIDCardNumberOfPRC;

/// 是否是有效的验证码
- (BOOL)isValidVerifyCode;

/// 防止含有emoji表情时造成crash ToIndex
- (NSString *)substringSafelyAtIndex:(NSUInteger)index;

/// 移除空格
- (NSString *)trimmingWhitespace;
/// 移除所有空格和换行
- (NSString *)trimmingWhitespaceAndNewlines;

@end
