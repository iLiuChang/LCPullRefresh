//
//  UIScrollView+LCRefresh.h
//  LCHelperDemo
//
//  Created by 刘畅 on 2019/4/16.
//  Copyright © 2019 LiuChang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^LCRefreshActionHandler)(void);

typedef NS_ENUM(NSInteger, LCRefreshScrollDirection) {
    LCRefreshScrollDirectionVertical,
    LCRefreshScrollDirectionHorizontal
};

@interface UIScrollView (LCPullRefresh)

/**
 *  刷新控件类型 default is UIActivityIndicatorViewStyleGray
 */
@property(nonatomic, assign) UIActivityIndicatorViewStyle lc_refreshActivityIndicatorStyle;

/**
 *  滑动方向 default is LCRefreshScrollDirectionVertical
 */
@property(nonatomic, assign) LCRefreshScrollDirection lc_refreshScrollDirection;

/**
 *  是否需要头部刷新
 */
@property(nonatomic, assign) BOOL lc_headerRefreshEnabled;

/**
 *  是否需要底部刷新
 */
@property(nonatomic, assign) BOOL lc_footerRefreshEnabled;

/**
 *  是否正在刷新
 */
@property(nonatomic, readonly) BOOL lc_refreshing;

/**
 *  开始头部刷新
 */
-(void)lc_beginHeaderRefreshing;

/**
 *  开始底部刷新
 */
-(void)lc_beginFooterRefreshing;

/**
 *  取消所有刷新
 */
-(void)lc_endRefreshing;

/**
 *  取消所有刷新
 */
- (void)lc_endRefreshingAnimated:(BOOL)animation;

/**
 *  添加头部刷新
 *  actionHandler: 完成回调
 */
-(void)lc_addHeaderRefreshingWithActionHandler:(LCRefreshActionHandler)actionHandler;

/**
 *  添加底部刷新
 *  actionHandler: 完成回调
 */
-(void)lc_addFooterRefreshingWithActionHandler:(LCRefreshActionHandler)actionHandler;

@end

NS_ASSUME_NONNULL_END

