//
//  headTableViewCell.h
//  Detail_Demo
//
//  Created by pg on 16/8/19.
//  Copyright © 2016年 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YT_HeadTableViewCell : UITableViewCell
@property (nonatomic, strong) UILabel *titleLabel;//左边标题
@property (nonatomic, strong) UILabel *dateLabel;//日期
@property (nonatomic, strong) UIImageView *arrowImage;//箭头
@property (nonatomic, strong) UIView *lineView;//分割线
@end
