//
//  ZXYDragView.m
//  ZXYKitDemo
//
//  Created by 蓝泰致铭        on 16/7/12.
//  Copyright © 2016年 houhui. All rights reserved.
//

#import "ZXYDragView.h"

@interface ZXYDragView (){
    
    CGPoint beginPoint;
}

@end

@implementation ZXYDragView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        _dragEnabled = YES;
        _autoAdsorption = YES;
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    if (!_dragEnabled) {
        return;
    }
    UITouch *touch = [touches anyObject];
    
    beginPoint = [touch locationInView:self];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    if (!_dragEnabled) {
        return;
    }
    UITouch *touch = [touches anyObject];
    CGPoint point = [self getNewPointOfTouch:touch];
    self.center = point;
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (!_dragEnabled) {
        return;
    }
    if (!_autoAdsorption) {
        return;
    }
    UITouch *touch = [touches anyObject];
    CGPoint point = [self getNewPointOfTouch:touch];
    CGPoint nPoint = [self checkCenter:point];
    [UIView animateWithDuration:0.25 animations:^{
        self.center = nPoint;
    }];
}

- (CGPoint)getNewPointOfTouch:(UITouch *)touch{
    
    CGPoint nowPoint = [touch locationInView:self];
    
    float offsetX = nowPoint.x - beginPoint.x;
    float offsetY = nowPoint.y - beginPoint.y;
    CGPoint point = CGPointMake(self.center.x + offsetX, self.center.y + offsetY);
    return point;
}

- (CGPoint)checkCenter:(CGPoint)center{
    
    UIView *superView = self.superview;
    CGRect superRect = superView.bounds;
    
    if (center.x - self.bounds.size.width/2 < superRect.size.width - center.x - self.bounds.size.width/2) {
        center.x = self.bounds.size.width/2;
    }else{
        center.x = superRect.size.width - self.bounds.size.width/2;
    }
    
    if (center.y < self.bounds.size.height/2) {
        center.y = self.bounds.size.height/2;
    }else if (center.y > superRect.size.height - self.bounds.size.height/2){
        center.y = superRect.size.height - self.bounds.size.height/2;
    }
    return center;
}

@end
