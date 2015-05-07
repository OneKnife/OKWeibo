//
//  ZYCWeiboTools.m
//  weibo
//
//  Created by qianfeng on 15-5-7.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import "ZYCWeiboTools.h"
#import "ZYCNewfeatureViewController.h"
#import "ZYCOAuthModel.h"
#import "ZYCOAuthViewController.h"
#import "ZYCAccountTool.h"
#import "ZYCTabBarViewController.h"


@implementation ZYCWeiboTools

+(void)chooseViewController
{
    
    
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    NSString * lastVersion = [defaults valueForKey:@"lastVersion"];
    
    NSString * currentVersion = [NSBundle mainBundle].infoDictionary[@"CFBundleVersion"];
    
    if (![lastVersion isEqualToString:currentVersion]) {
        [UIApplication sharedApplication].keyWindow.rootViewController=[[ZYCNewfeatureViewController alloc] init];
        [defaults setObject:currentVersion forKey:@"lastVersion"];
    }
    else
    {
        
        ZYCOAuthModel * model = [ZYCAccountTool account];
        
        if (!model) {
            
            ZYCOAuthViewController * vc =[[ZYCOAuthViewController alloc] init];
            [UIApplication sharedApplication].keyWindow.rootViewController=vc;
        }
        else
        {
            [UIApplication sharedApplication].keyWindow.rootViewController=[[ZYCTabBarViewController alloc]init];
            
        }
    }

}
@end
