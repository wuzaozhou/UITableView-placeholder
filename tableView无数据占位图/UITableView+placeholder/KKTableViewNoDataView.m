//
//  UITableView+placeholder.m
//  BeautifulAgent
//
//  Created by 吴灶洲 on 2017/7/20.
//  Copyright © 2017年 kkmac. All rights reserved.
//

#import "KKTableViewNoDataView.h"

@interface KKTableViewNoDataView ()

@property (nonatomic, copy) void(^clickBlock)();
@property (nonatomic, strong) UIImageView *imgView;
@property (nonatomic, strong) UIImage *img;
@end


@implementation KKTableViewNoDataView

- (instancetype)initWithFrame:(CGRect)frame image:(UIImage *)img viewClick:(void(^)())clickBlock {
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor groupTableViewBackgroundColor];
        self.clickBlock = clickBlock;
        self.img = img;
        [self setupSubViews];
    }
    return self;
}

- (void)setupSubViews {
    UIImageView *imgView = [[UIImageView alloc] initWithImage:self.img];
    
    [self addSubview:imgView];
    self.imgView = imgView;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickImgView:)];
    imgView.userInteractionEnabled = YES;
    [imgView addGestureRecognizer:tap];
}


- (void)layoutSubviews {
    [super layoutSubviews];
    self.imgView.center = CGPointMake(self.center.x, self.center.y - 64);
}

- (void)clickImgView:(UITapGestureRecognizer *)recognizer {
    self.clickBlock();
}

@end


