//
//  ViewController.m
//  FlashMessage
//
//  Created by Diogo do Carmo on 9/26/14.
//  Copyright (c) 2014 Diogo do Carmo. All rights reserved.
//

#import "ViewController.h"

//View
#import "DCCFlashAlert.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)buttonAction:(id)sender
{
    [DCCFlashAlert showFlashAlertWithMessage:@"This is a flash message" type:DCCFlashSuccessType];
}

@end
