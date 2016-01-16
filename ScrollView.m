//
//  ScrollView.m
//  UIscrollViewSearchBar
//
//  Created by 王海冰 on 15/12/21.
//  Copyright © 2015年 com.yingcaishijia.www. All rights reserved.
//

#import "ScrollView.h"
@implementation ScrollView
- (instancetype)initWithFrame:(CGRect)frame imageArr:(NSArray *)imageArr pageControlHight:(int)hight
{
    self = [super init];
    if (self)
    {
    //获得图片数据源的个数
        self.arrCount = imageArr.count ;
    //自定义View的设置
        self.frame = frame;
        self.backgroundColor = [UIColor redColor];
    //根据数据的接收将scrollView进行适当的处理如下
        self.scrollView = [[UIScrollView alloc]initWithFrame:self.frame];
        for (int i = 0; i<imageArr.count; i++)
        {
            UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.frame) *i, 0, CGRectGetMaxX(self.frame), self.frame.size.height)];
            imageView.image = [UIImage imageNamed:imageArr[i]];
            [self.scrollView addSubview:imageView];
        }
        self.scrollView.pagingEnabled = YES;
        self.scrollView.showsHorizontalScrollIndicator = YES;
        self.scrollView.showsVerticalScrollIndicator = NO;
        self.scrollView.contentSize = CGSizeMake(imageArr.count *self.frame.size.width, self.viewForFirstBaselineLayout.frame.size.height);
        [self addSubview:self.scrollView];
//      //添加pageControl
        self.pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(CGRectGetWidth(self.frame)/2, CGRectGetHeight(self.frame) - hight , self.frame.origin.x/2, hight)];
        _pageControl.backgroundColor = [UIColor redColor];
        _pageControl.currentPageIndicatorTintColor = [UIColor redColor];
        _pageControl.pageIndicatorTintColor = [UIColor whiteColor];
        _pageControl.currentPage = 1;
        _pageControl.numberOfPages = imageArr.count;
        [self addSubview:_pageControl];
        //用NSObject的方法创建一个多线程
        [self performSelectorInBackground:@selector(timerAction) withObject:nil];
        //获得当前界面的宽度
        self.floatWidth = CGRectGetWidth(self.frame);
  
    }
    return self;
}

- (void)timerAction
{
    if (![NSThread isMainThread])
    {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(pageControlMoveAction) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop]addTimer:self.timer forMode:NSDefaultRunLoopMode];
        [[NSRunLoop currentRunLoop] run];
    }
}
#pragma  mark - pageControlMoveAction
- (void)pageControlMoveAction
{
    if (_scrollView.contentOffset.x >= CGRectGetWidth(self.frame)*(self.arrCount-1))
    {
        self.floatWidth = - CGRectGetWidth(self.frame);
        
    }
    if (_scrollView.contentOffset.x <= 0)
    {
        self.floatWidth =  CGRectGetWidth(self.frame);
    }
    //改变滚动视图的偏移量
    [_scrollView setContentOffset:CGPointMake(_scrollView.contentOffset.x + self.floatWidth, 0) animated:YES];
    //根据滚动视图的偏移量来计算 当前 页码
    self.pageControl.currentPage = (_scrollView.contentOffset.x + self.floatWidth) / CGRectGetWidth(self.frame);
}










@end
