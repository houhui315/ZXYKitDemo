//
//  ZXYBaseListView.m
//  ZXYKitDemo
//
//  Created by houhui on 16/6/4.
//  Copyright © 2016年 houhui. All rights reserved.
//

#import "ZXYBaseListView.h"

@implementation ZXYBaseListView

- (instancetype)initWithFrame:(CGRect)frame showSegment:(BOOL)isShowSegmentControl showTabBar:(BOOL)isShowTabBar{
    
    if ([super initWithFrame:frame]) {
        
        CGFloat y = 0;
        CGFloat height = frame.size.height - 44 - 20;
        
        if (isShowSegmentControl) {
            
            y += 40;
            height -= 40;
        }
        if (isShowTabBar) {
            
            height -= 49;
        }
        
        CGRect rect = frame;
        rect.origin.y = y;
        rect.size.height = height;
        
        [self setFrame:rect];
        
        if (isShowSegmentControl) {
            
            [self setUpSegmentView];
        }
    }
    return self;
}

- (void)setUpSegmentView{
    
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
