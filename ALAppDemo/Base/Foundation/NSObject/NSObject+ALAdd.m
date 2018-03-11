//
//  NSObject+ALAdd.m
//  ALAppDemo
//
//  Created by Alan on 2018/2/22.
//  Copyright © 2018年 Alan. All rights reserved.
//

#import "NSObject+ALAdd.h"

@implementation NSObject (ALAdd)

- (BOOL)isNotEmpty
{
    return !(self == nil
             || [self isKindOfClass:[NSNull class]]
             || ([self respondsToSelector:@selector(length)]
                 && [(NSString *)self length] == 0)
             || ([self respondsToSelector:@selector(count)]
                 && [(NSArray *)self count] == 0));
}

- (BOOL)isNotEmptyDictionary
{
    if ([self isNotEmpty]){
        return [self isKindOfClass:[NSDictionary class]];
    }
    
    return NO;
}

- (BOOL)hasContent {
    return !([self isKindOfClass:[NSNull class]] || ([self respondsToSelector:@selector(length)] && [(NSData *)self length] == 0) || ([self respondsToSelector:@selector(count)] && ([(NSArray *)self count] == 0)));
}

- (BOOL)isDictionaryAndHasEntries {
    return [self isKindOfClass:[NSDictionary class]] && [self hasContent];
}

@end
