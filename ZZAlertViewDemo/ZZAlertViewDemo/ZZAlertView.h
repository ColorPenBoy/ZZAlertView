//
//  ZZAlertView.h
//  sdfsa
//
//  Created by colorpen on 16/8/1.
//  Copyright © 2016年 colorpen. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ZZAlertViewCallBackBlock)(NSInteger index);

@interface ZZAlertView : UIView

+ (void)alertWithMessage:(NSAttributedString *)message
           cancelBtnName:(NSString *)cancelBtnName
            otherBtnName:(NSString *)otherBtnName
           callBackBlock:(ZZAlertViewCallBackBlock)alertViewCallBackBlock;

@end
