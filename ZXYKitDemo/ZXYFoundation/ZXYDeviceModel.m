//
//  ZXYDeviceModel.m
//  ZXYKitDemo
//
//  Created by 蓝泰致铭        on 2016/10/11.
//  Copyright © 2016年 houhui. All rights reserved.
//

#import "ZXYDeviceModel.h"

@implementation ZXYDeviceModel

+ (ZXYDeviceModel *)sharedInstance{
    
    static ZXYDeviceModel *sharedObject = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedObject = [[self alloc] init];
        
        sharedObject.screenModel = [sharedObject getCurrentDeviceScreenModel];
    });
    return sharedObject;
}

- (ScreenModel)getCurrentDeviceScreenModel{
    
    CGSize modelSize = [[UIScreen mainScreen] currentMode].size;
    if (CGSizeEqualToSize(modelSize, CGSizeMake(640, 1136))){
        
        NSLog(@"IPHONE5_640_1136");
        return IPHONE5_640_1136;
        
    }else if (CGSizeEqualToSize(modelSize, CGSizeMake(750, 1334))){
        
        NSLog(@"IPHONE6_750_1334");
        return IPHONE6_750_1334;
        
    }else if (CGSizeEqualToSize(modelSize, CGSizeMake(1242, 2208))){
        
        NSLog(@"IPHONE6P_1242_2208");
        return IPHONE6P_1242_2208;
        
    }else if (CGSizeEqualToSize(modelSize, CGSizeMake(1125, 2001))){
        NSLog(@"IPHONE6PZoom_1125_2001");
        return IPHONE6PZoom_1125_2001;
    }else{
        NSLog(@"IPHONE4_640_960");
        return IPHONE4_640_960;
    }
}


@end
