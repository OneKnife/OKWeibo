//
//  ZYCTabBarViewController.m
//  weibo
//
//  Created by qianfeng on 15-4-12.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import "ZYCTabBarViewController.h"
#import "ZYCDiscoverTableViewController.h"
#import "ZYCHomeTableViewController.h"
#import "ZYCMeTableViewController.h"
#import "ZYCMessageTableViewController.h"
#import "ZYCTabBarView.h"


@interface ZYCTabBarViewController ()<ZYCTabBarDelegate>

@property (nonatomic,strong) ZYCTabBarView *customTabBar;
@end

@implementation ZYCTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
      //初始化tabBar
    [self setupTabBar];
    
    [self setupllAllChildControllers];
    
 
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    for (UIView * child in self.tabBar.subviews) {
        if([child isKindOfClass:[UIControl class]])
        {
            [child removeFromSuperview];
        }
    }
    
    
}

-(void)setupTabBar
{
    
    _customTabBar=[[ZYCTabBarView alloc] init];
    
//    _customTabBar.backgroundColor =[UIColor redColor];
    _customTabBar.frame=self.tabBar.bounds;
    //注意是bounds，bounds是以tabBar来计算0,0点坐标
    
    _customTabBar.deleagate=self;
    [self.tabBar addSubview:_customTabBar];
    
}
-(void)setupllAllChildControllers{
    //初始化所有子控制器
    
    //1.首页
    
    ZYCHomeTableViewController * home =[[ZYCHomeTableViewController alloc] init];
    home.tabBarItem.badgeValue=@"10";
    [self setupChildViewController:home title:@"首页" imageName:@"tabbar_home" selectedImageName:@"tabbar_home_selected"];
    
    
    
    //2.消息
    ZYCMessageTableViewController * message =[[ZYCMessageTableViewController alloc] init];
    [self setupChildViewController:message title:@"消息" imageName:@"tabbar_message_center" selectedImageName:@"tabbar_message_center_selected"];
    
    //3.广场
    ZYCDiscoverTableViewController * discover =[[ZYCDiscoverTableViewController alloc] init];
    [self setupChildViewController:discover title:@"广场" imageName:@"tabbar_discover" selectedImageName:@"tabbar_discover_selected"];
    
    
    //我
    ZYCMeTableViewController * me =[[ZYCMeTableViewController alloc] init];
    
    
    [self setupChildViewController:me title:@"我" imageName:@"tabbar_profile" selectedImageName:@"tabbar_profile_selected"];
    
    
}

/**初始化一个子控制器*/
-(void)setupChildViewController:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
   
    
    childVc.title=title;
    //    home.tabBarItem.title=@"首页";
    //    home.navigationItem.title=@"首页";
    childVc.tabBarItem.image=[UIImage imageWithIOS7Name:imageName];
    childVc.tabBarItem.selectedImage=[[UIImage imageWithIOS7Name:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    UINavigationController * nav=[[UINavigationController alloc]initWithRootViewController:childVc];
    [self addChildViewController:nav];
    
    
 
    [_customTabBar addTabBarButtonWithItem:childVc.tabBarItem];
    
    
}

-(void)tabBar:(ZYCTabBarView *)tabBar didselectButtomFrom:(NSInteger)from to:(int)to
{
    self.selectedIndex=to;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    

    
}

@end
