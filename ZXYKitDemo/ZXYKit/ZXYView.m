//
//  ZXYView.m
//  ZXYKitDemo
//
//  Created by houhui on 16/6/3.
//  Copyright © 2016年 houhui. All rights reserved.
//

#import "ZXYView.h"

@implementation ZXYView

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

- (void)setX:(CGFloat)x {
    
    CGRect rect = self.frame;
    rect.origin.x = x;
    self.frame = rect;
}

- (void)setY:(CGFloat)y {
    
    CGRect rect = self.frame;
    rect.origin.y = y;
    self.frame = rect;
}

- (void)setWidth:(CGFloat)width {
    
    CGRect rect = self.frame;
    rect.size.width = width;
    self.frame = rect;
}

- (void)setHeight:(CGFloat)height {
    
    CGRect rect = self.frame;
    rect.size.height = height;
    self.frame = rect;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
