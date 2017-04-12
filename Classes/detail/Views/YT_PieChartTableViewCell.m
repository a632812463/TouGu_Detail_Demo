//
//  pieChartTableViewCell.m
//  Detail_Demo
//
//  Created by pg on 16/8/22.
//  Copyright © 2016年 test. All rights reserved.
//

#import "YT_PieChartTableViewCell.h"
#import "YT_PieChartView.h"
#import "YT_PercentView.h"

@implementation YT_PieChartTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initSubView];
    }
    return self;
}
- (void)initSubView {
    YT_PieChartView *pieView = [[YT_PieChartView alloc] initWithFrame:CGRectMake( ( ScreenWidth - 207 )/2, 14, 207, 207)];
    pieView.backgroundColor = [UIColor whiteColor];
    
    //创建 5 行配置，这里写死数组，后面可改成用属性数组传入数据
    NSArray *arrTitle = @[@"银行",@"汽车制造",@"保险",@"饲料加工",@"酿酒"];
    NSArray<NSNumber*> *arrPercent01 = @[@(5),@(35),@(50),@(5),@(5)];
    NSArray *arrPercent = @[@"0.05",@"0.35",@"0.5",@"0.05",@"0.05"];
    NSArray<UIColor*> *arrColor = [NSArray arrayWithObjects:[UIColor purpleColor],[UIColor blueColor],[UIColor redColor],[UIColor yellowColor],[UIColor orangeColor], nil];
    for (int i = 0; i < 5; i ++) {
        UIImageView *logoImage = [[UIImageView alloc] initWithFrame:CGRectMake(15, 250 + i*30, 15, 15)];
        [logoImage setImage:[UIImage imageNamed:@"set"]];
       
        UILabel *titleLabel = [UILabel yt_createLable:CGRectMake(45, 250 + i*30, 60, 15)
                                                 Text:arrTitle[i]
                                          TextAliType:NSTextAlignmentLeft
                                                 Font:[UIFont fontWithName:@"PingFangSC-Regular" size:15]
                                                Color:nil];
       
        UILabel *percentLabel = [UILabel yt_createLable:CGRectMake(ScreenWidth - 55, 250 + i*30, 40, 15)
                                                   Text:[NSString stringWithFormat:@"%@%%",arrPercent01[i]]
                                            TextAliType:NSTextAlignmentRight
                                                   Font:[UIFont fontWithName:@"PingFangSC-Regular" size:15]
                                                  Color:nil];
        
        YT_PercentView *pView = [[YT_PercentView alloc] initWithFrame:CGRectMake(120, 250 + i*30, 200 , 13)];
        pView.backgroundColor = [UIColor whiteColor];
        NSString *strNumber = arrPercent[i];
        CGFloat fNum = strNumber.floatValue;
        pView.fPercentNum = fNum;
        pView.color = arrColor[i];
        
        //分割线
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 1)];
        lineView.backgroundColor = [UIColor colorWithRed:235/255.0 green:235/255.0 blue:241/255.0 alpha:1];
        [self.contentView addSubview:logoImage];
        [self.contentView addSubview:titleLabel];
        [self.contentView addSubview:percentLabel];
        [self.contentView addSubview:pView];
        [self.contentView addSubview:lineView];
    }
    
    [self.contentView addSubview:pieView];
   
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
