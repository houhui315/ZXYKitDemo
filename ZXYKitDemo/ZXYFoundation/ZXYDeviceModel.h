//
//  ZXYDeviceModel.h
//  ZXYKitDemo
//
//  Created by 蓝泰致铭        on 2016/10/11.
//  Copyright © 2016年 houhui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger, ScreenModel) {
    
    IPHONE4_640_960 = 1,
    IPHONE5_640_1136 = 2,
    IPHONE6_750_1334 = 3,
    IPHONE6P_1242_2208 = 4,
    IPHONE6PZoom_1125_2001 = 5
};

@interface ZXYDeviceModel : NSObject

@property (nonatomic, assign) ScreenModel screenModel;

+ (ZXYDeviceModel*)sharedInstance;

@end
