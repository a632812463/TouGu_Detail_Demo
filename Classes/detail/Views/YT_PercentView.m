//
//  percentView.m
//  Detail_Demo
//
//  Created by pg on 16/8/22.
//  Copyright © 2016年 test. All rights reserved.
//

#import "YT_PercentView.h"

@implementation YT_PercentView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    //画比例条形图
    CGContextRef percentContext = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(percentContext, 13);
    CGContextSetStrokeColorWithColor(percentContext, [UIColor whiteColor].CGColor);//设置边框颜色
    UIBezierPath *path;
    float a = self.fPercentNum;
    path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0,  self.frame.size.width * a, 13) byRoundingCorners:(UIRectCornerBottomRight|UIRectCornerTopRight)cornerRadii:CGSizeMake(10, 10)];
    //设定颜色，并绘制它们 宽度 * self.num.intValue
    [path stroke];
    //填充颜色
    [self.color setFill];
    [path fill];
}


@end
