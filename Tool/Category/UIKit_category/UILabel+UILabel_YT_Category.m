//
//  UILabel+UILabel_YT_Category.m
//  Detail_Demo_New
//
//  Created by pg on 16/9/1.
//  Copyright © 2016年 test. All rights reserved.
//

#import "UILabel+UILabel_YT_Category.h"

@implementation UILabel (UILabel_YT_Category)
+ (UILabel *)yt_createLable:(CGRect)frame
                        Text:(NSString *)aText
                 TextAliType:(NSTextAlignment)aTextAliType
                        Font:(UIFont *)font
                       Color:(UIColor *)aColor {

    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    [label setText:aText];
    [label setTextAlignment:aTextAliType];
    if (font) {
        label.font = font;
    }
    if (aColor) {
        [label setTextColor:aColor];
    } 
    return label;
}

@end
