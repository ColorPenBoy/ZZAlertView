//
//  ZZAlertView.m
//  sdfsa
//
//  Created by colorpen on 16/8/1.
//  Copyright © 2016年 colorpen. All rights reserved.
//

#import "ZZAlertView.h"
#import "NSString+textSizeExtension.h"

static CGFloat const backgroundOpacity = 0.3f;

@interface ZZAlertView ()

@property (nonatomic, strong) ZZAlertViewCallBackBlock callBackBlock;


@property (strong, nonatomic) NSAttributedString * message;

@property (weak, nonatomic) IBOutlet UIView *alertViewItem;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alertViewHeightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textLabelHeightConstraint;

@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
@property (weak, nonatomic) IBOutlet UIButton *firstButton;
@property (weak, nonatomic) IBOutlet UIButton *lastButton;


@end

@implementation ZZAlertView

+ (void)alertWithMessage:(NSAttributedString *)message
           cancelBtnName:(NSString *)cancelBtnName
            otherBtnName:(NSString *)otherBtnName
           callBackBlock:(ZZAlertViewCallBackBlock)alertViewCallBackBlock
{
    
    
    ZZAlertView * alertView = [[[NSBundle mainBundle] loadNibNamed:@"ZZAlertView" owner:self options:nil] lastObject];
    alertView.frame = [UIScreen mainScreen].bounds;
    alertView.message = message;
    
   
    
    
    alertView.callBackBlock = alertViewCallBackBlock;
    
    alertView.messageLabel.attributedText = message;
    [alertView.firstButton setTitle:cancelBtnName forState:UIControlStateNormal];
    [alertView.lastButton setTitle:otherBtnName forState:UIControlStateNormal];
    
    [alertView showAlert];
}


- (void)setMessage:(NSAttributedString *)message {
    _message = message;
    
    // 计算显示内容高度
    CGSize size = [message.string stringCGSizeWithTextSize:CGSizeMake(self.messageLabel.frame.size.width, 999) andFont:self.messageLabel.font];
    
    self.textLabelHeightConstraint.constant = size.height + 10.0f;
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.alertViewItem.layer.masksToBounds = YES;
    self.alertViewItem.layer.cornerRadius = 5.0f;
    
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:backgroundOpacity];
}


#pragma mark - Private Method
- (void)showAlert {
 
    UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
    [window addSubview:self];
    
    [UIView animateWithDuration:0.25f animations:^{
        self.hidden = NO;
    }];
}

- (void)dismiss {
    
    [UIView animateWithDuration:0.25f animations:^{
      
        self.hidden = YES;
        
    } completion:^(BOOL finished) {
        
        [self removeFromSuperview];
        
    }];
}

#pragma mark - Click Block
- (IBAction)alertButtonClickAtIndex:(UIButton *)sender  {

    // 2100 for cancel, 2101 for other
    if (self.callBackBlock) {
        self.callBackBlock(sender.tag - 2100);
    }
    
    [self dismiss];
}

@end
