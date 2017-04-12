//
//  TCTableViewCell.m
//  Detail_Demo
//
//  Created by pg on 16/8/19.
//  Copyright © 2016年 test. All rights reserved.
//

#import "YT_TCTableViewCell.h"

@implementation YT_TCTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initSubView];
    }
    return self;
}
- (void)initSubView {
    _headImage = [[UIImageView alloc] initWithFrame:CGRectMake(15, 15, 15, 15)];
    _titleLabel = [UILabel yt_createLable:CGRectMake(35, 10, 70, 17)
                                     Text:nil
                              TextAliType:NSTextAlignmentLeft
                                     Font:[UIFont fontWithName:@"PingFangSC-Regular" size:14]
                                    Color:nil];
    
    _numLabel = [UILabel yt_createLable:CGRectMake(35, 26, 50, 13)
                                   Text:nil
                            TextAliType:NSTextAlignmentLeft
                                   Font:[UIFont fontWithName:@"PingFangSC-Regular" size:11]
                                  Color:[UIColor grayColor]];
    
    //第二个百分数
    _secondLabel = [UILabel yt_createLable:CGRectMake(ScreenWidth - 50, 10, 80, 17)
                                      Text:nil TextAliType:NSTextAlignmentLeft
                                      Font:[UIFont fontWithName:@"PingFangSC-Regular" size:15]
                                     Color:nil];
    
    //成交箭头
    _arrowImage = [[UIImageView alloc] initWithFrame:CGRectMake(ScreenWidth - 72, 13, 16, 7)];
    [_arrowImage setImage:[UIImage imageNamed:@"cjj_arrow"]];
    
    //第一个百分数
    _firstLabel = [UILabel yt_createLable:CGRectMake(ScreenWidth - 156, 10, 80, 17)
                                     Text:nil
                              TextAliType:NSTextAlignmentRight
                                     Font:[UIFont fontWithName:@"PingFangSC-Regular" size:15]
                                    Color:nil];
    
    //成交价
    _priceLabel = [UILabel yt_createLable:CGRectMake(ScreenWidth - 104, 26, 100, 13)
                                     Text:nil
                              TextAliType:NSTextAlignmentLeft
                                     Font:[UIFont fontWithName:@"PingFangSC-Regular" size:11]
                                    Color:[UIColor grayColor]];
  
    //分割线
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 1)];
    lineView.backgroundColor = [UIColor colorWithRed:235/255.0 green:235/255.0 blue:241/255.0 alpha:1];
    [self.contentView addSubview:_headImage];
    [self.contentView addSubview:_titleLabel];
    [self.contentView addSubview:_numLabel];
    [self.contentView addSubview:_secondLabel];
    [self.contentView addSubview:_arrowImage];
    [self.contentView addSubview:_firstLabel];
    [self.contentView addSubview:_priceLabel];
    [self.contentView addSubview:lineView];
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
