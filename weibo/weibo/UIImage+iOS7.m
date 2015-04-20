//
//  UIImage+iOS7.m
//  weibo
//
//  Created by qianfeng on 15-4-12.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import "UIImage+iOS7.h"

@implementation UIImage (ios7)

+(UIImage *) imageWithIOS7Name:(NSString *)imageName
{
    UIImage * image =nil;
    
    if (iOS7) {
        NSString * newName =[imageName stringByAppendingString:@"_os7"];
        image =[UIImage imageNamed:newName];
        if (!image) {
            //没有_os7后缀的图片
            image =[UIImage imageNamed:imageName];
            
        }
        image=[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
    }
    else
    {
        image=[UIImage imageNamed:imageName];
    }
    return image;
}

@end