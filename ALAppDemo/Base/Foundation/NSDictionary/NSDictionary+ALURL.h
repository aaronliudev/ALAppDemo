//
//  NSDictionary+ALURL.h
//  ALAppDemo
//
//  Created by Alan on 2018/2/22.
//  Copyright © 2018年 Alan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (ALURL)

/**
 *  @return URL query string component created from the keys and values in
 *  the dictionary. Returns nil for an empty dictionary.
 *  @param sortedKeys Sorted the keys alphabetically?
 *  @see cavetas from the main `NSURL` category as well.
 */
- (NSString *)URLQueryStringWithSortedKeys:(BOOL) sortedKeys;

/**
 *  @brief  将NSDictionary转换成url 参数字符串
 *
 *  @return url 参数字符串
 */
- (NSString *)URLQueryString;
/**
 *  @brief  将url参数转换成NSDictionary
 *
 *  @param query url参数
 *
 *  @return NSDictionary
 */
+ (NSDictionary *)dictionaryWithURLQuery:(NSString *)query;

@end
