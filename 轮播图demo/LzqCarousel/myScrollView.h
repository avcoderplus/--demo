//
//  Focusimg.h
//  轮播图demo
//
//  Created by dllo on 15/9/30.
//  Copyright © 2015年 刘志强. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyFocusCollectionViewCell.h"

@protocol pushDetailVC2 <NSObject>

- (void)push:(NSInteger)a;

@end

@interface myScrollView : UIView<UICollectionViewDataSource,UICollectionViewDelegate,pushDetailVC>

@property (nonatomic,retain) NSMutableArray *myArray;
@property (nonatomic,assign)id<pushDetailVC2>my;
@end
