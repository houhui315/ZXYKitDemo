//
//  ZXYControl.m
//  ZXYKitDemo
//
//  Created by houhui on 16/6/3.
//  Copyright © 2016年 houhui. All rights reserved.
//

#import "ZXYControl.h"

@interface ZXYControl ()

@property (nonatomic, copy) ZXYControlEventTouchCallBack touchCallBack;

@end

@implementation ZXYControl

- (void)touchUpinsideWithCallBack:(ZXYControlEventTouchCallBack)callBack{
    [self addTarget:self action:@selector(controlTouchUpinside:) forControlEvents:UIControlEventTouchUpInside];
    self.touchCallBack = callBack;
}

- (void)controlTouchUpinside:(id)sender{
    
    self.touchCallBack(self);
}

- (CGFloat)x{
    
    return self.frame.origin.x;
}

- (CGFloat)y{
    
    return self.frame.origin.y;
}

- (CGFloat)width{
    
    return self.frame.size.width;
}

- (CGFloat)height{
    
    return self.frame.size.height;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
