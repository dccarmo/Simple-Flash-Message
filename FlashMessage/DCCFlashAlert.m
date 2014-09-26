//
//  DCCFlashAlert.m
//
//  Created by Diogo do Carmo on 9/26/14.
//  Copyright (c) 2014 Diogo do Carmo. All rights reserved.
//

#import "DCCFlashAlert.h"

//Support
#import "UINavigationBar+FindInstance.h"

static const NSUInteger statusBarHeight = 20.f;

@interface DCCFlashAlert ()

@property (weak, nonatomic) IBOutlet UILabel *flashLabel;

@end

@implementation DCCFlashAlert

+ (void)showFlashAlertWithMessage:(NSString *)message type:(DCCFlashType)type
{
    UINavigationBar *navigationBar = [UINavigationBar findNavigationBarInView:[UIApplication sharedApplication].keyWindow];
    UIView *presentingView;
    
    DCCFlashAlert *flashAlert = [[[NSBundle mainBundle] loadNibNamed:@"DCCFlashAlert" owner:self options:nil] firstObject];
    
    flashAlert.flashLabel.text = message;
    
    switch (type) {
        case DCCFlashSuccessType:
            flashAlert.backgroundColor = [UIColor colorWithRed:0.176 green:0.772 blue:0.556 alpha:1];
            break;
        case DCCFlashErrorType:
            flashAlert.backgroundColor = [UIColor colorWithRed:1 green:0.2 blue:0.164 alpha:1];
            break;
    }
    
    if (navigationBar) {
        presentingView = navigationBar.superview;
        [presentingView insertSubview:flashAlert belowSubview:navigationBar];
    } else {
        presentingView = [UIApplication sharedApplication].keyWindow;
        [presentingView addSubview:flashAlert];
    }
    
    [flashAlert show];
}

#pragma mark - DCCFlashAlert

- (void)hide
{
    UINavigationBar *navigationBar = [UINavigationBar findNavigationBarInView:[UIApplication sharedApplication].keyWindow];
    
    [UIView animateWithDuration:0.5f
                          delay:0
         usingSpringWithDamping:0.7f
          initialSpringVelocity:0
                        options:0
                     animations:^{
                         if (navigationBar) {
                             self.frame = CGRectMake(0, CGRectGetMaxY(navigationBar.frame) - CGRectGetHeight(self.frame), CGRectGetWidth(self.superview.frame), CGRectGetHeight(self.frame));
                         } else {
                             self.frame = CGRectMake(0, - CGRectGetHeight(self.frame), CGRectGetWidth(self.superview.frame), CGRectGetHeight(self.frame));
                         }
                     }
                     completion:^(BOOL finished) {
                         [self removeFromSuperview];
                     }];
}

- (void)show
{
    UINavigationBar *navigationBar = [UINavigationBar findNavigationBarInView:[UIApplication sharedApplication].keyWindow];
    
    if (navigationBar) {
        self.frame = CGRectMake(0, CGRectGetMaxY(navigationBar.frame) - CGRectGetHeight(self.frame), CGRectGetWidth(self.superview.frame), CGRectGetHeight(self.frame));
    } else {
        self.frame = CGRectMake(0, - CGRectGetHeight(self.frame), CGRectGetWidth(self.superview.frame), CGRectGetHeight(self.frame) + statusBarHeight);
    }
    
    [UIView animateWithDuration:0.5f
                          delay:0
         usingSpringWithDamping:0.7f
          initialSpringVelocity:0
                        options:0
                     animations:^{
                         if (navigationBar) {
                             self.frame = CGRectMake(0, CGRectGetMaxY(navigationBar.frame), CGRectGetWidth(self.superview.frame), CGRectGetHeight(self.frame));
                         } else {
                             self.frame = CGRectMake(0, 0, CGRectGetWidth(self.superview.frame), CGRectGetHeight(self.frame));
                         }
                     }
                     completion:^(BOOL finished) {
                         [self performSelector:@selector(hide) withObject:nil afterDelay:3.0f];
                     }];
    
    
}

@end
