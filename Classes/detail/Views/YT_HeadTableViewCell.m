//
//  headTableViewCell.m
//  Detail_Demo
//
//  Created by pg on 16/8/19.
//  Copyright © 2016年 test. All rights reserved.
//

#import "YT_HeadTableViewCell.h"

@implementation YT_HeadTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initSubView];
    }
    return self;
}
- (void)initSubView {
    //标题
    _titleLabel = [UILabel yt_createLable:CGRectMake(15, 9, 60, 14)
                                     Text:nil
                              TextAliType:NSTextAlignmentLeft
                                     Font:[UIFont fontWithName:@"PingFangSC-Regular" size:14]
                                    Color:[UIColor darkGrayColor]];
    
    //日期
    _dateLabel = [UILabel yt_createLable:CGRectMake(75, 11, 150, 12)
                                    Text:nil
                             TextAliType:NSTextAlignmentLeft
                                    Font:[UIFont fontWithName:@"PingFangSC-Regular" size:12]
                                   Color:[UIColor grayColor]];
    
    //箭头
    _arrowImage = [[UIImageView alloc] initWithFrame:CGRectMake(ScreenWidth - 20, 9, 8, 13)];
    //分割线
    _lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 32, ScreenWidth, 1)];
    _lineView.backgroundColor = [UIColor colorWithRed:235/255.0 green:235/255.0 blue:241/255.0 alpha:1];
    [self.contentView addSubview:_titleLabel];
    [self.contentView addSubview:_dateLabel];
    [self.contentView addSubview:_arrowImage];
    [self.contentView addSubview:_lineView];
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
#pragma mark -- 懒加载

@end
