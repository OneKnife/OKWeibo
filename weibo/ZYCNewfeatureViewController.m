//
//  ZYCNewfeatureViewController.m
//  weibo
//
//  Created by qianfeng on 15-4-19.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import "ZYCNewfeatureViewController.h"
#import "ZYCTabBarViewController.h"
#import "ZYCOAuthViewController.h"

@interface ZYCNewfeatureViewController ()

@end

@implementation ZYCNewfeatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createScrollView];
    
}

-(void)createScrollView
{
    
    UIScrollView * scrollView =[[UIScrollView alloc] initWithFrame:self.view.bounds];
    
    
    for (NSInteger i=0; i<3;i++) {
        NSString * imageName =[NSString stringWithFormat:@"new_feature_%ld",i+1];
        UIImage * image = [UIImage imageNamed:imageName];
        
        UIImageView * imageView =[[UIImageView alloc] initWithFrame:CGRectMake(i*self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height)];
        
        imageView.image=image;
        if (i==2) {
            
            UIButton * checkBox =[[UIButton alloc] init];
            [checkBox setImage:[UIImage imageNamed:@"new_feature_share_false"] forState:UIControlStateNormal];
            [checkBox setImage:[UIImage imageNamed:@"new_feature_share_true"] forState:UIControlStateSelected];
            checkBox.selected=YES;
            checkBox.frame=CGRectMake(0.5*self.view.frame.size.width-80, self.view.frame.size.height/2-20, 160, 40);
            [checkBox addTarget:self action:@selector(checkBoxClick:) forControlEvents:UIControlEventTouchUpInside];
            [checkBox setTitle:@"分享给大家" forState:UIControlStateNormal];
            [checkBox setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            
            [imageView addSubview:checkBox];
            
            
            UIButton * startButton =[[UIButton alloc] initWithFrame:CGRectMake(0.5* self.view.frame.size.width-80, self.view.frame.size.height/2+50, 160, 40)];
            [startButton setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button"] forState:UIControlStateNormal];
            [startButton setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button_highlighted"] forState:UIControlStateHighlighted];
            [startButton addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
            [startButton setTitle:@"开始微博" forState:UIControlStateNormal];
            
            imageView.userInteractionEnabled=YES;
            [imageView addSubview:startButton];
        }
        
        [scrollView addSubview:imageView];
        
    }
    
       scrollView.pagingEnabled=YES;
    scrollView.bounces=NO;
    scrollView.contentSize=CGSizeMake(3*self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:scrollView];
    
    
}



-(void)start
{
    [UIApplication sharedApplication].statusBarHidden=NO;
//    self.view.window.rootViewController = [[ZYCTabBarViewController alloc] init];
    self.view.window.rootViewController=[[ZYCOAuthViewController alloc] init];
}

-(void)checkBoxClick:(UIButton *)checkBox
{
    checkBox.selected=!checkBox.isSelected;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc
{
    
}


@end
