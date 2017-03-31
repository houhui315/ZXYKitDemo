//
//  UILabel+method.m
//  ZXYKitDemo
//
//  Created by 蓝泰致铭        on 16/7/5.
//  Copyright © 2016年 houhui. All rights reserved.
//

#import "UILabel+ZXYCatagory.h"

@implementation UILabel (ZXYCatagory)

+ (UILabel*)initWithFrame:(CGRect)frame titleFont:(UIFont*)font textColor:(UIColor*)textColor backgroundColor:(UIColor*)bgColor{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    if (font) {
        label.font = font;
    }
    if (textColor) {
        label.textColor = textColor;
    }
    if (bgColor) {
        label.backgroundColor = bgColor;
    }
    
    return label;
}


@end
