//
//  ZYCTabBarView.m
//  weibo
//
//  Created by qianfeng on 15-4-13.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import "ZYCTabBarView.h"
#import "ZYCTabBarButton.h"

@interface ZYCTabBarView ()
@property (nonatomic,weak) ZYCTabBarButton * selectedButton;
@property (nonatomic,weak) UIButton * plusButton;
@property (nonatomic,strong) NSMutableArray * tabBarButtons;

@end

@implementation ZYCTabBarView

-(NSMutableArray *)tabBarButtons
{
    if (_tabBarButtons==nil) {
        _tabBarButtons  =[NSMutableArray array];
    }
    return _tabBarButtons;
}

-(instancetype)init
{
    
    if (self=[super init]) {
        if (!iOS7) {
            self.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageWithIOS7Name:@"tabbar_background"]];
        }
        
        // 添加一个加号按钮
        _plusButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_plusButton setBackgroundImage:[UIImage imageWithIOS7Name:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [_plusButton setBackgroundImage:[UIImage imageWithIOS7Name: @"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        [_plusButton setImage:[UIImage imageWithIOS7Name:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [_plusButton setImage:[UIImage imageWithIOS7Name:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
        _plusButton.bounds=CGRectMake(0, 0, _plusButton.currentBackgroundImage.size.width, _plusButton.currentBackgroundImage.size.height);
        
        [self addSubview:_plusButton];
        

    }
    return self;
}


-(void)addTabBarButtonWithItem:(UITabBarItem *)item
{
    
    //1.创建按钮
    ZYCTabBarButton * button =[[ZYCTabBarButton alloc] init];
    [self addSubview:button];
    
    //2.设置数据
    
    button.item=item;
    /*
    [button setTitle:item.title forState:UIControlStateNormal];
    [button setImage:item.image forState:UIControlStateNormal];
    [button setImage:item.selectedImage forState:UIControlStateSelected];
    [button setBackgroundImage:[UIImage imageNamed:@"tabbar_slider"] forState:UIControlStateSelected];
     */
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    
    //添加按钮到数组
    [self.tabBarButtons addObject:button];
    

    if (self.tabBarButtons.count==1) {
        [self buttonClick:button];
    }
    
    
}

-(void)buttonClick:(ZYCTabBarButton*)button
{
    
    //通知代理
    if ([self.deleagate respondsToSelector:@selector(tabBar:didselectButtomFrom:to:)]) {
        [self.deleagate tabBar:self didselectButtomFrom:self.selectedButton.tag to:button.tag];
    }
    
    //
    self.selectedButton.selected=NO;
    button.selected =YES;
    self.selectedButton=button;
    
}



-(void)layoutSubviews
{
    [super layoutSubviews];
    
    //调整加号按钮的位置
    self.plusButton.center=CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    
    
        CGFloat buttonW=SCREEN_WIDTH/self.subviews.count;
        CGFloat buttonY=0;
        CGFloat buttonH=self.frame.size.height;
    for (int index=0; index<self.tabBarButtons.count; index++) {
        //1.取出按钮
        ZYCTabBarButton * button =self.tabBarButtons[index];
        
        //2.设置按钮的frame
        CGFloat buttonX=index * buttonW;
        
        if (index>1) {
            buttonX+=buttonW;
        }
        button.frame=CGRectMake(buttonX, buttonY, buttonW, buttonH);
        button.tag=index;
        
    }
    
    
}
@end
