//
//  Focusimg.h
//  轮播图demo
//
//  Created by dllo on 15/9/30.
//  Copyright © 2015年 刘志强. All rights reserved.
//

#import "MyFocusCollectionViewCell.h"
#import "UIView+Frame.h"


@interface MyFocusCollectionViewCell()

@property (nonatomic,retain)UIButton *myButton;

@property (nonatomic,retain)UILabel *titleLabel;


@end


@implementation MyFocusCollectionViewCell



- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self creat];
    }
    return self;
}


- (void)creat
{
    self.myButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
 
    [self.myButton initWithRect:0 andY:0 andWidth:375 andheight:300];

    
    
    
    [self.myButton addTarget:self action:@selector(buttonAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.contentView addSubview:self.myButton];
    
    
    self.titleLabel = [[UILabel alloc]init];
    [self.titleLabel initWithRect:0 andY:270 andWidth:375 andheight:20];
    [self.contentView addSubview:self.titleLabel];
    
}

- (void)setFocus:(Focusimg *)focus
{
    if (_focus != focus) {
      
        _focus = focus;
    }

    
    
    NSURL *url  =[NSURL URLWithString:focus.imgurl];
    [self.myButton sd_setBackgroundImageWithURL:url forState:(UIControlStateNormal) placeholderImage:nil];
 

    self.titleLabel.text = focus.title;
}



- (void)buttonAction:(UIButton *)btn
{
 
    [self.mele push:self.index];
}





@end
