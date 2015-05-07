//
//  ZYCOAuthModel.m
//  weibo
//
//  Created by qianfeng on 15-4-20.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import "ZYCOAuthModel.h"

@implementation ZYCOAuthModel


-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self=[super init]) {
        [self setValuesForKeysWithDictionary:dict];
        self.expiresTime=[[NSDate date] dateByAddingTimeInterval:self.expires_in];
    }
    return self;
}


+(instancetype)accountWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
    
}



-(id)initWithCoder:(NSCoder *)aDecoder
{
    if (self=[super init]) {
        self.access_token=[aDecoder decodeObjectForKey:@"access_token"];
        self.expiresTime=[aDecoder decodeObjectForKey:@"expiresTime"];
        self.expires_in=[aDecoder decodeInt64ForKey:@"expires_in"];
        self.remind_in=[aDecoder decodeInt64ForKey:@"remind_in"];
        self.uid=[aDecoder decodeInt64ForKey:@"uid"];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.access_token forKey:@"access_token"];
    [aCoder encodeObject:self.expiresTime forKey:@"expiresTime"];
    [aCoder encodeInt64:self.expires_in forKey:@"expires_in"];
    [aCoder encodeInt64:self.remind_in forKey:@"remind_in"];
    [aCoder encodeInt64:self.uid forKey:@"uid"];
}





@end
