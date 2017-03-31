//
//  ZXYTableView.m
//  ZXYKitDemo
//
//  Created by houhui on 16/6/5.
//  Copyright © 2016年 houhui. All rights reserved.
//

#import "ZXYTableView.h"

@implementation ZXYTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    
    if ([super initWithFrame:frame style:style]) {
        
    }
    return self;
}

- (void)registerCellClass:(Class)cellClass{
    
    [self registerClass:cellClass forCellReuseIdentifier:NSStringFromClass(cellClass)];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
