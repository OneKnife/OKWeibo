//
//  ZYCAccountTool.h
//  weibo
//
//  Created by qianfeng on 15-4-20.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZYCOAuthModel.h"

@interface ZYCAccountTool : NSObject


+(void)saveAccount:(ZYCOAuthModel *)account;

+(ZYCOAuthModel *)account;

@end
