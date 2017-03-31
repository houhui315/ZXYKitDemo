//
//  ZXYTabBarItem.m
//  ZXYKitDemo
//
//  Created by houhui on 16/6/3.
//  Copyright © 2016年 houhui. All rights reserved.
//

#import "ZXYTabBarItem.h"

@implementation ZXYTabBarItem

- (instancetype)initWithTitle:(nullable NSString *)title image:(nullable UIImage *)image selectedImage:(nullable UIImage *)selectedImage{
    
    if ([super init]) {
        
        self.title = title;
        self.normalImage = image;
        self.highlightImage = selectedImage;
    }
    return self;
    
}
@end
