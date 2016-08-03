//
//  NSString+textSizeExtension.h
//  sdfsa
//
//  Created by colorpen on 16/8/1.
//  Copyright © 2016年 colorpen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (textSizeExtension)

- (CGSize)stringCGSizeWithTextSize:(CGSize)textSize andFont:(UIFont *)font;

@end
