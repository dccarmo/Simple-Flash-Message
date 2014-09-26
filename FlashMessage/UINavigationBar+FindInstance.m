//
//  UINavigationBar+FindInstance.m
//
//  Created by Diogo do Carmo on 9/26/14.
//  Copyright (c) 2014 Diogo do Carmo. All rights reserved.
//

#import "UINavigationBar+FindInstance.h"

@implementation UINavigationBar (FindInstance)

+ (instancetype)findNavigationBarInView:(UIView *)view
{
    if ([view isKindOfClass:[UINavigationBar class]]) {
        return (UINavigationBar *) view;
    }
    
    for (UIView *subview in view.subviews) {
        UIView *navigationBar = [self findNavigationBarInView:subview];
        
        if (navigationBar) {
            return (UINavigationBar *) navigationBar;
        }
    }
    
    return nil;
}

@end
