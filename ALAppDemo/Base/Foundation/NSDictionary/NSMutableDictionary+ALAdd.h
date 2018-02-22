//
//  NSMutableDictionary+ALAdd.h
//  ALAppDemo
//
//  Created by Alan on 2018/2/22.
//  Copyright © 2018年 Alan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (ALAdd)

/// 安全写入数据，会检查 value 和 key 是否为空，key 会检查是否为空字符串，如果是，则不写入
- (void)safelySetObject:(id)object forKey:(NSString *)key;

/// 尝试写入对象，如果为 nil，则写入空字符串，会检查key，如果key为nil，则不写入
- (void)setObjectWithEmptyStringPlaceholder:(id)obj forKey:(NSString *)key;

- (void)setObj:(id)value forKey:(NSString*)key;

- (void)setString:(NSString*)value forKey:(NSString*)key;

- (void)setString:(NSString *)value defaultString:(NSString *)defaultString forKey:(NSString *)key;

/// 以 NSNumber 形式写入 BOOL
- (void)setBool:(BOOL)value forKey:(NSString*)key;

/// 以 NSNumber 形式写入 int
- (void)setInt:(int)value forKey:(NSString*)key;

/// 以 NSNumber 形式写入 NSInteger
- (void)setInteger:(NSInteger)value forKey:(NSString*)key;

- (void)setUnsignedInteger:(NSUInteger)value forKey:(NSString*)key;

- (void)setCGFloat:(CGFloat)value forKey:(NSString*)key;

- (void)setChar:(char)value forKey:(NSString*)key;

/// 以 NSNumber 形式写入 float
- (void)setFloat:(float)value forKey:(NSString*)key;

/// 以 NSNumber 形式写入 double
- (void)setDouble:(double)value forKey:(NSString*)key;

- (void)setLongLong:(long long)value forKey:(NSString*)key;

/// 以 DictionaryRepresentation 形式写入 CGPoint
- (void)setPoint:(CGPoint)value forKey:(NSString*)key;

/// 以 DictionaryRepresentation 形式写入 CGSize
- (void)setSize:(CGSize)value forKey:(NSString*)key;

/// 以 DictionaryRepresentation 形式写入 CGRect
- (void)setRect:(CGRect)value forKey:(NSString*)key;

@end
