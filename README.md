

# LCPullRefresh

使用UIActivityIndicatorView给UIScrollView提供了刷新功能，支持上下左右四个方向刷新。

## 用法

### 上拉刷新

添加上拉触发事件

```objective-c
[tableView lc_addHeaderRefreshingWithActionHandler:^{

}];
```

手动刷新

```objective-c
[tableView lc_beginHeaderRefreshing];
```

### 下拉加载

添加下拉触发事件

```objective-c
[tableView lc_addFooterRefreshingWithActionHandler:^{
  
}];
```

手动刷新

```objective-c
[tableView lc_beginFooterRefreshing];
```

### 结束刷新

因为只创建了一个UIActivityIndicatorView，所以`lc_endRefreshing`会结束所有刷新。

```objective-c
[self.tableView lc_endRefreshing];
```

### 设置刷新方向

可以设置水平方向或垂直方向刷新。

```objective-c
// 设置左右刷新
tableView.lc_refreshScrollDirection = LCRefreshScrollDirectionHorizontal;
```

## 安装

### CocoaPods

1. 将 cocoapods 更新至最新版本;
2. 在 Podfile 中添加`pod 'LCPullRefresh'`;
3. 执行 `pod install` 或 `pod update`;
4. 导入` <LCPullRefresh/UIScrollView+LCPullRefresh.h>`.

### 手动安装

1. 下载 LCPullRefresh文件夹内的所有内容;
2. 将 LCPullRefresh内的源文件添加(拖放)到你的工程.

## 系统要求

- **iOS 8.0+**
- **Xcode 11.0+**

