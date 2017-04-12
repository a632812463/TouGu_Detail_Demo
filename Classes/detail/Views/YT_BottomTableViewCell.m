//
//  YT_BottomTableViewCell.m
//  Detail_Demo_New
//
//  Created by pg on 16/8/24.
//  Copyright © 2016年 test. All rights reserved.
//

#import "YT_BottomTableViewCell.h"


@implementation YT_BottomTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initSubView];
    }
    return self;
}
- (void)initSubView {
   
  
    //三个按钮布局
    NSArray *arrName = @[@"调仓",@"编辑",@"分享"];
    NSArray *arrImage = @[@"transfer",@"edit",@"share"];
    for (int i = 0; i < 3; i ++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.tag = 1000 + i;
        [button setFrame:CGRectMake(65 + (ScreenWidth - 150)/2 * i, 15, 50, 15)];
        [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [button.titleLabel setFont:[UIFont fontWithName:@"PingFangSC" size:12]];
        [button setTitle:arrName[i] forState:UIControlStateNormal];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(button.frame.origin.x - 25, 12, 25, 21)];
        imageView.tag = 10000 + i;
        [imageView setImage:[UIImage imageNamed:arrImage[i]]];
        [self.contentView addSubview:button];
        [self.contentView addSubview:imageView];
    }
        //顶部分割线
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 1)];
    [lineView setBackgroundColor: [UIColor colorWithRed:235/255.0 green:235/255.0 blue:241/255.0 alpha:1]];
    [self.contentView addSubview:lineView];
    //两条竖线
    //UIView *firstLineView = [[UIView alloc]initWithFrame:CGRectMake(ScreenWidth/2 - 62, 10, 1, 25)];
    UIView *firstLineView = [[UIView alloc] init];
    firstLineView.backgroundColor = [UIColor grayColor];
    UIView *secondLineView = [[UIView alloc] init];
    secondLineView.backgroundColor = [UIColor lightGrayColor];
    //
    UIButton *btn01 = (UIButton*)[self.contentView viewWithTag:1000];
    UIImageView *imageView01 = (UIImageView*)[self.contentView viewWithTag:10001];
    [self.contentView addSubview:firstLineView];
    [firstLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(btn01.mas_right).with.offset((imageView01.frame.origin.x - btn01.frame.origin.x - 50)/2 );
        
        make.top.equalTo(lineView.mas_bottom).with.offset(9);
        make.size.mas_equalTo(CGSizeMake(1, 25));
    }];
    [self.contentView addSubview:secondLineView];
    UIButton *btn02 = (UIButton*)[self.contentView viewWithTag:1001];
    UIImageView *imageView02 = (UIImageView*)[self.contentView viewWithTag:10002];
    [secondLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(btn02.mas_right).with.offset((imageView02.frame.origin.x - btn02.frame.origin.x - 50)/2 );
       
        make.top.equalTo(lineView.mas_bottom).with.offset(9);
        make.size.mas_equalTo(CGSizeMake(1, 25));
    }];
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
