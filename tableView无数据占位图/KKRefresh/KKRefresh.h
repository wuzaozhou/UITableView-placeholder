//
//  KKRefresh.h
//  MJRefresh
//
//  Created by kkmac on 2017/3/13.
//  Copyright © 2017年 kkmac. All rights reserved.
//

/**
 刷新封装类
 创建日期 2017-3-10
 作用：上拉加载更多下拉刷新
 */

#import <UIKit/UIKit.h>
#import "MJRefresh.h"
/*定义tableiView下拉刷新的block*/
typedef void(^HeaderRefreshingBlock)();
/*定义tableView上拉加载更多的block*/
typedef void(^FooterRefreshingBlock)();

@interface KKRefresh : UIViewController
/*tableView下拉刷新的block*/
@property (nonatomic,strong)HeaderRefreshingBlock headerRefreshingBlock;
/*tableView上拉加载的block*/
@property (nonatomic,strong)FooterRefreshingBlock FooterRefreshingBlock;

+ (KKRefresh *)shareInstance;

/**
 *  设置头部刷新
 *  @param scrollView 当前控制器下面scrollView
 *  @param block 刷新回调block
 */
+(void)setHeaderWithScrollView:(UIScrollView *)scrollView refreshingBlaock:(HeaderRefreshingBlock)block;

/**
 开始头部刷新
 @param scrollView 当前控制器下面的scrollView
 */
+(void)beginHeaderRefreshWithScrollView:(UIScrollView *)scrollView;

/**
 结束头部刷新
 @param scrollView 当前控制器下面的scrollView
 */
+(void)endHeaderRefreshWithScrollView:(UIScrollView *)scrollView;

/**
 *  设置上拉加载更多
 *  @param scrollView 当前控制器下面的scrollView
 *  @param block 刷新回调block
 */
+(void)setFooterWithScrollView:(UIScrollView *)scrollView target:(id)target refreshingBlaock:(FooterRefreshingBlock)block;

/**
 开始底部刷新
 @param scrollView 当前控制器下面的tableView或者collectionView
 */
+(void)beginFooterRefreshWithScrollView:(UIScrollView *)scrollView;

/**
 结束底部刷新
 @param scrollView 当前控制器下面的scrollView
 */
+(void)endFooterRefreshWithScrollView:(UIScrollView *)scrollView;

/**
 提示没有更多数据
 @param scrollView 当前控制器下面的scrollView
 */
+(void)endFooterRefreshingWithNoMoreData:(UIScrollView *)scrollView;

/**
 重新设置可以刷新状态
 @param scrollView 当前控制器下面的scrollView
 */
+(void)resetNoMoreData:(UIScrollView *)scrollView;
@end

