//
//  UIViewController+ZXYCatagory.h
//  ZXYKitDemo
//
//  Created by 蓝泰致铭        on 16/7/6.
//  Copyright © 2016年 houhui. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ZXYCallBack)();

@interface UIViewController (ZXYCatagory)

//初始化返回按钮和返回操作
- (void)setUpBackButton;


//初始化返回按钮,返回时调用callBack
- (void)setUpBackButtonWithCallBack:(ZXYCallBack)callback;

@end
