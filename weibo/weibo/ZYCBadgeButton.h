//
//  ZYCBadgeButton.h
//  weibo
//
//  Created by qianfeng on 15-4-13.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZYCBadgeButton : UIButton

-(instancetype)initWithPoint:(CGPoint)point;

@property (nonatomic,copy) NSString * badgeValue;

@end
