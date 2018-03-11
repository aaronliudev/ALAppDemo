//
//  NSMutableDictionary+ALAdd.m
//  ALAppDemo
//
//  Created by Alan on 2018/2/22.
//  Copyright © 2018年 Alan. All rights reserved.
//

#import "NSMutableDictionary+ALAdd.h"

@implementation NSMutableDictionary (ALAdd)

- (void)safelySetObject:(id)object forKey:(NSString *)key
{
    if (!object || !key || key.length == 0)
        return;
    [self setObject:object forKey:key];
}

- (void)setObjectWithEmptyStringPlaceholder:(id)obj forKey:(NSString *)key {
    if (!key) return;
    [self setObject:(obj)?obj:@"" forKey:key];
}

- (void)setObj:(id)value forKey:(NSString*)key{
    if (value!=nil && key && key.length != 0) {
        self[key] = value;
    }
}

- (void)setString:(NSString*)value forKey:(NSString*)key;
{
    if (!key || key.length == 0) {
        return;
    }
    if (!value || value.length == 0) {
        value = @"";
    }
    [self setObject:value forKey:key];
}

- (void)setString:(NSString *)value defaultString:(NSString *)defaultString forKey:(NSString *)key
{
    if (!value || value.length == 0) {
        value = (!defaultString || defaultString.length == 0) ?  @"" : defaultString;
    }
    [self setObject:value forKey:key];
}

- (void)setBool:(BOOL)value forKey:(NSString *)key
{
    if (!key || key.length == 0) {
        return;
    }
    self[key] = @(value);
}

- (void)setInt:(int)value forKey:(NSString *)key
{
    if (!key || key.length == 0) {
        return;
    }
    self[key] = @(value);
}

- (void)setInteger:(NSInteger)value forKey:(NSString *)key
{
    if (!key || key.length == 0) {
        return;
    }
    self[key] = @(value);
}

- (void)setUnsignedInteger:(NSUInteger)value forKey:(NSString *)key
{
    if (!key || key.length == 0) {
        return;
    }
    self[key] = @(value);
}

- (void)setCGFloat:(CGFloat)value forKey:(NSString *)key
{
    if (!key || key.length == 0) {
        return;
    }
    self[key] = @(value);
}

- (void)setChar:(char)value forKey:(NSString *)key
{
    if (!key || key.length == 0) {
        return;
    }
    self[key] = @(value);
}

- (void)setFloat:(float)value forKey:(NSString *)key
{
    if (!key || key.length == 0) {
        return;
    }
    self[key] = @(value);
}

- (void)setDouble:(double)value forKey:(NSString*)key
{
    if (!key || key.length == 0) {
        return;
    }
    self[key] = @(value);
}

- (void)setLongLong:(long long)i forKey:(NSString*)key
{
    if (!key || key.length == 0) {
        return;
    }
    self[key] = @(i);
}

- (void)setPoint:(CGPoint)value forKey:(NSString *)key
{
    if (!key || key.length == 0) {
        return;
    }
    self[key] = NSStringFromCGPoint(value);
}

- (void)setSize:(CGSize)value forKey:(NSString *)key
{
    if (!key || key.length == 0) {
        return;
    }
    self[key] = NSStringFromCGSize(value);
}

- (void)setRect:(CGRect)value forKey:(NSString *)key
{
    if (!key || key.length == 0) {
        return;
    }
    self[key] = NSStringFromCGRect(value);
}

@end
