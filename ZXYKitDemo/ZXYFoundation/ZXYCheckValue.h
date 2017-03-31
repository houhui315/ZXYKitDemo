//
//  ZXYCheckValue.h
//  ZXYKitDemo
//
//  Created by houhui  on 16/7/8.
//  Copyright © 2016年 zhixueyun. All rights reserved.
//
//  判空处理类
//

#import <Foundation/Foundation.h>

@interface ZXYCheckValue : NSObject

//是否为空
+ (BOOL)isNullValue:(id)value;

//字符串是非为空
+ (BOOL)isEmptyString:(NSString *)string;

//返回非空的字符串
+ (NSString *)notNilString:(NSString *)string;

//返回非空的字符串，如为空，则返回默认的值
+ (NSString *)notNilString:(NSString*)string defaultValue:(NSString*)value;

//数字类型是否为空
+ (BOOL)isEmptyNumber:(NSNumber *)number;

//返回非空的数字类型
+ (NSNumber *)notNilNumber:(NSNumber *)number;

//返回非空的数字类型，如为空，则返回默认的值
+ (NSNumber *)notNilNumber:(NSNumber *)number defaultValue:(NSNumber *)value;

//是否空的数组
+ (BOOL)isEmptyArray:(NSArray *)array;

//是否空的字典
+ (BOOL)isEmptyDictionary:(NSDictionary *)dictionary;

@end
