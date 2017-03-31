//
//  ZXYViewController.h
//  ZXYKitDemo
//
//  Created by houhui on 16/6/3.
//  Copyright © 2016年 houhui. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ZXYCallBack)();

@interface ZXYViewController : UIViewController

//初始化返回按钮和返回操作
- (void)setUpBackButton;


//初始化返回按钮,返回时调用callBack
- (void)setUpBackButtonWithCallBack:(ZXYCallBack)callback;

@end
