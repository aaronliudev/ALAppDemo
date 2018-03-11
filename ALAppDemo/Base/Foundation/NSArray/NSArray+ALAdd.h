//
//  NSArray+ALAdd.h
//  ALAppDemo
//
//  Created by Alan on 2018/2/22.
//  Copyright © 2018年 Alan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (ALAdd)

- (nullable NSString *)JSONString;

/// 安全的获取数组中的某个元素
- (nullable id)safelyObjectAtIndex:(NSUInteger)index;

/// 去重
- (nonnull NSArray *)unique;

/// 反序
- (nonnull NSArray *)reversedArray;

/// 获取数组中从index开始后面的所有元素
- (nonnull NSArray *)subArrayFromIndex:(NSUInteger)index;

/// 某个元素所在的位置
- (NSUInteger)safelyIndexOfObject:(id _Nullable )anObject;

/// 移除第一个对象
- (NSArray *_Nullable)removeFirstObject;

/// 移除最后一个对象
- (NSArray *_Nullable)removeLastObject;

- (NSString*_Nullable)stringWithIndex:(NSUInteger)index;

- (NSNumber*_Nullable)numberWithIndex:(NSUInteger)index;

- (NSDecimalNumber *_Nullable)decimalNumberWithIndex:(NSUInteger)index;

- (NSArray*_Nullable)arrayWithIndex:(NSUInteger)index;

- (NSDictionary*_Nullable)dictionaryWithIndex:(NSUInteger)index;

- (NSInteger)integerWithIndex:(NSUInteger)index;

- (NSUInteger)unsignedIntegerWithIndex:(NSUInteger)index;

- (BOOL)boolWithIndex:(NSUInteger)index;

- (int16_t)int16WithIndex:(NSUInteger)index;

- (int32_t)int32WithIndex:(NSUInteger)index;

- (int64_t)int64WithIndex:(NSUInteger)index;

- (char)charWithIndex:(NSUInteger)index;

- (short)shortWithIndex:(NSUInteger)index;

- (float)floatWithIndex:(NSUInteger)index;

- (double)doubleWithIndex:(NSUInteger)index;

- (NSDate *_Nullable)dateWithIndex:(NSUInteger)index dateFormat:(NSString *_Nullable)dateFormat;
//CG
- (CGFloat)CGFloatWithIndex:(NSUInteger)index;

- (CGPoint)pointWithIndex:(NSUInteger)index;

- (CGSize)sizeWithIndex:(NSUInteger)index;

- (CGRect)rectWithIndex:(NSUInteger)index;

@end
