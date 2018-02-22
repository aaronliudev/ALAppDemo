//
//  NSDictionary+ALURL.m
//  ALAppDemo
//
//  Created by Alan on 2018/2/22.
//  Copyright © 2018年 Alan. All rights reserved.
//

static NSString *const kURLReservedChars  = @"￼=,!$&'()*+;@?\r\n\"<>#\t :/";
static NSString *const kQuerySeparator      = @"&";
static NSString *const kQueryDivider        = @"=";

#import "NSDictionary+ALURL.h"

@implementation NSDictionary (ALURL)
static inline NSString *URLEscape(NSString *string);

- (NSString *)URLQueryString
{
    return [self URLQueryStringWithSortedKeys:NO];
}

- (NSString*) URLQueryStringWithSortedKeys:(BOOL)sortedKeys
{
    NSMutableString *queryString = @"".mutableCopy;
    NSArray *keys = sortedKeys ? [self.allKeys sortedArrayUsingSelector:@selector(compare:)] : self.allKeys;
    for (NSString *key in keys) {
        id rawValue = self[key];
        NSString *value = nil;
        // beware of empty or null
        if (!(rawValue == [NSNull null] || ![rawValue description].length)) {
            value = URLEscape([self[key] description]);
        }
        [queryString appendFormat:@"%@%@%@%@",
         queryString.length ? kQuerySeparator : @"",    // appending?
         URLEscape(key),
         value ? kQueryDivider : @"",
         value ? value : @""];
    }
    return queryString.length ? queryString.copy : nil;
}

static inline NSString *URLEscape(NSString *string)
{
    return ((__bridge_transfer NSString *)CFURLCreateStringByAddingPercentEscapes(
                                                                                  NULL,
                                                                                  (__bridge CFStringRef)string,
                                                                                  NULL,
                                                                                  (__bridge CFStringRef)kURLReservedChars,
                                                                                  kCFStringEncodingUTF8));
}

+ (NSDictionary *)dictionaryWithURLQuery:(NSString *)query
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    NSArray *parameters = [query componentsSeparatedByString:@"&"];
    for(NSString *parameter in parameters) {
        NSArray *contents = [parameter componentsSeparatedByString:@"="];
        if([contents count] == 2) {
            NSString *key = [contents objectAtIndex:0];
            NSString *value = [contents objectAtIndex:1];
            value = [value stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            if (key && value) {
                [dict setObject:value forKey:key];
            }
        }
    }
    return [NSDictionary dictionaryWithDictionary:dict];
}

@end
