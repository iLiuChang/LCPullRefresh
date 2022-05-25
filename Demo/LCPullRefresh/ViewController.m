//
//  ViewController.m
//  LCPullRefresh
//
//  Created by 刘畅 on 2022/5/25.
//

#import "ViewController.h"
#import "UIScrollView+LCPullRefresh.h"

@interface UICollectionViewTextCell : UICollectionViewCell
@property (nonatomic, weak) UILabel *textLabel;
@end

@implementation UICollectionViewTextCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView.backgroundColor = [UIColor.blackColor colorWithAlphaComponent:0.2];
        UILabel *label = [[UILabel alloc] initWithFrame:self.bounds];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont boldSystemFontOfSize:25];
        [self.contentView addSubview:label];
        _textLabel = label;
    }
    return self;
}

@end
@interface ViewController ()<UICollectionViewDataSource>
{
    NSInteger count;
}
@property (nonatomic, weak) UICollectionView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.itemSize = CGSizeMake(100, 100);
    layout.minimumInteritemSpacing = 20;
    layout.minimumLineSpacing = 20;
    UICollectionView *tableView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, 150) collectionViewLayout:layout];
    tableView.dataSource = self;
    [tableView registerClass:UICollectionViewTextCell.class forCellWithReuseIdentifier:NSStringFromClass(UICollectionViewCell.class)];
    tableView.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
    tableView.lc_refreshActivityIndicatorStyle = UIActivityIndicatorViewStyleLarge;
 
    tableView.lc_refreshScrollDirection = LCRefreshScrollDirectionHorizontal;
    __weak __typeof(self) weakSelf = self;
    [tableView lc_addHeaderRefreshingWithActionHandler:^{
        [weakSelf reload:YES];

    }];
    [tableView lc_addFooterRefreshingWithActionHandler:^{
        [weakSelf reload:NO];
    }];
    [tableView lc_beginFooterRefreshing];
    // Do any additional setup after loading the view.
}

- (void)reload:(BOOL)header {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (header) {
            self->count=10;
        } else {
            self->count+=10;

        }

        [self.tableView reloadData];
        [self.tableView lc_endRefreshing];

        
    });


}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewTextCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass(UICollectionViewCell.class) forIndexPath:indexPath];
    cell.textLabel.text = @(indexPath.row).stringValue;
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return count;

}


@end
