//
//  UITableView+placeholder.h
//  BeautifulAgent
//
//  Created by 吴灶洲 on 2017/7/20.
//  Copyright © 2017年 kkmac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KKTableViewNoDataView : UIView


- (instancetype)initWithFrame:(CGRect)frame image:(UIImage *)img viewClick:(void(^)())clickBlock;

@end
