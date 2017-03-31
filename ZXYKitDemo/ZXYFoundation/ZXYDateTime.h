//
//  ZXYDateTime.h
//  ZXYKitDemo
//
//  Created by houhui  on 16/7/7.
//  Copyright © 2016年 zhixueyun. All rights reserved.
//
//  时间处理类
//

#import <Foundation/Foundation.h>

@interface ZXYDateTime : NSObject

//返回星期
+ (NSString *)weekWithDate:(NSDate *)date;

//返回日期时间
+ (NSString *)dateTimeWithDate:(NSDate *)date;

//返回日期
+ (NSString *)dateWithDate:(NSDate *)date;

//返回时间
+ (NSString *)timeWithDate:(NSDate *)date;

//返回距现在的时间间隔
+ (NSString *)sinceNowWithDate:(NSDate *)date;

@end
