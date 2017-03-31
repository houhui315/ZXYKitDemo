//
//  UIButton+method.m
//  ZXYKitDemo
//
//  Created by 蓝泰致铭        on 16/7/5.
//  Copyright © 2016年 houhui. All rights reserved.
//

#import "UIButton+ZXYCatagory.h"
#import <objc/runtime.h>

static char *buttonTouchCallBack = "buttonTouchCallBack";

@implementation UIButton (ZXYCatagory)

-(void)dealloc{
    
    [self removeButtonTouchCallBack];
}


+ (UIButton*)initWithframe:(CGRect)frame font:(UIFont*)font textColor:(UIColor*)textColor backgroundColor:(UIColor*)backgroundColor title:(NSString*)title touchEventWithCallBack:(buttonTouchBlock)callBack{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:frame];
    if (font) {
        [button.titleLabel setFont:font];
    }
    if (textColor) {
        [button.titleLabel setTextColor:textColor];
    }
    if (title) {
        [button setTitle:title forState:UIControlStateNormal];
    }
    if (backgroundColor) {
        [button setBackgroundColor:backgroundColor];
    }
    
    if (callBack) {
        [button touchEventWithCallBack:callBack];
    }
    
    return button;
}

- (void)touchEventWithCallBack:(buttonTouchBlock)callBack{
    
    [self setButtonTouchCallBack:callBack];
    [self addTarget:self action:@selector(buttonTouch:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)setButtonTouchCallBack:(buttonTouchBlock)callBack{
    
    objc_setAssociatedObject(self, buttonTouchCallBack, callBack, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (buttonTouchBlock)getButtonTouchCallBack{
    
    buttonTouchBlock callBack = objc_getAssociatedObject(self, buttonTouchCallBack);
    return callBack;
}

- (void)removeButtonTouchCallBack{
    
    buttonTouchBlock callBack = [self getButtonTouchCallBack];
    objc_removeAssociatedObjects(callBack);
}


- (void)buttonTouch:(id)sender{
    
    buttonTouchBlock callBack = [self getButtonTouchCallBack];
    if (callBack) {
        callBack();
    }
    
    [self addTouchControl];
}

- (void)addTouchControl{
    
    [self setButtonEnabled:@(NO)];
    [self performSelector:@selector(setButtonEnabled:) withObject:@(YES) afterDelay:0.2];
}

- (void)setButtonEnabled:(NSNumber*)enabled{
    
    [self setEnabled:enabled.boolValue];
}


@end
