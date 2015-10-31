//
//  Focusimg.h
//  轮播图demo
//
//  Created by dllo on 15/9/30.
//  Copyright © 2015年 刘志强. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Frame)

@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;

@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;

@property (nonatomic, assign) CGSize size;
- (void)initWithRect:(CGFloat )x andY:(CGFloat )y andWidth:(CGFloat)width andheight:(CGFloat)height;

@end
