//
//  DCCFlashAlert.h
//
//  Created by Diogo do Carmo on 9/26/14.
//  Copyright (c) 2014 Diogo do Carmo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, DCCFlashType)
{
    DCCFlashSuccessType,
    DCCFlashErrorType
};

@interface DCCFlashAlert : UIView

/**
 *	Show an flash alert message below the navigation bar or on top of the screen
 *
 *	@param message The message to be show
 *	@param type    The type of the message
 */
+ (void)showFlashAlertWithMessage:(NSString *)message type:(DCCFlashType)type;

@end
