//
//  NSDate+ALAdd.m
//  ALAppDemo
//
//  Created by Alan on 2018/2/22.
//  Copyright © 2018年 Alan. All rights reserved.
//

#import "NSDate+ALAdd.h"

@implementation NSDate (ALAdd)

+ (NSDateFormatter *)sharedDateFormatter_commonCategory {
    static NSDateFormatter *_sharedDateFormatter_commonCategory;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedDateFormatter_commonCategory = [[NSDateFormatter alloc] init];
    });
    return _sharedDateFormatter_commonCategory;
}

/**
 *  日期是否相等
 *
 */
- (BOOL)isSameDay:(NSDate *)anotherDate
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components1 = [calendar components:(NSCalendarUnitYear
                                                          | NSCalendarUnitMonth
                                                          | NSCalendarUnitDay)
                                                fromDate:self];
    NSDateComponents *components2 = [calendar components:(NSCalendarUnitYear
                                                          | NSCalendarUnitMonth
                                                          | NSCalendarUnitDay)
                                                fromDate:anotherDate];
    return ([components1 year] == [components2 year]
            && [components1 month] == [components2 month]
            && [components1 day] == [components2 day]);
}


/**
 *  是否是今天
 *
 */
- (BOOL)isToday
{
    return [self isSameDay:[NSDate date]];
}

/**
 *  是否是明天
 *
 */
- (BOOL)isTomorrow
{
    return [self isSameDay:[[NSDate date] dateByAddingDays: 1]];
}

/**
 *  是否是昨天
 *
 */
- (BOOL)isYesterday
{
    return [self isSameDay:[[NSDate date] dateByAddingDays: -1]];
}

/**
 *  是否在本周
 *
 */
- (BOOL)isInThisWeek
{
    return [self weekOfYear] == [[NSDate date] weekOfYear];
}

/**
 *  是否在下周
 *
 */
- (BOOL)isInNextWeek
{
    return [self weekOfYear] == ([[NSDate date] weekOfYear] + 1);
}

/**
 *  是否在上周
 *
 */
- (BOOL)isInLastWeek
{
    return [self weekOfYear] == ([[NSDate date] weekOfYear] - 1);
}

/**
 *  是否在本月
 *
 */
- (BOOL)isInThisMonth
{
    return [self month] == [[NSDate date] month];
}

/**
 *  是否在今年
 *
 */
- (BOOL)isInThisYear
{
    return [self year] == [[NSDate date] year];
}


/**
 *  是否在闰年
 *
 */
- (BOOL)isLeapYear
{
    NSUInteger year = [self year];
    if ((year % 4  == 0 && year % 100 != 0) || year % 400 == 0)
    {
        return YES;
    }
    return NO;
}

/**
 *  是否是休息日（周六、周天）
 *
 */
- (BOOL)isTypicallyWeekend
{
    return [self weekday] == 7 || [self weekday] == 1;
}

/**
 *  是否是工作日
 *
 */
- (BOOL)isTypicallyWorkday
{
    return ![self isTypicallyWeekend];
}

/**
 * 距离现在时间有几天
 *
 */
- (NSUInteger)daysToToday
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSCalendarUnitDay)
                                               fromDate:self
                                                 toDate:[NSDate date]
                                                options:0];
    return [components day];
}

/**
 * 当天00：00
 *
 */
- (NSDate *)dateAtBeginOfDay;       // 指定时间 00：00
{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear| NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond  ) fromDate:self];
    components.hour = 0;
    components.minute = 0;
    components.second = 0;
    return [[NSCalendar currentCalendar] dateFromComponents:components];
}

/**
 * 当天23：59
 *
 */
- (NSDate *)dateAtEndOfDay         // 指定时间 23：59: 59
{
    NSDate *tomorrow = [self dateByAddingDays:1];
    NSDate *tomorrowStartDate = [tomorrow dateAtBeginOfDay];
    NSTimeInterval ts = [tomorrowStartDate timeIntervalSince1970];
    ts -= 1;
    return [NSDate dateWithTimeIntervalSince1970:ts];
}

/**
 * 该年第一天
 *
 */
- (NSDate *)firstDayInYear
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setYear:[self year]];
    NSDate *beginOfYear = [calendar dateFromComponents:components];
    return beginOfYear;
}

/**
 * 该月第一天
 *
 */
- (NSDate *)firstDayInMonth    // 该月的第一天的日期
{
    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *firstDateCpt = [self dateCompontentsWithYMDHMSWWFormat];
    firstDateCpt.day = 1;
    NSDate *firstDate = [gregorianCalendar dateFromComponents:firstDateCpt];
    return firstDate;
}

/**
 * 该月最后一天
 *
 */
- (NSDate *)lastDayInMonth     // 该月的最后一天的日期
{
    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *lastDateCpt = [self dateCompontentsWithYMDHMSWWFormat];
    NSInteger month = lastDateCpt.month;
    NSInteger year = lastDateCpt.year;
    if (month==12) {
        month = 1;
        year += 1;
    }else{
        month += 1;
    }
    lastDateCpt.year = year;
    lastDateCpt.month = month;
    lastDateCpt.day = 1;
    NSDate *limitDate = [gregorianCalendar dateFromComponents:lastDateCpt];
    NSInteger daySeconds = 24*60*60;
    limitDate = [limitDate dateByAddingTimeInterval:-1*daySeconds];
    return limitDate;
}

/**
 * 星期几
 *
 */
- (NSString *)weekdayName
{
    switch ([self weekday]) {
        case 1:
            return @"星期天";
        case 2:
            return @"星期一";
        case 3:
            return @"星期二";
        case 4:
            return @"星期三";
        case 5:
            return @"星期四";
        case 6:
            return @"星期五";
        case 7:
            return @"星期六";
        default:
            return @"";
    }
}

/**
 * 星期几（缩写）
 *
 */
- (NSString *)weekdayNameShort
{
    switch ([self weekday]) {
        case 1:
            return @"日";
        case 2:
            return @"一";
        case 3:
            return @"二";
        case 4:
            return @"三";
        case 5:
            return @"四";
        case 6:
            return @"五";
        case 7:
            return @"六";
        default:
            return @"";
    }
}

#pragma mark *** 格式化时间相关 ***
/**
 * 格式：yyyy-MM-dd
 *
 */
+ (NSString *)ymdFormatString
{
    return @"yyyy-MM-dd";
}

/**
 * 格式：HH:mm:ss
 *
 */
+ (NSString *)hmsFormatString
{
    return @"HH:mm:ss";
}

/**
 * 格式：HH:mm
 *
 */
+ (NSString *)hmFormatString
{
    return @"HH:mm";
}

/**
 * 格式：yyyy-MM-dd HH:mm:ss
 *
 */
+ (NSString *)ymd_hmsFormatString
{
    return [NSString stringWithFormat:@"%@ %@", [self ymdFormatString], [self hmsFormatString]];
}

/**
 * 格式：yyyy-MM-dd HH:mm
 *
 */
+ (NSString *)ymd_hmFormatString
{
    return [NSString stringWithFormat:@"%@ %@", [self ymdFormatString], [self hmFormatString]];
}

/**
 * 返回规定格式的字符串： 刚刚 、x秒前、 x分钟前、 x小时前、x天前  如果大于两天的话就展示 yyyy-MM-dd
 *
 */
- (NSString *)formattedShowString
{
    return [self formattedShowStringWithFormat:[NSDate ymdFormatString]];
}

/**
 * 返回规定格式的字符串： 刚刚 、x秒前、 x分钟前、 x小时前、x天前  如果大于两天的话就展示 dateFormat
 *
 */
- (NSString *)formattedShowStringWithFormat:(NSString *)dateFormat
{
    NSTimeInterval now = [[NSDate date] timeIntervalSince1970];
    NSTimeInterval timeStamp = [self timeIntervalSince1970];
    NSInteger past = now - timeStamp;
    if (past <= 0)
    {
        return @"刚刚";
    }
    else if (past < 60)
    {
        return [NSString stringWithFormat:@"%ld秒前", (long)past];
    }
    else if(past < 3600)
    {
        NSInteger min = past / 60;
        return [NSString stringWithFormat:@"%ld分钟前", (long)min];
    }
    else if (past < 86400)
    {
        NSInteger hour = past / 3600;
        return [NSString stringWithFormat:@"%ld小时前", (long)hour];
    }
    else if (past < 86400 * 2)
    {
        NSInteger day = past / 86400;
        return [NSString stringWithFormat:@"%ld天前", (long)day];
    }
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeStamp];
    NSDateFormatter *dateFormatter = [NSDate sharedDateFormatter_commonCategory];
    [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"]];
    [dateFormatter setDateFormat:dateFormat];
    return [dateFormatter stringFromDate:date];
}

#pragma mark *** 农历日期 ***
- (NSDateComponents *)dateComponentsWithChineseFormat
{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierChinese];
    NSDateComponents *dateCpt = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond|NSCalendarUnitWeekday|NSCalendarUnitWeekOfMonth fromDate:self];
    return dateCpt;
}

- (NSInteger)chineseYear;
{
    return [self dateComponentsWithChineseFormat].year;
}

- (NSInteger)chineseMonth;
{
    return [self dateComponentsWithChineseFormat].month;
}

- (NSInteger)chineseDay;
{
    return [self dateComponentsWithChineseFormat].day;
}

/**
 * 甲子、乙丑、丙寅。。。。
 *
 */
- (NSString *)chineseYearString
{
    NSArray *chineseYears = [NSArray arrayWithObjects:
                             @"甲子", @"乙丑", @"丙寅", @"丁卯",  @"戊辰",  @"己巳",  @"庚午",  @"辛未",  @"壬申",  @"癸酉",
                             @"甲戌",   @"乙亥",  @"丙子",  @"丁丑", @"戊寅",   @"己卯",  @"庚辰",  @"辛己",  @"壬午",  @"癸未",
                             @"甲申",   @"乙酉",  @"丙戌",  @"丁亥",  @"戊子",  @"己丑",  @"庚寅",  @"辛卯",  @"壬辰",  @"癸巳",
                             @"甲午",   @"乙未",  @"丙申",  @"丁酉",  @"戊戌",  @"己亥",  @"庚子",  @"辛丑",  @"壬寅",  @"癸丑",
                             @"甲辰",   @"乙巳",  @"丙午",  @"丁未",  @"戊申",  @"己酉",  @"庚戌",  @"辛亥",  @"壬子",  @"癸丑",
                             @"甲寅",   @"乙卯",  @"丙辰",  @"丁巳",  @"戊午",  @"己未",  @"庚申",  @"辛酉",  @"壬戌",  @"癸亥", nil];
    
    NSInteger year = [self chineseYear];
    NSString *yearString = [chineseYears objectAtIndex:year-1];
    return yearString;
    
}

/**
 * 一月、腊月。。。
 *
 */
- (NSString *)chineseMonthString
{
    NSArray *chineseMonths=[NSArray arrayWithObjects:
                            @"正月", @"二月", @"三月", @"四月", @"五月", @"六月", @"七月", @"八月",
                            @"九月", @"十月", @"冬月", @"腊月", nil];
    NSInteger month = [self chineseMonth];
    NSString *monthString = [chineseMonths objectAtIndex:month-1];
    return monthString;
}

/**
 * 初一、廿二、。。。。
 *
 */
- (NSString *)chineseDayString;
{
    NSArray *chineseDays=[NSArray arrayWithObjects:
                          @"初一", @"初二", @"初三", @"初四", @"初五", @"初六", @"初七", @"初八", @"初九", @"初十",
                          @"十一", @"十二", @"十三", @"十四", @"十五", @"十六", @"十七", @"十八", @"十九", @"二十",
                          @"廿一", @"廿二", @"廿三", @"廿四", @"廿五", @"廿六", @"廿七", @"廿八", @"廿九", @"三十",  nil];
    NSInteger day = [self chineseDay];
    NSString *dayString = [chineseDays objectAtIndex:day-1];
    return dayString;
}

/**
 * NSDateComponents 含 year、month、day、hour、minute、second、weekday、weekOfMonth units。
 *
 */
- (NSDateComponents *)dateCompontentsWithYMDHMSWWFormat
{
    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *dateComponents = [gregorianCalendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond|NSCalendarUnitWeekday|NSCalendarUnitWeekOfMonth fromDate:self];
    return dateComponents;
}

@end
