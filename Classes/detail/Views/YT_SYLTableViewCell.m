//
//  SYLTableViewCell.m
//  Detail_Demo
//
//  Created by pg on 16/8/23.
//  Copyright © 2016年 test. All rights reserved.
//

#import "YT_SYLTableViewCell.h"
#import "YT_LineChartView.h"

@interface YT_SYLTableViewCell ()
{
    UIButton *supportButton;//点赞按钮
    UIButton *unsupportButton;
    NSInteger supportNum;
    NSInteger unsupportNum;
}
@end

@implementation YT_SYLTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initSubView];
    }return self;
}
- (void)initSubView {
    //设置分段控制器
    UISegmentedControl *segment = [[UISegmentedControl alloc] initWithItems:@[@"近3个月",@"近1年",@"全部"]];
    [segment setFrame:CGRectMake(15, 10, 165, 28)];
    [segment setTintColor:[UIColor redColor]];//
    [segment setSelectedSegmentIndex:0];//让其默认先选一项
    [self.contentView addSubview:segment];
    //设置两个标题
    UILabel *HSLabel = [UILabel yt_createLable:CGRectMake(ScreenWidth - 70, 14, 50, 15)
                                          Text:@"沪深300"
                                   TextAliType:NSTextAlignmentRight
                                          Font:[UIFont fontWithName:@"PingFangSC-Regular" size:12]
                                         Color:[UIColor grayColor]];
    
    UIImageView *HSImage = [[UIImageView alloc] initWithFrame:CGRectMake(ScreenWidth - 85, 15, 13, 13)];
    [HSImage setImage:[UIImage imageNamed:@"set"]];
    
    UILabel *ZHLabel = [UILabel yt_createLable:CGRectMake(ScreenWidth - 125, 14, 30, 15)
                                          Text:@"组合"
                                   TextAliType:NSTextAlignmentRight
                                          Font:[UIFont fontWithName:@"PingFangSC-Regular" size:12]
                                         Color:[UIColor grayColor]];
    
    UIImageView *ZHImage = [[UIImageView alloc] initWithFrame:CGRectMake(ScreenWidth - 135, 15, 13, 13)];
    [ZHImage setImage:[UIImage imageNamed:@"set"]];
    
    //折线图
    YT_LineChartView *lineView = [[YT_LineChartView alloc] initWithFrame:CGRectMake(0, 50, ScreenWidth, 200)];
    lineView.backgroundColor = [UIColor whiteColor];
    //铺一张 view 放 点赞和吐槽按钮
    UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, 280, ScreenWidth, 35)];
    bottomView.backgroundColor = [UIColor colorWithRed:235/255.0 green:235/255.0 blue:241/255.0 alpha:1];
    //中间分割线
    UIView *centerLineView = [[UIView alloc] initWithFrame:CGRectMake((ScreenWidth - 1)/2, 0, 1, 35)];
    centerLineView.backgroundColor = [UIColor whiteColor];
    //点赞按钮
    supportNum = 52324;
    supportButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [supportButton setBackgroundImage:[UIImage imageNamed:@"support_normal"] forState:UIControlStateNormal];
    [supportButton addTarget:self action:@selector(supportButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    _supportLabel = [[UILabel alloc] init];
    [_supportLabel setTextAlignment:NSTextAlignmentCenter];
    [_supportLabel setFont:[UIFont fontWithName:@"PingFangSC" size:14]];
    [_supportLabel setText:[NSString stringWithFormat:@"%ld",(long)supportNum]];
    //吐槽按钮
    unsupportNum = 32345;
    _unsupportLabel = [[UILabel alloc]init];
    [_unsupportLabel setTextAlignment:NSTextAlignmentCenter];
    [_unsupportLabel setFont:[UIFont fontWithName:@"PingFangSC" size:14]];
    [_unsupportLabel setText:[NSString stringWithFormat:@"%ld",(long)unsupportNum]];
    unsupportButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [unsupportButton setBackgroundImage:[UIImage imageNamed:@"unsupport_normal"] forState:UIControlStateNormal];
    [unsupportButton addTarget:self action:@selector(unsupportButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:centerLineView];
    [bottomView addSubview:_supportLabel];
    [_supportLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(centerLineView.mas_left).with.offset(-30);
        make.bottom.equalTo(centerLineView.mas_bottom).with.offset(-7.5);
        make.size.mas_equalTo(CGSizeMake(55, 15));
    }];
    [bottomView addSubview:supportButton];
    [supportButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_supportLabel.mas_left).with.offset(-10);
        make.bottom.equalTo(centerLineView.mas_bottom).with.offset(-7.5);
        make.size.mas_equalTo(CGSizeMake(20, 15));
    }];
    
    [bottomView addSubview:_unsupportLabel];
    [_unsupportLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(centerLineView.mas_right).with.offset(30);
        make.bottom.equalTo(centerLineView.mas_bottom).with.offset(-7.5);
        make.size.mas_equalTo(CGSizeMake(55, 15));
    }];
    [bottomView addSubview:unsupportButton];
    [unsupportButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_unsupportLabel.mas_right).with.offset(10);
        make.bottom.equalTo(centerLineView.mas_bottom).with.offset(-7.5);
        make.size.mas_equalTo(CGSizeMake(20, 15));
    }];
    
    [self.contentView addSubview:HSLabel];
    [self.contentView addSubview:HSImage];
    [self.contentView addSubview:ZHLabel];
    [self.contentView addSubview:ZHImage];
    [self.contentView addSubview:lineView];
    [self.contentView addSubview:bottomView];
    
}
- (void)supportButtonClick:(UIButton *)button {
    [button setBackgroundImage:[UIImage imageNamed:@"support_light"] forState:UIControlStateNormal];
    [_supportLabel setText:[NSString stringWithFormat:@"%ld",(long)++supportNum]];
    [supportButton setUserInteractionEnabled:NO];
    [unsupportButton setUserInteractionEnabled:NO];
}
- (void)unsupportButtonClick:(UIButton *)button {
    [button setBackgroundImage:[UIImage imageNamed:@"unsupport_light"] forState:UIControlStateNormal];
    [_unsupportLabel setText:[NSString stringWithFormat:@"%ld",(long)++unsupportNum]];
    [supportButton setUserInteractionEnabled:NO];
    [unsupportButton setUserInteractionEnabled:NO];
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
