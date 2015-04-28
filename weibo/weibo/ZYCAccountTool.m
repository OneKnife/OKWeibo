//
//  ZYCAccountTool.m
//  weibo
//
//  Created by qianfeng on 15-4-20.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import "ZYCAccountTool.h"

@implementation ZYCAccountTool

+(void)saveAccount:(ZYCOAuthModel *)account
{
    
    NSString * path =NSHomeDirectory();
    
    path=[path stringByAppendingPathComponent:@"Documents/account.data"];
    
    
    [NSKeyedArchiver archiveRootObject:account toFile:path];
    
}

+(ZYCOAuthModel *)account
{
    NSString * path =NSHomeDirectory();
    //             NSLog(@"%@",path);
    path=[path stringByAppendingString:@"Documents/account.data"];
    ZYCOAuthModel * model =[NSKeyedUnarchiver unarchiveObjectWithFile:path];
    return model;
}

@end
