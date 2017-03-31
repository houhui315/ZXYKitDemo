//
//  ZXYBarItem.h
//  ZXYKitDemo
//
//  Created by houhui on 16/6/3.
//  Copyright © 2016年 houhui. All rights reserved.
//

#import "ZXYObject.h"

@class UIImage;

@interface ZXYBarItem : ZXYObject

@property(nullable, nonatomic,copy)  NSString *title;        // default is nil
@property(nullable, nonatomic,strong)  UIImage *image;        // default is nil

@end
