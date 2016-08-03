//
//  NSString+textSizeExtension.m
//  sdfsa
//
//  Created by colorpen on 16/8/1.
//  Copyright © 2016年 colorpen. All rights reserved.
//

#import "NSString+textSizeExtension.h"

@implementation NSString (textSizeExtension)

#pragma mark - 根据文字多少、格式大小绘制所需显示区域的CGSize
- (CGSize)stringCGSizeWithTextSize:(CGSize)textSize andFont:(UIFont *)font {
    
    CGSize tempSize = CGSizeZero;
    
    NSDictionary *contentDict = [NSDictionary dictionaryWithObjectsAndKeys:
                                 font, NSFontAttributeName,
                                 [UIColor blackColor], NSForegroundColorAttributeName,
                                 nil];
    CGRect rect = [self boundingRectWithSize:textSize
                                     options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                  attributes:contentDict
                                     context:nil];
    tempSize = rect.size;
    
    return tempSize;
}

@end
