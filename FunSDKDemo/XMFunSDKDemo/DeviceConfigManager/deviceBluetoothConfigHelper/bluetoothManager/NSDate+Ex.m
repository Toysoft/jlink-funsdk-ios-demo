//
//  NSDate+Ex.m
//  XWorld
//
//  Created by liuguifang on 16/6/25.
//  Copyright © 2016年 xiongmaitech. All rights reserved.
//

#import "NSDate+Ex.h"
#import "NSString+Utils.h"

@implementation NSDate (Ex)

- (NSString *)xm_string{
    return [self dateTimeString];
}

- (NSString*)dateString{
    // 不同地区日历 都转化为标准日历输出
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setCalendar:gregorian];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    NSCalendar *calender = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    [dateFormat setLocale:[[NSLocale alloc] initWithLocaleIdentifier:calender.locale.localeIdentifier]];
    return [dateFormat stringFromDate:self];
}

-(NSString*)timeString{
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateFormatter* timeFormat = [[NSDateFormatter alloc] init];
    [timeFormat setCalendar:gregorian];
    [timeFormat setDateFormat:@"HH:mm:ss"];
    NSCalendar *calender = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    [timeFormat setLocale:[[NSLocale alloc] initWithLocaleIdentifier:calender.locale.localeIdentifier]];
    return [timeFormat stringFromDate:self];
}

-(NSString*)dateTimeString{
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setCalendar:gregorian];
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSCalendar *calender = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    [dateFormat setLocale:[[NSLocale alloc] initWithLocaleIdentifier:calender.locale.localeIdentifier]];
    return [dateFormat stringFromDate:self];
}

-(NSDateComponents*)currentCompent{
    return [NSString toComponents:[self dateTimeString]];
}

+(NSDate*)dateWithDateString:(NSString*)dateStr{
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    NSCalendar *calender = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    [dateFormat setLocale:[[NSLocale alloc] initWithLocaleIdentifier:calender.locale.localeIdentifier]];
    return [dateFormat dateFromString:dateStr];
}

+(NSDate*)dateWithTimeString:(NSString*)timeStr{
    NSDateFormatter* formater = [[NSDateFormatter alloc] init];
    [formater setDateFormat:@"HH:mm:ss"];
    NSCalendar *calender = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    [formater setLocale:[[NSLocale alloc] initWithLocaleIdentifier:calender.locale.localeIdentifier]];
    return [formater dateFromString:timeStr];
}

+(NSDate*)dateWithDateTimeString:(NSString*)dateTimeStr{
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSCalendar *calender = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    [dateFormat setLocale:[[NSLocale alloc] initWithLocaleIdentifier:calender.locale.localeIdentifier]];
    return [dateFormat dateFromString:dateTimeStr];
}

+ (NSString *)timeStringWithDate:(NSDate *)date{
    if (!date){
        return @"";
    }
    // 不同地区日历 都转化为标准日历输出
    NSCalendar *calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond  fromDate:date];
    NSInteger h = [components hour];
    NSInteger m = [components minute];
    NSInteger s = [components second];
    NSString *formattedDate = [NSString stringWithFormat:@"%02ld:%02ld:%02ld", (long)h, (long)m, (long)s];
    return formattedDate;
}

+ (NSString *)dateTimeStringWithDate:(NSDate *)date{
    if (!date){
        return @"";
    }
    // 不同地区日历 都转化为标准日历输出
    NSCalendar *calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond  fromDate:date];
    NSInteger year = [components year];
    NSInteger month = [components month];
    NSInteger day = [components day];
    NSInteger h = [components hour];
    NSInteger m = [components minute];
    NSInteger s = [components second];
    NSString *formattedDate = [NSString stringWithFormat:@"%04ld-%02ld-%02ld %02ld:%02ld:%02ld", (long)year, (long)month, (long)day, (long)h, (long)m, (long)s];
    return formattedDate;
}

@end
