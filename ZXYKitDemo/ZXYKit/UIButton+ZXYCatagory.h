//
//  UIButton+method.h
//  ZXYKitDemo
//
//  Created by 蓝泰致铭        on 16/7/5.
//  Copyright © 2016年 houhui. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^buttonTouchBlock)();

@interface UIButton (ZXYCatagory)

+ (UIButton*)initWithframe:(CGRect)frame font:(UIFont*)font textColor:(UIColor*)textColor backgroundColor:(UIColor*)backgroundColor title:(NSString*)title touchEventWithCallBack:(buttonTouchBlock)callBack;

- (void)touchEventWithCallBack:(buttonTouchBlock)callBack;

@end
