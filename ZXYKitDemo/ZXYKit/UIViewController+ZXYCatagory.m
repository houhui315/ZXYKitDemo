//
//  UIViewController+ZXYCatagory.m
//  ZXYKitDemo
//
//  Created by 蓝泰致铭        on 16/7/6.
//  Copyright © 2016年 houhui. All rights reserved.
//

#import "UIViewController+ZXYCatagory.h"
#import <objc/runtime.h>

static char *backCallBack = "backCallBack";

@implementation UIViewController (ZXYCatagory)

- (void)dealloc{
    
    [self removeBackCallBack];
}

- (void)setUpBackButton{
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(onBackTouch:)];
    self.navigationItem.leftBarButtonItem = backButton;
}

- (void)onBackTouch:(id)sender{
    
    //如果是presnet进入的则dismiss返回
    if (self.presentingViewController) {
        
        [self dismissViewControllerAnimated:YES completion:nil];
    }else{
        //如果是push进入的则pop返回
        [self.navigationController popViewControllerAnimated:YES];
    }
    [self runBackBlock];
}

- (void)setUpBackButtonWithCallBack:(ZXYCallBack)callback{
    
    [self setUpBackButton];
    
    if (callback) {
        [self setBackCallBack:callback];
    }
}

- (void)runBackBlock{
    
    ZXYCallBack callBack = [self getBackCallBack];
    if (callBack) {
        callBack();
    }
}

- (void)setBackCallBack:(ZXYCallBack)callBack{
    
    objc_setAssociatedObject(self, backCallBack, callBack, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (ZXYCallBack)getBackCallBack{
    
    ZXYCallBack callBack = objc_getAssociatedObject(self, backCallBack);
    return callBack;
}

- (void)removeBackCallBack{
    
    ZXYCallBack callBack = [self getBackCallBack];
    objc_removeAssociatedObjects(callBack);
}


@end
