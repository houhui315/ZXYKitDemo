//
//  ZXYSizeValue.m
//  ZXYKitDemo
//
//  Created by 蓝泰致铭        on 2016/10/11.
//  Copyright © 2016年 houhui. All rights reserved.
//

#import "ZXYSizeValue.h"
#import "ZXYDeviceModel.h"

@implementation ZXYSizeValue

+ (CGFloat)valueForNormalValue:(CGFloat)normalValue {
    
    ScreenModel model = [ZXYDeviceModel sharedInstance].screenModel;
    if (model == IPHONE6_750_1334){
        
        return  normalValue*(750./640);
    }else if (model == IPHONE6P_1242_2208){
        
        return  normalValue*(1242./640);
    }else if (model == IPHONE6PZoom_1125_2001){
        
        return  normalValue*(1125./640);
    }else{
        return  normalValue;
    }
}

@end
