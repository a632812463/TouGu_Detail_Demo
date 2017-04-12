//
//  UILabel+UILabel_YT_Category.h
//  Detail_Demo_New
//
//  Created by pg on 16/9/1.
//  Copyright © 2016年 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (UILabel_YT_Category)
/**
 *  创建label
 *
 *  @param frame        位置
 *  @param aText        内容
 *  @param aTextAliType 对齐
 *  @param font         字体
 *  @param aColor       字体颜色
 *
 *  @return label对象
 */
+ (UILabel *)yt_createLable:(CGRect)frame
                       Text:(NSString *)aText
                TextAliType:(NSTextAlignment)aTextAliType
                       Font:(UIFont *)font
                      Color:(UIColor *)aColor ;
@end
