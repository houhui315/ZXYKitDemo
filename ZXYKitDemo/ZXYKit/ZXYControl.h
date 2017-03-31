//
//  ZXYControl.h
//  ZXYKitDemo
//
//  Created by houhui on 16/6/3.
//  Copyright © 2016年 houhui. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZXYControl;
typedef void(^ZXYControlEventTouchCallBack)(ZXYControl *control);

@interface ZXYControl : UIControl

- (CGFloat)x;
- (CGFloat)y;
- (CGFloat)width;
- (CGFloat)height;

- (void)touchUpinsideWithCallBack:(ZXYControlEventTouchCallBack)callBack;

@end
