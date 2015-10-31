//
//  Focusimg.h
//  轮播图demo
//
//  Created by dllo on 15/9/30.
//  Copyright © 2015年 刘志强. All rights reserved.
//

#import "myScrollView.h"
#import "Focusimg.h"
#import "MyFocusCollectionViewCell.h"

@interface myScrollView ()
@property (nonatomic,retain) UICollectionView *collectionView;
@property (nonatomic,retain)UIPageControl *pageControl;
@property (nonatomic,assign)NSInteger index;
@property (nonatomic,retain)NSTimer *mytime;
@property (nonatomic,retain)MyFocusCollectionViewCell *coll;



@end



@implementation myScrollView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self creat];
    }
    return  self;
}

- (void)creat
{
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc]init];
    
    flow.itemSize = CGSizeMake(self.frame.size.width, self.frame.size.height);
    flow.minimumLineSpacing = 0;
    
    flow.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flow.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    
    
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) collectionViewLayout:flow];
    

    
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.showsHorizontalScrollIndicator = NO;
    _collectionView.pagingEnabled = YES;
    _collectionView.bounces = NO;
    
    [self addSubview:_collectionView];
    

    
    [_collectionView registerClass:[MyFocusCollectionViewCell class] forCellWithReuseIdentifier:@"qiang"];
    
    
    _collectionView.contentOffset =  CGPointMake(375*WSCALE, 0);
    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(135 *WSCALE, 250 *HSCALE, 100 *WSCALE, 30 *HSCALE)];
    
    [self.pageControl addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventValueChanged];
    self.pageControl.pageIndicatorTintColor = [UIColor blackColor];
    self.pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    
    [self addSubview:self.pageControl];
    
    
    

    
    
    self.mytime = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(timeAction:) userInfo:nil repeats:YES];
    
    self.index = 0;
    
}




- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.myArray.count;
}



- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *colli = @"qiang";
    self.coll = [collectionView dequeueReusableCellWithReuseIdentifier:colli forIndexPath:indexPath];
    
    Focusimg *m = [self.myArray objectAtIndex:indexPath.row];
    _coll.focus = m;
    _coll.index = indexPath.row;
    _coll.mele = self;
    return _coll;
}

- (void)changePage:(UIPageControl *)page
{
    
    [self.collectionView setContentOffset:CGPointMake(375 *WSCALE*(page.currentPage+ 1), 0) animated:YES];
    
    
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    if (self.collectionView.contentOffset.x == 375*WSCALE * (self.myArray.count -1)) {
        
        
        [self.collectionView setContentOffset:CGPointMake(375 *WSCALE, 0) animated:NO];
    }
    
    if (self.collectionView.contentOffset.x == 0) {
        
        
        
        [self.collectionView setContentOffset:CGPointMake(375*WSCALE * (self.myArray.count - 2), 0) animated:NO];
    }
    
    
    
    if (scrollView == self.collectionView) {
        
        self.pageControl.currentPage = (scrollView.contentOffset.x - 375 *WSCALE) / WSCALE *375 ;
    }
    
}




//当手指接触的时候让定时器停止
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    
    if (scrollView == self.collectionView) {
        [self.mytime invalidate];
        self.mytime = nil;
    }
}


//动画效果
- (void)timeAction:(NSTimer *)time
{

    
    [self.collectionView setContentOffset:CGPointMake((self.pageControl.currentPage + 1 + 1) * self.collectionView.frame.size.width, 0) animated:YES];
    
    
}


-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    self.mytime = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(timeAction:) userInfo:nil repeats:YES];
    
}





- (void)setMyArray:(NSMutableArray *)myArray
{
    if (_myArray != myArray) {

        _myArray = myArray;
    }
    
    
    Focusimg *fm = [_myArray firstObject];
    Focusimg *lm = [_myArray lastObject];
    [_myArray insertObject:lm atIndex:0];
    [_myArray addObject:fm];
    self.pageControl.numberOfPages = self.myArray.count-2;
    [self.collectionView reloadData];
}




- (void)push:(NSInteger)index
{
   
    [self.my push:index];
}




@end
