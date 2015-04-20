//
//  ZYCTabBarView.h
//  weibo
//
//  Created by qianfeng on 15-4-13.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class  ZYCTabBarView;

@protocol ZYCTabBarDelegate <NSObject>

@optional
-(void)tabBar:(ZYCTabBarView *)tabBar didselectButtomFrom:(NSInteger)from to:(int)to;

@end

@interface ZYCTabBarView : UIView

@property (nonatomic,weak) id<ZYCTabBarDelegate> deleagate;

-(void)addTabBarButtonWithItem:(UITabBarItem *)item;

@end
