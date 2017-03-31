//
//  sampleCell.h
//  ZXYKitDemo
//
//  Created by houhui on 16/6/5.
//  Copyright © 2016年 houhui. All rights reserved.
//

#import "ZXYTableViewCell.h"
#import "sampleModel.h"

typedef NS_ENUM(NSInteger, EventType) {
    
    EventType_Button1Touch,
    EventType_Button2Touch,
    EventType_Button3Touch,
};

@interface sampleCell : ZXYTableViewCell

-(void)configureForModel:(sampleModel*)model;

@end
