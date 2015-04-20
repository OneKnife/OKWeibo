//
//  UITabBarItem+ZYC.h
//  weibo
//
//  Created by qianfeng on 15-4-15.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (ZYC)


+(UIBarButtonItem *)itemWithIcon:(NSString *)icon highLightIcon:(NSString *)highLightIcon target:(id)target action:(SEL)action;
@end
