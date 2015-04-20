//
//  ZYCBadgeButton.m
//  weibo
//
//  Created by qianfeng on 15-4-13.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import "ZYCBadgeButton.h"

@implementation ZYCBadgeButton

-(instancetype)initWithPoint:(CGPoint)point
{
    if (self=[super init]) {
        
        self.frame=(CGRect){point,{0,0}};
        //添加提醒按钮
        self.hidden=YES;
        self.userInteractionEnabled=NO;
        UIImage *image =[UIImage imageWithIOS7Name:@"main_badge"];
        image=[image stretchableImageWithLeftCapWidth:10 topCapHeight:0];
        [self setBackgroundImage:image forState:UIControlStateNormal];
        self.titleLabel.font=[UIFont systemFontOfSize:10];
    }
    return self;
}

-(void)setBadgeValue:(NSString *)badgeValue
{
    
    _badgeValue=badgeValue;
    
    if (self.badgeValue) {
        self.hidden=NO;
        
        
//        CGFloat badgeY=1;
        CGFloat badgeW=self.currentBackgroundImage.size.width;
        if(self.badgeValue.length>1)
        {
            
            CGSize numSize =[self.badgeValue boundingRectWithSize:CGSizeMake(100, 100) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSAttachmentAttributeName:[UIFont systemFontOfSize:12]} context:nil].size;
            badgeW=numSize.width+10;
        }
        
        
        CGFloat badgeH=self.currentBackgroundImage.size.height;
//        CGFloat badgeX=self.frame.size.width-badgeW-5;
        CGFloat badgeX=self.frame.origin.x;
        CGFloat badgeY = self.frame.origin.y;
        [self setTitle:self.badgeValue forState:UIControlStateNormal];
        self.frame = CGRectMake(badgeX, badgeY, badgeW, badgeH);
        
    }
    else
    {
        self.hidden=YES;
    }

    
}



@end
