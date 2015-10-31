//
//  Focusimg.h
//  轮播图demo
//
//  Created by dllo on 15/9/30.
//  Copyright © 2015年 刘志强. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)

- (CGFloat)width
{
    return self.frame.size.width;
}
- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}
- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;

}

-(void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    
    center.x = centerX;
    
    self.center = center;
    
}

-(void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    
    center.y = centerY;
    
    self.center = center;
}

-(CGFloat)centerX
{
    return self.center.x;
}

-(CGFloat)centerY
{
    return self.center.y;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}
- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;

}


- (CGSize)size
{
    return self.frame.size;
}
- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}



//简单的适配
- (void)initWithRect:(CGFloat )x andY:(CGFloat )y andWidth:(CGFloat)width andheight:(CGFloat)height
{
    
    CGRect  frame = CGRectMake(x * WSCALE, y *HSCALE, width *WSCALE, height *HSCALE);
     self.frame = frame;
}


@end
