//
//  YT_NewsTableViewCell.m
//  Detail_Demo_New
//
//  Created by pg on 16/8/24.
//  Copyright © 2016年 test. All rights reserved.
//

#import "YT_NewsTableViewCell.h"

@implementation YT_NewsTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initSubView];
    }
    return self;
}
- (void)initSubView {
    _titleLabel = [UILabel yt_createLable:CGRectMake(15, 8, 250, 40)
                                     Text:nil
                              TextAliType:NSTextAlignmentLeft
                                     Font:[UIFont fontWithName:@"PingFangSC-Regular" size:14]
                                    Color:[UIColor blackColor]];
    
    _dateLabel = [UILabel yt_createLable:CGRectMake(ScreenWidth - 75, 20, 60, 15)
                                    Text:nil
                             TextAliType:NSTextAlignmentLeft
                                    Font:[UIFont fontWithName:@"PingFangSC-Regular" size:12]
                                   Color:[UIColor grayColor]];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(15, 0, ScreenWidth - 30, 1)];
    lineView.backgroundColor = [UIColor colorWithRed:235/255.0 green:235/255.0 blue:241/255.0 alpha:1];
    [self.contentView addSubview:_titleLabel];
    [self.contentView addSubview:_dateLabel];
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
