//
//  UITabBarItem+ZYC.m
//  weibo
//
//  Created by qianfeng on 15-4-15.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import "UIBarButtonItem+ZYC.h"

@implementation UIBarButtonItem (ZYC)
+(UIBarButtonItem *)itemWithIcon:(NSString *)icon highLightIcon:(NSString *)highLightIcon target:(id)target action:(SEL)action
{
    UIButton * button =[UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageWithIOS7Name:icon] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageWithIOS7Name:highLightIcon] forState:UIControlStateHighlighted];
    button.frame=(CGRect){CGPointZero,button.currentBackgroundImage.size};
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}
@end
