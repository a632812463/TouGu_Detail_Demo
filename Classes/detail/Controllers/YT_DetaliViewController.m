//
//  detaliViewController.m
//  Detail_Demo
//
//  Created by pg on 16/8/16.
//  Copyright © 2016年 test. All rights reserved.
//

#import "YT_DetaliViewController.h"
#import "YT_HeadTableViewCell.h"
#import "YT_TCTableViewCell.h"
#import "YT_PieChartTableViewCell.h"
#import "YT_SYLTableViewCell.h"
#import "YT_NewsTableViewCell.h"
#import "YT_BottomTableViewCell.h"

#define sectionTailHeight 1
#define sectionHeadHeight 9
#define defaultRowHeight 45 //默认的行高
#define bigRowHeight 400 //模块大的行高
#define headRowHeight 32 //首行高度
@interface YT_DetaliViewController ()<UITableViewDelegate,UITableViewDataSource> {
    UITableView *mainTableView;
    UIView *tableHeadView;
    UIView *barView;//导航栏
    UIButton *attentionBtn;//关注按钮
}
@end

@implementation YT_DetaliViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //自定义导航栏
    [self createNavication];
    //创建tableview
    [self createTableView];
    
    
}

#pragma mark -- tableView
- (void)createTableView {
    mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenHeight) style:UITableViewStyleGrouped];
    mainTableView.dataSource = self;
    mainTableView.delegate = self;
    //取消弹性
    mainTableView.bounces = NO;
    //头部 自定义
    [self createHeadView];
    mainTableView.tableHeaderView = tableHeadView;//设置表头
   
    [mainTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];//把分割线去掉
    [self.view addSubview:mainTableView];
    
}
#pragma mark -- tableView协议方法
//返回段数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}
//返回每组行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 1||section == 2) {
        return 2;
    } else if (section == 3) {
        return 6;
    } else {
        return 4;
    }
    
}
//返回段头高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 3) {
        return sectionTailHeight;
    } else {
        return sectionHeadHeight;
    }
    
}
//返回段尾高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return sectionTailHeight;
}
//返回行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return headRowHeight;
        } else {
            return defaultRowHeight;
        }
    } else if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            return headRowHeight;
        } else {
            return bigRowHeight;
        }
    } else if (indexPath.section == 2) {
        if (indexPath.row == 0) {
            return headRowHeight;
        } else {
            return bigRowHeight - 85;
        }
    } else if (indexPath.section == 3) {
        if (indexPath.row == 0) {
            return headRowHeight;
        } else if (indexPath.row == 5) {
            return defaultRowHeight + 19;
        } else {
            return defaultRowHeight + 9;
        }
    } else {
        return defaultRowHeight;
    }
    
    
}

//返回自定义cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            YT_HeadTableViewCell *headCell = [[YT_HeadTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
            [headCell setSelectionStyle:UITableViewCellSelectionStyleNone];
            [headCell.titleLabel setText:@"调仓记录"];
            [headCell.dateLabel setText:@"(16/06/01 15:23:20)"];
            [headCell.arrowImage setImage:[UIImage imageNamed:@"arrow"]];
            return headCell;
        } else {
            YT_TCTableViewCell *TCCell = [[YT_TCTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
            [TCCell setSelectionStyle:UITableViewCellSelectionStyleNone];
            //创建数组
            NSArray *arrOne = @[@"胜利精密",@"中国平安",@"中房地产"];
            NSArray *arrTwo = @[@"002426",@"600129",@"000582"];
            NSArray *arrThree = @[@"15.6%",@"40.29%",@"10%"];
            NSArray *arrFour = @[@"30%",@"27.3%",@"20%"];
            NSArray *arrFive = @[@"23.67",@"12.35",@"15.29"];
            [TCCell.titleLabel setText:arrOne[indexPath.row - 1]];
            [TCCell.numLabel setText:arrTwo[indexPath.row - 1]];
            [TCCell.firstLabel setText:arrThree[indexPath.row - 1]];
            [TCCell.secondLabel setText:arrFour[indexPath.row - 1]];
            [TCCell.priceLabel setText:[NSString stringWithFormat:@"参考成交价 %@",arrFive[indexPath.row - 1]]];
            if (indexPath.row == 2) {
                [TCCell.headImage setImage:[UIImage imageNamed:@"sell"]];
            } else {
                [TCCell.headImage setImage:[UIImage imageNamed:@"buy"]];
            }
            return TCCell;
        }
    } else if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            YT_HeadTableViewCell *headCell = [[YT_HeadTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
            [headCell setSelectionStyle:UITableViewCellSelectionStyleNone];
            [headCell.titleLabel setText:@"组合配置"];
            [headCell.arrowImage setImage:[UIImage imageNamed:@"arrow"]];
            return headCell;
        } else {
            YT_PieChartTableViewCell *cell = [[YT_PieChartTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
            
            return cell;
        }
    } else if (indexPath.section == 2) {
        if (indexPath.row == 0) {
            YT_HeadTableViewCell *headCell = [[YT_HeadTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
            [headCell setSelectionStyle:UITableViewCellSelectionStyleNone];
            [headCell.titleLabel setFrame:CGRectMake(15, 9, 80, 14)];
            [headCell.titleLabel setText:@"收益率走势"];
            return headCell;
        } else {
            YT_SYLTableViewCell *cell = [[YT_SYLTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
            
            return cell;
        }
    } else if (indexPath.section == 3) {
        if (indexPath.row == 0) {
            YT_HeadTableViewCell *headCell = [[YT_HeadTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
            
            [headCell setSelectionStyle:UITableViewCellSelectionStyleNone];
            [headCell.titleLabel setFrame:CGRectMake((ScreenWidth - 80)/2, 9, 80, 14)];
            [headCell.titleLabel setTextAlignment:NSTextAlignmentCenter];
            [headCell.titleLabel setText:@"相关资讯"];
            return headCell;
        } else if (indexPath.row == 5) {
            YT_BottomTableViewCell *cell = [[YT_BottomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
            return cell;
        } else {
            //创建数组
            NSArray *arrOne = @[@"互联网公司火“拼”春运",@"A股本周可关注两会行情 周期股收益或超成长股行情四大行聚焦两会两点...",@"国家能源局：推进煤矿企业兼并重组",@"上市公司公告速递-深市 (2016-01-29)"];
            NSArray *arrTwo = @[@"16/06/13",@"16/06/13",@"16/06/13",@"16/06/13"];
            YT_NewsTableViewCell *cell = [[YT_NewsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
            [cell.titleLabel setText:arrOne[indexPath.row - 1]];
            [cell.dateLabel setText:arrTwo[indexPath.row - 1]];
            return cell;
        }
    } else {
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        return cell;
    }
    
}
#pragma mark -- 隐藏导航栏
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    barView.frame = CGRectMake(0,  - scrollView.contentOffset.y, ScreenWidth, 64) ;
    
    if (barView.frame.origin.y <= -44) {
        barView.frame = CGRectMake(0, -44, ScreenWidth, 64);
        attentionBtn.alpha = 1 - (scrollView.contentOffset.y + 20)/64;
    }
    if (barView.frame.origin.y >= 0) {
        barView.frame = CGRectMake(0, 0, ScreenWidth, 64);
        attentionBtn.alpha = 1;
    }
    
    mainTableView.frame = CGRectMake(0, CGRectGetMaxY(barView.frame) , ScreenWidth, ScreenHeight - 44 - barView.frame.origin.y);
}
#pragma mark -- 头部
- (void)createHeadView {

    tableHeadView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 256)];
    tableHeadView.backgroundColor = [UIColor whiteColor];
    UIImageView * headView = [[UIImageView alloc] init];
    //这里应该也有一个数据判断是盈利还是亏损，现在默认亏损
    [headView setImage:[UIImage imageNamed:@"background"]];
    
    //金牌UIImageView
    UIImageView *goldenView = [[UIImageView alloc] init];
    [goldenView setImage:[UIImage imageNamed:@"gold"]];
    
    //关注Label
    //这里应该有一个后台数据显示关注数的
     UILabel *attentionLabel = [UILabel yt_createLable:CGRectZero
                                                Text:@"1888人关注"
                                         TextAliType:NSTextAlignmentCenter
                                                Font:[UIFont fontWithName:@"PingFangSC-Light" size:12]
                                               Color:[UIColor whiteColor]];

    //总收益率标题label
    UILabel *profitTitleLabel = [UILabel yt_createLable:CGRectMake(15, 36, 70, 14)
                                                   Text:@"总收益率"
                                            TextAliType:NSTextAlignmentLeft
                                                   Font:[UIFont fontWithName:@"PingFangSC-Regular" size:14]
                                                  Color:[UIColor whiteColor]];
    
    //总收益率数据Label
    UILabel *profitNumLabel = [UILabel yt_createLable:CGRectMake(15, 45, 176, 70)
                                                 Text:@"52.44" TextAliType:NSTextAlignmentLeft
                                                 Font:[UIFont fontWithName:@"HelveticaNeue-Medium" size:70]
                                                Color:[UIColor whiteColor]];
    
    //百分号label
    UILabel *percentLabel = [UILabel yt_createLable:CGRectMake(187, 87, 20, 20)
                                               Text:@"%"
                                        TextAliType:NSTextAlignmentLeft
                                               Font:[UIFont fontWithName:@"HelveticaNeue-Medium" size:20]
                                              Color:[UIColor whiteColor]];

    //画条分割线
    UIView *headLineView = [[UIView alloc] init];
    headLineView.backgroundColor = [UIColor lightTextColor];
    
    //两组label
    //创建两个数组装载数据，第二组Label的值一般应该是直接获取后台数据的
    NSArray *oneArr = @[@"日",@"月",@"净值",@"组合收益排行"];
    NSArray *twoArr = @[@"0.46%",@"-3.14%",@"1.5244",@"战胜 98% 组合"];
    for (int i = 0; i < 4; i++) {
        UILabel *firstLabel = [UILabel yt_createLable:CGRectMake(34 + (ScreenWidth - 100)/4 * i, 130, 85, 13)
                                                 Text:[NSString stringWithFormat:@"%@",oneArr[i]]
                                          TextAliType:NSTextAlignmentLeft
                                                 Font:[UIFont fontWithName:@"PingFangSC-Light" size:13]
                                                Color:[UIColor whiteColor]];
        [headView addSubview:firstLabel];
        
        //画条竖线分割
        if (i == 3) {
            UIView *headLineView02 = [[UIView alloc] initWithFrame:CGRectMake(34 + (ScreenWidth - 100)/4 * 3 - (ScreenWidth -100)/14, 130, 1, 33)];
            headLineView02.backgroundColor = [UIColor lightTextColor];
            [headView addSubview:headLineView02];
        }
        
        UILabel *secondLabel = [UILabel yt_createLable:CGRectMake(28 + (ScreenWidth - 100)/4 * i, 150, 90, 13)
                                                  Text:[NSString stringWithFormat:@"%@",twoArr[i]]
                                           TextAliType:NSTextAlignmentLeft
                                                  Font:[UIFont fontWithName:@"HelveticaNeue-Medium" size:13]
                                                 Color:[UIColor whiteColor]];
        [headView addSubview:secondLabel];
    }
    
    //股神一栏
    //股神头像
    UIImageView *gushenImage = [[UIImageView alloc] initWithFrame:CGRectMake(15, 191, 33, 33)];
    [gushenImage setImage:[UIImage imageNamed:@"gushen"]];
    
    //名称
    UILabel *nameLabel = [UILabel yt_createLable:CGRectMake(55, 193, 30, 12)
                                            Text:@"股神"
                                     TextAliType:NSTextAlignmentLeft
                                            Font:[UIFont fontWithName:@"PingFangSC-Medium" size:12]
                                           Color:nil];
    
    //内容
    UILabel *contentLabel = [UILabel yt_createLable:CGRectMake(55, 193, 170, 55)
                                               Text:@"组合是长期经营的和做人一样收益IPO注册制的投创类上市公司"
                                        TextAliType:NSTextAlignmentLeft
                                               Font:[UIFont fontWithName:@"PingFangSC-Light" size:12]
                                              Color:nil];
    contentLabel.numberOfLines = 0;
    
    //竖线分割
    UIView *lineView03 = [[UIView alloc] initWithFrame:CGRectMake(250, 206, 1, 27)];
    lineView03.backgroundColor = [UIColor lightGrayColor];
    
    //两行日期
    UILabel *dateLabel01 = [UILabel yt_createLable:CGRectMake(265, 206, 60, 12)
                                              Text:@"15/05/16" TextAliType:NSTextAlignmentLeft
                                              Font:[UIFont fontWithName:@"PingFangSC-Regular" size:12]
                                             Color:nil];
    
    UILabel *dateContent01 = [UILabel yt_createLable:CGRectMake(320, 206, 50, 12)
                                                Text:@"创建"
                                         TextAliType:NSTextAlignmentLeft
                                                Font:[UIFont fontWithName:@"PingFangSC-Regular" size:12]
                                               Color:[UIColor grayColor]];
    
    UILabel *dateLabel02 = [UILabel yt_createLable:CGRectMake(265, 221, 60, 12)
                                              Text:@"15/05/16"
                                       TextAliType:NSTextAlignmentLeft
                                              Font:[UIFont fontWithName:@"PingFangSC-Regular" size:12]
                                             Color:[UIColor redColor]];
    
    UILabel *dateContent02 = [UILabel yt_createLable:CGRectMake(320, 221, 50, 12)
                                                Text:@"更新"
                                         TextAliType:NSTextAlignmentLeft
                                                Font:[UIFont fontWithName:@"PingFangSC-Regular" size:12]
                                               Color:[UIColor grayColor]];
    
    [tableHeadView addSubview:headView];
    [headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(tableHeadView.mas_left).with.offset(0);
        make.right.equalTo(tableHeadView.mas_right).with.offset(0);
        make.top.equalTo(tableHeadView.mas_top).with.offset(0);
        make.bottom.equalTo(tableHeadView.mas_bottom).with.offset(0);
    }];
    [headView addSubview:goldenView];
    [goldenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(tableHeadView.mas_left).with.offset(15);
        make.top.equalTo(tableHeadView.mas_top).with.offset(0);
        make.size.mas_equalTo(CGSizeMake(23, 23));
    }];
    [headView addSubview:attentionLabel];
    [attentionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(tableHeadView.mas_right).with.offset(- 15);
        make.top.equalTo(tableHeadView.mas_top).with.offset(7);
        make.size.mas_equalTo(CGSizeMake(70, 15));
    }];
    [headView addSubview:profitTitleLabel];
    [headView addSubview:profitNumLabel];
    [headView addSubview:percentLabel];
    [headView addSubview:headLineView];
    [headLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(tableHeadView.mas_left).with.offset(15);
        make.top.equalTo(profitNumLabel.mas_bottom).with.offset(5);
        make.size.mas_equalTo(CGSizeMake(ScreenWidth - 30, 1));
    }];
    [tableHeadView addSubview:gushenImage];
    [tableHeadView addSubview:nameLabel];
    [tableHeadView addSubview:contentLabel];
    [tableHeadView addSubview:lineView03];
    [tableHeadView addSubview:dateLabel01];
    [tableHeadView addSubview:dateContent01];
    [tableHeadView addSubview:dateLabel02];
    [tableHeadView addSubview:dateContent02];
}
#pragma mark -- 导航栏
- (void)createNavication {
    //创建一个代替导航栏的view
    barView= [[UIView alloc] init];
    barView.userInteractionEnabled = YES;
    
    //创建标题
    UILabel * titleLabel = [UILabel yt_createLable:CGRectZero
                                              Text:@"高管增持盈利组合"
                                       TextAliType:NSTextAlignmentCenter
                                              Font:[UIFont fontWithName:@"PingFangSC-Regular" size:15]
                                             Color:[UIColor whiteColor]];
    
    //右边关注按钮
    attentionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    //接收一个网络数据，判断是否已关注（现在默认未关注）
    //[attentionBtn setFrame:CGRectMake(ScreenWidth - 70, 30, 55, 21)];
    [attentionBtn setBackgroundImage:[UIImage imageNamed:@"attention"] forState:UIControlStateNormal];
    [attentionBtn addTarget:self action:@selector(attentionBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    //两种情况 盈利(红:251 36 7) 或者 亏损(绿:25 165 59)
    if (/* DISABLES CODE */ (1)) {
        barView.backgroundColor = [UIColor colorWithRed:251/255.0 green:36/255.0 blue:7/255.0 alpha:1.0];
    }else {
        barView.backgroundColor = [UIColor colorWithRed:25/255.0 green:165/255.0 blue:59/255.0 alpha:1.0];
    }
    
    [self.view addSubview:barView];
    //添加约束
    [barView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(0);
        make.right.equalTo(self.view.mas_right).with.offset(0);
        make.top.equalTo(self.view.mas_top).with.offset(0);
        make.bottom.equalTo(self.view.mas_top).with.offset(64);
    }];
    [barView addSubview:titleLabel];
    //添加约束
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(barView);
        make.size.mas_equalTo(CGSizeMake(160, 15));
    }];
    
    [barView addSubview:attentionBtn];
    //添加约束
    [attentionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(barView.mas_right).with.offset(-10);
        make.top.equalTo(barView.mas_top).with.offset(30);
        make.size.mas_equalTo(CGSizeMake(55, 21));
    }];
    
}

#pragma mark -- 关注按钮
- (void)attentionBtnClick:(UIButton *)button {
    [attentionBtn setBackgroundImage:[UIImage imageNamed:@"attentioned"] forState:UIControlStateNormal];
    //回调一个数据给后台，让后台记录已关注。若是再点击一次则再回调一个数据给后台取消关注，图片也再次改变。
}
#pragma mark -- 懒加载

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
