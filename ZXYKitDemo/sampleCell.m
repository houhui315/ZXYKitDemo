//
//  sampleCell.m
//  ZXYKitDemo
//
//  Created by houhui on 16/6/5.
//  Copyright © 2016年 houhui. All rights reserved.
//

#import "sampleCell.h"

@interface sampleCell (){
    
    UIButton *_button1;
    UIButton *_button2;
    UIButton *_button3;
}

@property (nonatomic, strong) sampleModel *model;


@end

@implementation sampleCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self initSubViews];
    }
    return self;
}

- (void)initSubViews{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"按钮1" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(button1Touch) forControlEvents:UIControlEventTouchUpInside];
    [button setFrame:CGRectMake(10, 10, 50, 25)];
    [self.contentView addSubview:button];
    _button1 = button;
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeSystem];
    [button2 setTitle:@"按钮2" forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(button2Touch) forControlEvents:UIControlEventTouchUpInside];
    [button2 setFrame:CGRectMake(10 + 60, 10, 50, 25)];
    [self.contentView addSubview:button2];
    _button2 = button2;
    
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeSystem];
    [button3 setTitle:@"按钮3" forState:UIControlStateNormal];
    [button3 addTarget:self action:@selector(button3Touch) forControlEvents:UIControlEventTouchUpInside];
    [button3 setFrame:CGRectMake(10 +60 +60, 10, 50, 25)];
    [self.contentView addSubview:button3];
    _button3 = button3;
}

- (void)button1Touch{
    
    [self sendEvent:EventType_Button1Touch withParams:nil];
}

- (void)button2Touch{
    
    [self sendEvent:EventType_Button2Touch withParams:nil];
}

- (void)button3Touch{
    
    [self sendEvent:EventType_Button3Touch withParams:nil];
}

-(void)configureForModel:(sampleModel*)model{
    
    _model = model;
    [_button1 setTitle:model.name forState:UIControlStateNormal];
    [_button2 setTitle:model.sex forState:UIControlStateNormal];
    [_button3 setTitle:model.age forState:UIControlStateNormal];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
