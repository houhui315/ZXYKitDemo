//
//  ZXYTabBar.m
//  ZXYKitDemo
//
//  Created by houhui on 16/6/3.
//  Copyright © 2016年 houhui. All rights reserved.
//

#import "ZXYTabBar.h"
#import "ZXYTabBarItemView.h"

@implementation ZXYTabBar

- (instancetype)initWithFrame:(CGRect)frame{
    
    if ([super initWithFrame:frame]) {
        
        [self initBackGroundColor];
    }
    return self;
}

- (void)initBackGroundColor {
    
    self.backgroundColor = [UIColor whiteColor];
}

- (void)setItems:(NSArray<UITabBarItem *> *)items{
    
    _items = [NSArray arrayWithArray:items];
    
    [self initSubViews];
}

- (void)initSubViews{
    
    NSUInteger itemCount = [_items count];
    if (!itemCount) {
        return;
    }
    
    __weak typeof(self) WeakSelf = self;
    
    CGFloat itemWidth = self.width/itemCount;
    for (NSUInteger i = 0; i < itemCount; i++) {
        
        CGRect rect = CGRectMake(itemWidth * i, 0, itemWidth, 49);
        ZXYTabBarItem *item = self.items[i];
        ZXYTabBarItemView *itemView = [[ZXYTabBarItemView alloc] initWithFrame:rect andTabBarItem:item];
        itemView.tag = 10 + i;
        [itemView touchUpinsideWithCallBack:^(ZXYControl *control) {
            
            [WeakSelf  checkSelectWithIndex:i];
        }];
        [self addSubview:itemView];
    }
    [self setSelectedWithIndex:0];
}

- (void)checkSelectWithIndex:(NSInteger)index{
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(tabBar:shouldSelectItem:)]) {
        
        BOOL shouldSelect = [self.delegate tabBar:self shouldSelectItem:self.items[index]];
        if (!shouldSelect) {
            
            return ;
        }
    }
    
    [self setSelectedWithIndex:index];
    
    self.selectedItem = self.items[index];
    if (self.delegate && [self.delegate respondsToSelector:@selector(tabBar:didSelectItem:)]) {
        [self.delegate tabBar:self didSelectItem:self.selectedItem];
    }
}

- (void)setSelectedWithIndex:(NSInteger)index{
    
    NSUInteger itemCount = [_items count];
    for (NSUInteger i = 0; i < itemCount; i++) {
        
        ZXYTabBarItemView *itemView = [self viewWithTag:10 + i];
        if (!itemView) {
            NSAssert(itemView, @"itemView Not nil");
        }
        if (index == i) {
            
            [itemView setSelectStatus:YES];
        }else{
            [itemView setSelectStatus:NO];
        }
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
