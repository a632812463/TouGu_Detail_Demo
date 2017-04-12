#import "YT_LineChartView.h"

@implementation YT_LineChartView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    NSArray *arrLeft = @[@"20",@"10",@"0",@"-10",@"-20"];
    NSArray *arrBottom= @[@"03-18",@"04-03",@"04-18",@"05-03",@"05-18"];
    //创建 左边 和 底部控件
    for (int i = 0; i < 5; i ++) {
        UILabel *leftLabel = [UILabel yt_createLable:CGRectMake(15, 10 + 35 * i, 45, 15)
                                                Text:[NSString stringWithFormat:@"%@%%",arrLeft[i]]
                                         TextAliType:NSTextAlignmentRight
                                                Font:[UIFont fontWithName:@"PingFangSC-Regular-Bold" size:11]
                                               Color:nil];
        
        UILabel *bottomLabel = [UILabel yt_createLable:CGRectMake(50 + (ScreenWidth - 100)/4 * i, 170, 60, 15)
                                                  Text:[NSString stringWithFormat:@"%@",arrBottom[i]]
                                           TextAliType:NSTextAlignmentLeft
                                                  Font:[UIFont fontWithName:@"PingFangSC-Regular-Bold" size:13]
                                                 Color:nil];
        
        [self addSubview:leftLabel];
        [self addSubview:bottomLabel];
    }
    //画五条横线 五条竖线
    CGContextRef lineContext = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(lineContext, 1);
    CGContextSetStrokeColorWithColor(lineContext, [UIColor lightGrayColor].CGColor);
    CGContextMoveToPoint(lineContext, 70 , 15);
    CGContextAddLineToPoint(lineContext, ScreenWidth - 15, 15);
    CGContextMoveToPoint(lineContext, 70 , 50);
    CGContextAddLineToPoint(lineContext, ScreenWidth - 15, 50);
    CGContextMoveToPoint(lineContext, 70 , 85);
    CGContextAddLineToPoint(lineContext, ScreenWidth - 15, 85);
    CGContextMoveToPoint(lineContext, 70 , 120);
    CGContextAddLineToPoint(lineContext, ScreenWidth - 15, 120);
    CGContextMoveToPoint(lineContext, 70 , 155);
    CGContextAddLineToPoint(lineContext, ScreenWidth - 15, 155);
    
    
    CGContextMoveToPoint(lineContext, 75, 155);
    CGContextAddLineToPoint(lineContext, 75, 165);
    CGContextMoveToPoint(lineContext, 75 + (ScreenWidth - 100)/4, 155);
    CGContextAddLineToPoint(lineContext, 75+ (ScreenWidth - 100)/4, 165);
    CGContextMoveToPoint(lineContext, 75 + (ScreenWidth - 100)/4 * 2, 155);
    CGContextAddLineToPoint(lineContext, 75+ (ScreenWidth - 100)/4 * 2, 165);
    CGContextMoveToPoint(lineContext, 75 + (ScreenWidth - 100)/4 * 3, 155);
    CGContextAddLineToPoint(lineContext, 75+ (ScreenWidth - 100)/4 * 3, 165);
    CGContextMoveToPoint(lineContext, 75 + (ScreenWidth - 100)/4 * 4, 155);
    CGContextAddLineToPoint(lineContext, 75+ (ScreenWidth - 100)/4 * 4, 165);
    CGContextStrokePath(lineContext);
    
    //画两条折线
    CGContextRef firstLineContext = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(firstLineContext, 2);
    CGContextSetStrokeColorWithColor(firstLineContext, [UIColor redColor].CGColor);
    CGContextMoveToPoint(firstLineContext, 75, 85);
    CGContextAddLineToPoint(firstLineContext, 75 + (ScreenWidth - 100)/4, 97);
    CGContextAddLineToPoint(firstLineContext, 75 + (ScreenWidth - 100)/4 * 2, 86);
    CGContextAddLineToPoint(firstLineContext, 75 + (ScreenWidth - 100)/4 * 3, 65);
    CGContextAddLineToPoint(firstLineContext, 75 + (ScreenWidth - 100)/4 * 4, 43);
    CGContextStrokePath(firstLineContext);
    
    CGContextRef secondLineContext = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(secondLineContext, 2);
    CGContextSetStrokeColorWithColor(secondLineContext, [UIColor blueColor].CGColor);
    CGContextMoveToPoint(secondLineContext, 75, 85);
    CGContextAddLineToPoint(secondLineContext, 75 + (ScreenWidth - 100)/4, 117);
    CGContextAddLineToPoint(secondLineContext, 75 + (ScreenWidth - 100)/4 * 2, 92);
    CGContextAddLineToPoint(secondLineContext, 75 + (ScreenWidth - 100)/4 * 3, 132);
    CGContextAddLineToPoint(secondLineContext, 75 + (ScreenWidth - 100)/4 * 4, 105);
    CGContextStrokePath(secondLineContext);
}


@end