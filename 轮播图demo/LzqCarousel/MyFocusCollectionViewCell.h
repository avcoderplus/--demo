//
//  Focusimg.h
//  轮播图demo
//
//  Created by dllo on 15/9/30.
//  Copyright © 2015年 刘志强. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Focusimg.h"

@protocol pushDetailVC <NSObject>

- (void)push:(NSInteger)index;

@end

@interface MyFocusCollectionViewCell : UICollectionViewCell

@property (nonatomic,assign)id<pushDetailVC>mele;
@property (nonatomic,retain)Focusimg *focus;
@property (nonatomic,assign)NSInteger index;
@end
