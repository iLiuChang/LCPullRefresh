

# LCPullRefresh

Use UIActivityIndicatorView to provide a pull-to-refresh function for UIScrollView.

## Requirements

- **iOS 8.0+**
- **Xcode 11.0+**

## Usage

### Pull-up refresh

Add pull-up trigger event

```objective-c
[tableView lc_addHeaderRefreshingWithActionHandler:^{

}];
```

Manual refresh

```objective-c
[tableView lc_beginHeaderRefreshing];
```

### Drop down loading

Add dropdown trigger event

```objective-c
[tableView lc_addFooterRefreshingWithActionHandler:^{
  
}];
```

Add dropdown trigger event

```objective-c
[tableView lc_beginFooterRefreshing];
```

### End refresh

Because only one UIActivityIndicatorView is created, `lc_endRefreshing` will end all refreshes.

```objective-c
[self.tableView lc_endRefreshing];
```

### Set refresh direction

You can set horizontal or vertical refresh.

```objective-c
tableView.lc_refreshScrollDirection = LCRefreshScrollDirectionHorizontal;
```

## Installation

### CocoaPods

To integrate LCPullRefresh into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
pod 'LCPullRefresh'
```

### Manual

1. Download everything in the LCPullRefresh folder;
2. Add (drag and drop) the source files in LCPullRefresh to your project;
3. Import `UIScrollView+LCPullRefresh.h`.

## License

LCPullRefresh is provided under the MIT license. See LICENSE file for details.