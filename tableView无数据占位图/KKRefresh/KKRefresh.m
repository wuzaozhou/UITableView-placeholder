//
//  KKRefresh.m
//  MJRefresh
//
//  Created by kkmac on 2017/3/13.
//  Copyright © 2017年 kkmac. All rights reserved.
//

#import "KKRefresh.h"
#import <UIKit/UIKit.h>

@implementation KKRefresh

/**
 *  设置头部刷新
 *  @param scrollView 当前控制器下面scrollView
 *  @param block 刷新回调block
 */
+(void)setHeaderWithScrollView:(UIScrollView *)scrollView refreshingBlaock:(HeaderRefreshingBlock)block {
    scrollView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        block();
    }];
}

/**
 开始头部刷新
 @param scrollView 当前控制器下面的scrollView
 */
+(void)beginHeaderRefreshWithScrollView:(UIScrollView *)scrollView {
    [scrollView.mj_header beginRefreshing];
}

/**
 结束头部刷新
 @param scrollView 当前控制器下面的scrollView
 */
+(void)endHeaderRefreshWithScrollView:(UIScrollView *)scrollView {
    [scrollView.mj_header endRefreshing];
}

/**
 *  设置上拉加载更多
 *  @param scrollView 当前控制器下面的scrollView
 *  @param block 刷新回调block
 */
+(void)setFooterWithScrollView:(UIScrollView *)scrollView target:(id)target refreshingBlaock:(FooterRefreshingBlock)block {
    scrollView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        block();
    }];
}

/**
 开始底部刷新
 @param scrollView 当前控制器下面的tableView或者collectionView
 */
+(void)beginFooterRefreshWithScrollView:(UIScrollView *)scrollView {
    [scrollView.mj_footer beginRefreshing];
}

/**
 结束底部刷新
 @param scrollView 当前控制器下面的scrollView
 */
+(void)endFooterRefreshWithScrollView:(UIScrollView *)scrollView {
    [scrollView.mj_footer endRefreshing];
}

/**
 提示没有更多数据
 @param scrollView 当前控制器下面的scrollView
 */
+(void)endFooterRefreshingWithNoMoreData:(UIScrollView *)scrollView {
    [scrollView.mj_footer endRefreshingWithNoMoreData];
}

/**
 重新设置可以刷新状态
 @param scrollView 当前控制器下面的scrollView
 */
+(void)resetNoMoreData:(UIScrollView *)scrollView {
    [scrollView.mj_footer resetNoMoreData];
}

@end
