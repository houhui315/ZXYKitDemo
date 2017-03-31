//
//  ZXYCheckValue.m
//  ZXYKitDemo
//
//  Created by houhui  on 16/7/8.
//  Copyright © 2016年 zhixueyun. All rights reserved.
//

#import "ZXYCheckValue.h"

@implementation ZXYCheckValue

#pragma mark NSNull

+ (BOOL)isNullValue:(id)value{
    
    if ([value isEqual:@"NULL"] || [value isKindOfClass:[NSNull class]] || [value isEqual:NULL] || [[value class] isSubclassOfClass:[NSNull class]] || value == nil || value == NULL) {
        
        return YES;
    }
    return NO;
}

#pragma mark NSString
+ (BOOL)isEmptyString:(NSString *)string {
    
    if ([ZXYCheckValue isNullValue:string]) {
        
        return YES;
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length] == 0 || [string isEqualToString:@"<null>"] || [string isEqualToString:@"(null)"]) {
        return YES;
    }
    return NO;
}

+ (NSString *)notNilString:(NSString *)string {
    
    if ([ZXYCheckValue isEmptyString:string]) {
        
        return @"";
    }else{
        return string;
    }
}

+ (NSString *)notNilString:(NSString*)string defaultValue:(NSString*)value{
    
    if (![ZXYCheckValue isEmptyString:string]) {
        
        return string;
    }
    
    if (![ZXYCheckValue isEmptyString:value]) {
        
        return value;
    }
    
    return @"";
}

#pragma mark NSNumber

+ (BOOL)isEmptyNumber:(NSNumber *)number {
    
    if ([ZXYCheckValue isNullValue:number]) {
        
        return YES;
    }
    if (![number isKindOfClass:[NSNumber class]]) {
        return YES;
    }
    return NO;
}

+ (NSNumber *)notNilNumber:(NSNumber *)number {
    
    if ([ZXYCheckValue isEmptyNumber:number]) {
        
        return @(0);
    }else{
        return number;
    }
}

+ (NSNumber *)notNilNumber:(NSNumber *)number defaultValue:(NSNumber *)value {
    
    if (![ZXYCheckValue isEmptyNumber:number]) {
        return number;
    }
    
    if (![ZXYCheckValue isEmptyNumber:value]) {
        return value;
    }
    return @(0);
}

#pragma mark NSArray

+ (BOOL)isEmptyArray:(NSArray *)array {
    
    if ([ZXYCheckValue isNullValue:array]) {
        
        return YES;
    }
    if (![array isKindOfClass:[NSArray class]] || ![array count]) {
        return YES;
    }
    return NO;
}

#pragma mark NSDictionary

+ (BOOL)isEmptyDictionary:(NSDictionary *)dictionary {
    
    if ([ZXYCheckValue isNullValue:dictionary]) {
        
        return YES;
    }
    if (![dictionary isKindOfClass:[NSDictionary class]] || ![dictionary count]) {
        return YES;
    }
    return NO;
}

@end
