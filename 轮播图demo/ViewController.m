//
//  ViewController.m
//  轮播图demo
//
//  Created by dllo on 15/10/30.
//  Copyright © 2015年 刘志强. All rights reserved.
//

#import "ViewController.h"
#import "myScrollView.h"
#import "Focusimg.h"

@interface ViewController ()<pushDetailVC2>

@property (nonatomic ,retain)myScrollView *myScroller;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.myScroller  = [[myScrollView alloc]initWithFrame:CGRectMake(0, 0, 375 *WSCALE, 300 *HSCALE)];
    
    
    //此处为Model赋值
    NSArray *array = [NSArray array];

    Focusimg *model = [[Focusimg alloc]init];
    model.title = @"haha";
    model.imgurl = @"http://a2.att.hudong.com/08/50/01300363834032133734501688916.jpg";

    Focusimg *model1 = [[Focusimg alloc]init];
    model1.title = @"hehe";
    model1.imgurl = @"http://www.c-ps.net/uploads/allimg/140902/16-140Z2160010634.jpg";
    
    Focusimg *model2 = [[Focusimg alloc]init];
    model2.title = @"caca";
    model2.imgurl = @"http://g.hiphotos.baidu.com/zhidao/pic/item/8326cffc1e178a829fd39026f403738da877e84d.jpg";
    
    array  = @[model,model1,model2];
  
    self.myScroller.myArray = [NSMutableArray arrayWithArray:array];
    self.myScroller.my = self;
    
    [self.view addSubview:self.myScroller];
    
}


//轮播图点击方法
- (void)push:(NSInteger)a
{
    NSLog(@"%ld",a);
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
