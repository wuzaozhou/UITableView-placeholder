//
//  ViewController.m
//  tableView无数据占位图
//
//  Created by 吴灶洲 on 2017/7/21.
//  Copyright © 2017年 吴灶洲. All rights reserved.
//

#import "ViewController.h"
#import "KKRefresh.h"
#import "KKTableViewNoDataView.h"
#import "UITableView+placeholder.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, assign) BOOL flag;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    __weak typeof(self) weakself = self;
    [KKRefresh setHeaderWithScrollView:weakself.tableView refreshingBlaock:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            weakself.flag = !weakself.flag;
            [weakself.tableView reloadData];
            [KKRefresh endHeaderRefreshWithScrollView:weakself.tableView];
        });
    }];
    [KKRefresh beginHeaderRefreshWithScrollView:self.tableView];
    
    _tableView.placeHolderView = [[KKTableViewNoDataView alloc] initWithFrame:self.view.bounds image:[UIImage imageNamed:@"no_data"] viewClick:^{
        [weakself.tableView reloadData];
        [KKRefresh beginHeaderRefreshWithScrollView:weakself.tableView];
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (!_flag) {
        return 0;
    }
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"%zd", indexPath.row];
    return cell;
}

@end






