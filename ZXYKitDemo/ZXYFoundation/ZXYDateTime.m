//
//  ZXYDateTime.m
//  ZXYKitDemo
//
//  Created by 蓝泰致铭        on 16/7/7.
//  Copyright © 2016年 houhui. All rights reserved.
//

#import "ZXYDateTime.h"

@implementation ZXYDateTime

+ (NSString *)weekWithDate:(NSDate *)date {
    
    NSCalendar*calendar = [NSCalendar currentCalendar];
    NSDateComponents * comps =[calendar components:(NSWeekCalendarUnit | NSWeekdayCalendarUnit |NSWeekdayOrdinalCalendarUnit) fromDate:date];
    
    NSInteger weekday = [comps weekday];
    switch (weekday) {
        case 1:{ return @"星期日";}break;
        case 2:{ return @"星期一";}break;
        case 3:{ return @"星期二";}break;
        case 4:{ return @"星期三";}break;
        case 5:{ return @"星期四";}break;
        case 6:{ return @"星期五";}break;
        case 7:{ return @"星期六";}break;
        default:{return @"星期一";}break;
    }
}

+ (NSString *)dateTimeWithDate:(NSDate *)date {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    return [formatter stringFromDate:date];
}

+ (NSString *)dateWithDate:(NSDate *)date {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    return [formatter stringFromDate:date];
}

+ (NSString *)timeWithDate:(NSDate *)date {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH:mm:ss"];
    return [formatter stringFromDate:date];
}

+ (NSString *)sinceNowWithDate:(NSDate *)date {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSTimeInterval interval = 0 - [date timeIntervalSinceNow];
    
    if (interval < 60) {
        // 几秒前
        return @"1分钟内";
    } else if (interval < (60 * 60)) {
        // 几分钟前
        return [NSString stringWithFormat:@"%u分钟前", (int)(interval / 60)];
    } else if (interval < (24 * 60 * 60)) {
        // 几小时前
        return [NSString stringWithFormat:@"%u小时前", (int)(interval / 60 / 60)];
    } else if (interval < (2 * 24 * 60 * 60)) {
        // 昨天
        [formatter setDateFormat:@"昨天 HH:mm"];
        return [formatter stringFromDate:date];
    } else if (interval < (3 * 24 * 60 * 60)) {
        // 前天
        [formatter setDateFormat:@"前天 HH:mm"];
        return [formatter stringFromDate:date];
        // 一星期内
    } else {
        // 具体时间
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
        return [formatter stringFromDate:date];
    }
}

@end
