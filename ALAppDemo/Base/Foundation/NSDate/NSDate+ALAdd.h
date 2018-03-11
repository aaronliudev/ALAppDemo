//
//  NSDate+ALAdd.h
//  ALAppDemo
//
//  Created by Alan on 2018/2/22.
//  Copyright © 2018年 Alan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (ALAdd)

- (BOOL)isSameDay:(NSDate *)anotherDate;
- (BOOL)isToday;
- (BOOL)isTomorrow;
- (BOOL)isYesterday;
- (BOOL)isInThisWeek;
- (BOOL)isInNextWeek;
- (BOOL)isInLastWeek;
- (BOOL)isInThisMonth;
- (BOOL)isInThisYear;

- (BOOL)isLeapYear;                 /* 是否是闰年 */
- (BOOL)isTypicallyWeekend;         /* 是否是休息日（周六、周天）*/
- (BOOL)isTypicallyWorkday;         /* 是否是工作日 */

- (NSUInteger)daysToToday;          /* 距现在几天 */

- (NSDate *)dateAtBeginOfDay;       /* 指定时间 00：00 */
- (NSDate *)dateAtEndOfDay;         /* 指定时间 23：59 */
- (NSDate *)firstDayInYear;
- (NSDate *)firstDayInMonth;
- (NSDate *)lastDayInMonth;

- (NSString *)weekdayName;          /* 星期一、星期二。。。*/
- (NSString *)weekdayNameShort;     /* 一、二、。。。 */

+ (NSString *)ymdFormatString;          /* yyyy-MM-dd */
+ (NSString *)hmsFormatString;          /* HH:mm:ss */
+ (NSString *)hmFormatString;           /* HH:mm */
+ (NSString *)ymd_hmsFormatString;      /* yyyy-MM-dd HH:mm:ss */
+ (NSString *)ymd_hmFormatString;       /* yyyy-MM-dd HH:mm */

/**
 * 返回规定格式的字符串： 刚刚 、x秒前、 x分钟前、 x小时前、x天前  如果大于两天的话就展示 yyyy-MM-dd
 *
 */
- (NSString *)formattedShowString;

/**
 * 返回规定格式的字符串： 刚刚 、x秒前、 x分钟前、 x小时前、x天前  如果大于两天的话就展示 dateFormat
 *
 */
- (NSString *)formattedShowStringWithFormat:(NSString *)dateFormat;

- (NSInteger)chineseYear;
- (NSInteger)chineseMonth;
- (NSInteger)chineseDay;

- (NSString *)chineseYearString;            /* 甲子、乙丑、丙寅。。。 */
- (NSString *)chineseMonthString;           /* 一月、腊月。。。 */
- (NSString *)chineseDayString;             /* 初一、廿二。。。 */

@end
