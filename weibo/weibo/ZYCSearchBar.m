//
//  ZYCSearchBar.m
//  weibo
//
//  Created by qianfeng on 15-4-19.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import "ZYCSearchBar.h"

@implementation ZYCSearchBar

+(ZYCSearchBar *)searchBar
{
    return [[self alloc] init];
}

-(instancetype)init
{
    if (self=[super init]) {
        self.frame=CGRectMake(0, 0, 300, 30);
        self.background=[[UIImage imageNamed:@"searchbar_textfield_background"] stretchableImageWithLeftCapWidth:5 topCapHeight:5];
        UIImageView * iconView =[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"searchbar_textfield_search_icon"]];
        iconView.contentMode=UIViewContentModeCenter;
        iconView.frame=CGRectMake(0, 0, 30, 30);
        self.leftView=iconView;
        self.leftViewMode=UITextFieldViewModeAlways;
    }
    
    
    return self;
}


@end
