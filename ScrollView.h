//
//  ScrollView.h
//  UIscrollViewSearchBar
//
//  Created by 王海冰 on 15/12/21.
//  Copyright © 2015年 com.yingcaishijia.www. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScrollView : UIView
@property (nonatomic ,strong) UIScrollView *scrollView;
@property (nonatomic ,strong) UIPageControl *pageControl;
@property (nonatomic ,assign) int pageControlHight;//pageControl的高度
@property (nonatomic ,assign) NSInteger arrCount;
@property (nonatomic ,assign) CGFloat floatWidth;
@property (nonatomic ,strong) NSTimer *timer;
- (instancetype)initWithFrame:(CGRect)frame imageArr:(NSArray *)imageArr pageControlHight:(int)hight ;
@end
