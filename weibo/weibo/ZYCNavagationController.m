//
//  ZYCNavagationController.m
//  weibo
//
//  Created by qianfeng on 15-4-13.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import "ZYCNavagationController.h"

@interface ZYCNavagationController ()

@end

@implementation ZYCNavagationController


/**一个类第一次使用的时候调用（只会调用一次）*/
+(void)initialize
{
    //设置导航栏主题
    [self setupNavBarTheme];
    
    //设置按钮主题
    [self setupBarButtonItemTheme];
    
}

//设置导航栏按钮主题
+(void)setupBarButtonItemTheme
{
    UIBarButtonItem * item =[UIBarButtonItem appearance];
    
    [item setBackgroundImage:[UIImage imageWithIOS7Name:@"navigationbar_button_background"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [item setBackgroundImage:[UIImage imageWithIOS7Name:@"navigationbar_button_background_pushed"] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
    
    //设置文字属性
    
    [item setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12] } forState:UIControlStateNormal];

}

//设置导航栏主题
+(void)setupNavBarTheme
{
    
    //取出appearance 设置默认样式
    UINavigationBar * navBar =[UINavigationBar appearance];
    
    //设置背景
    if (!iOS7) {
        [navBar setBackgroundImage:[UIImage imageWithIOS7Name:@"navigationbar_background"] forBarMetrics:UIBarMetricsDefault];
        [UIApplication sharedApplication].statusBarStyle=UIStatusBarStyleDefault;
    }
    
}





- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count>0) {
        viewController.hidesBottomBarWhenPushed=YES;
    }
    [super pushViewController:viewController animated:animated];

}

@end
