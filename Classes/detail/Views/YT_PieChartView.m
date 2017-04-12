//
//  pieChartView.m
//  Detail_Demo
//
//  Created by pg on 16/8/22.
//  Copyright © 2016年 test. All rights reserved.
//

#import "YT_PieChartView.h"

@implementation YT_PieChartView

- (void)drawRect:(CGRect)rect {
    
    //用线去涂色
    CGFloat fViewHalfWidth = rect.size.width/2.0;
    CGFloat fLineWidth = fViewHalfWidth;
    //内部空心位置 则减去相应长度
    CGFloat fInsideCircleWidth = 70;
    fLineWidth = fViewHalfWidth - fInsideCircleWidth;
    
    //饼状图 半径和 中心点
    CGFloat fCircleRadius = fViewHalfWidth - fLineWidth/2;
    CGPoint fCircleCenterPoint = CGPointMake(fViewHalfWidth, fViewHalfWidth);
    
    //数据，这里先写死，后期可改为属性接收后台数据
    NSArray<UIColor*>*arrColor = [NSArray arrayWithObjects:[UIColor redColor],[UIColor yellowColor],[UIColor orangeColor],[UIColor blueColor],[UIColor purpleColor], nil];
    NSArray<NSNumber*>*arrPercent = [NSArray arrayWithObjects:@(.5), @(.05),@(.05),@(.35),@(.05),nil];
    
    //开始画图
    CGContextRef pieViewContext = UIGraphicsGetCurrentContext();
    CGFloat fStartAngel = 0;
    CGFloat fEndAngel;
    for (int i = 0; i < arrColor.count; i++) {
        fEndAngel = fStartAngel + M_PI*2*arrPercent[i].floatValue;
        CGContextAddArc(pieViewContext, fCircleCenterPoint.x, fCircleCenterPoint.y, fCircleRadius, fStartAngel, fEndAngel, NO);
        CGContextSetStrokeColorWithColor(pieViewContext, arrColor[i].CGColor);
        CGContextSetLineWidth(pieViewContext, fLineWidth);
        CGContextStrokePath(pieViewContext);
        fStartAngel = fEndAngel;
    }
    //在饼状图中间放一个 label
    UILabel * centerLabel = [UILabel yt_createLable:CGRectMake((self.bounds.size.width - 100)/2, (self.bounds.size.height - 15)/2, 100, 15) Text:@"持股板块分布" TextAliType:NSTextAlignmentCenter Font:[UIFont fontWithName:@"PingFangSC-Regular" size:13] Color:nil];
    [self addSubview:centerLabel];
}
@end
