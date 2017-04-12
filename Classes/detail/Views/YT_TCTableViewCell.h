//
//  TCTableViewCell.h
//  Detail_Demo
//
//  Created by pg on 16/8/19.
//  Copyright © 2016年 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YT_TCTableViewCell : UITableViewCell
@property (nonatomic, strong) UILabel *titleLabel;//标题
@property (nonatomic, strong) UILabel *numLabel;//证券号
@property (nonatomic, strong) UILabel *firstLabel;//第一个百分数
@property (nonatomic, strong) UILabel *secondLabel;//第二个百分数
@property (nonatomic, strong) UILabel *priceLabel;//成交价
@property (nonatomic, strong) UIImageView *headImage;//
@property (nonatomic, strong) UIImageView *arrowImage;//成交价箭头
@end
