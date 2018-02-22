//
//  NSObject+ALAdd.h
//  ALAppDemo
//
//  Created by Alan on 2018/2/22.
//  Copyright © 2018年 Alan. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 use this to encode
 - (void)encodeWithCoder:(NSCoder *)coder
 {
     encodeRuntime([Animal class], coder);
 }
 */
#define encodeRuntime(aClass,aCoder) \
\
unsigned int count = 0;\
Ivar *ivarLists = class_copyIvarList(aClass, &count);\
for (int i = 0; i < count; i++) {\
const char* name = ivar_getName(ivarLists[i]);\
NSString* strName = [NSString stringWithUTF8String:name];\
[aCoder encodeObject:[self valueForKey:strName] forKey:strName];\
}\
free(ivarLists);\
\

/**
 use to decode
 - (instancetype)initWithCoder:(NSCoder *)coder
 {
     initCoderRuntime([Animal class], coder);
 }
 */
#define initCoderRuntime(aClass,aDecoder) \
\
if (self = [super init]) {\
unsigned int count = 0;\
Ivar *ivars = class_copyIvarList(aClass, &count);\
for (int i = 0; i<count; i++) {\
Ivar ivar = ivars[i];\
const char *name = ivar_getName(ivar);\
NSString *key = [NSString stringWithUTF8String:name];\
id value = [aDecoder decodeObjectForKey:key];\
[self setValue:value forKey:key];\
}\
free(ivars);\
}\
return self;\
\

@interface NSObject (ALAdd)

- (BOOL)isNotEmpty;
- (BOOL)isNotEmptyDictionary;
/**
 判断是否有内容，对于一般的对象，等效于 isNotNull，
 对于 NSString, NSArray, NSDictionary 这些，会根据
 .length 或者 .count 来进一步判断是否又内容
 @return YES or NO
 */
- (BOOL)hasContent;

/**
 判断是否为 Dictionary 并且内容
 @return YES or NO
 */
- (BOOL)isDictionaryAndHasEntries;

@end
