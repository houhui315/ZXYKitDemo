//
//  ZXYTabBarItemView.m
//  ZXYKitDemo
//
//  Created by houhui on 16/6/3.
//  Copyright © 2016年 houhui. All rights reserved.
//

#import "ZXYTabBarItemView.h"
#import "ZXYTabBarItem.h"

@implementation ZXYTabBarItemView

- (instancetype)initWithFrame:(CGRect)frame andTabBarItem:(ZXYTabBarItem*)item{
    
    if ([super initWithFrame:frame]) {
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake((frame.size.width - 20)/2, 5, 20, 20)];
        [self addSubview:imageView];
        self.imageView = imageView;
        
        UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 28, frame.size.width, 15)];
        textLabel.backgroundColor = [UIColor clearColor];
        textLabel.textColor = [UIColor blackColor];
        textLabel.font = [UIFont systemFontOfSize:12.f];
        textLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:textLabel];
        self.textLabel = textLabel;
        
        if (!item) {
            self.theItem = nil;
        }else{
            self.theItem = item;
        }
        
        self.textLabel.text = _theItem.title;
        self.imageView.image = _theItem.normalImage;
        
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)setSelectStatus:(BOOL)status{
    if (status) {
        
        self.imageView.image = self.theItem.highlightImage;
        self.textLabel.textColor = [UIColor blueColor];
        self.backgroundColor = [UIColor lightGrayColor];
        
    }else{
        self.imageView.image = self.theItem.normalImage;
        self.textLabel.textColor = [UIColor blackColor];
        self.backgroundColor = [UIColor whiteColor];
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
