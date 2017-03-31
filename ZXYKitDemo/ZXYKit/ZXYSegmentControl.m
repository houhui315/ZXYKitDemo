//
//  ZXYSegmentControl.m
//  ZXYKitDemo
//
//  Created by houhui on 16/6/4.
//  Copyright © 2016年 houhui. All rights reserved.
//

#import "ZXYSegmentControl.h"

@interface ZXYSegmentControl ()

@property(nullable, nonatomic,copy) NSArray<__kindof NSString *> *items;

@property(nonatomic, weak) UILabel *bottomLine;

@property (nonatomic, copy) ZXYSegmentSelectCallBack selectCallBack;

@end

@implementation ZXYSegmentControl

- (instancetype)initWithFrame:(CGRect)frame Items:(nullable NSArray *)items{
    
    if ([super initWithFrame:frame]) {
        
        _items = items;
        [self initSubViews];
    }
    return self;
}

- (CGFloat)itemWidth{
    
    if (!_items.count) {
        return 0;
    }
    return self.width / _items.count;
}

- (void)setSelectCallBack:(ZXYSegmentSelectCallBack)callBak{
    
    _selectCallBack = callBak;
}

- (void)initSubViews{
    
    self.backgroundColor = [UIColor whiteColor];
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOffset = CGSizeMake(0, 2);
    self.layer.shadowOpacity = 0.8;
    
    CGFloat itemViewWidth = self.width / _items.count;
    
    for (NSInteger i = 0; i < _items.count; i++) {
        
        CGRect rect = CGRectMake(i * itemViewWidth + 10, 10, itemViewWidth - 20, 20);
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:rect];
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.font = [UIFont systemFontOfSize:13.f];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.textColor = [UIColor grayColor];
        NSString *string = _items[i];
        titleLabel.text = string?string:@"";
        [self addSubview:titleLabel];
        if (_items.count > 2) { //显示2个以上时
            if (i == 0) {
                
                titleLabel.textAlignment = NSTextAlignmentLeft;
            }else if (i == _items.count - 1){
                
                titleLabel.textAlignment = NSTextAlignmentRight;
            }
        }
    }
    
    UILabel *bottomLine = [[UILabel alloc] initWithFrame:CGRectMake(0, 40-2, itemViewWidth, 2)];
    bottomLine.backgroundColor = [UIColor blueColor];
    [self addSubview:bottomLine];
    self.bottomLine = bottomLine;
}

- (void)setSelectedSegmentIndex:(NSInteger)selectedSegmentIndex{
    
    if (selectedSegmentIndex < 0 || selectedSegmentIndex > _items.count) {
        return;
    }
    if (_selectedSegmentIndex == selectedSegmentIndex) {
        return;
    }
    _selectedSegmentIndex = selectedSegmentIndex;
    
    CGFloat newX = _selectedSegmentIndex * [self itemWidth];
    
    CGRect rect = self.bottomLine.frame;
    rect.origin.x = newX;
    
    [UIView animateWithDuration:0.25 animations:^{
        
        [self.bottomLine setFrame:rect];
    }];
    
    if (self.selectCallBack) {
        self.selectCallBack(_selectedSegmentIndex);
    }
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    UITouch *anyTouch = [touches anyObject];
    CGPoint touchPoint = [anyTouch locationInView:self];
    
    if (!_items || !_items.count) {
        return;
    }
    NSInteger index = touchPoint.x / [self itemWidth];
    [self setSelectedSegmentIndex:index];
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
