//
//  ZYCOAuthModel.h
//  weibo
//
//  Created by qianfeng on 15-4-20.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZYCOAuthModel : NSObject<NSCoding>

@property (nonatomic,copy) NSString * access_token;
@property (nonatomic,assign) long long expires_in;
@property (nonatomic,assign) long long remind_in;
@property (nonatomic,assign) long long uid;


@end
