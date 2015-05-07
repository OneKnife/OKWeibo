//
//  ZYCHomeTableViewController.m
//  weibo
//
//  Created by qianfeng on 15-4-12.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import "ZYCHomeTableViewController.h"
#import "UIBarButtonItem+ZYC.h"
#import "AFNetworking.h"
#import "ZYCAccountTool.h"
#import "ZYCOAuthModel.h"

@interface ZYCHomeTableViewController ()

@end

@implementation ZYCHomeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self customNavigationBar];
    
    [self setupStatusData];

}

-(void)customNavigationBar
{
    
    //左边按钮

    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithIcon:@"navigationbar_friendsearch" highLightIcon:@"navigationbar_friendsearch_highlighted" target:self action:@selector(findFriend)];
    //右边按钮

    self.navigationItem.rightBarButtonItem=[UIBarButtonItem itemWithIcon:@"navigationbar_pop" highLightIcon:@"navigationbar_pop_highlighted" target:self action:@selector(pop)];
    
    
    UIButton * titleButton =[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    
    titleButton.adjustsImageWhenHighlighted=NO;
    [titleButton setImage:[UIImage imageWithIOS7Name:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
//    [titleButton setBackgroundImage:[UIImage imageWithIOS7Name:@"navigationbar_back_highlighted"] forState:UIControlStateHighlighted];
    
    [titleButton setBackgroundImage:[[UIImage imageWithIOS7Name:@"navigationbar_filter_background_highlighted"] stretchableImageWithLeftCapWidth:5 topCapHeight:5]forState:UIControlStateHighlighted];
    
    [titleButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [titleButton setTitle:@"嘿嘿" forState:UIControlStateNormal];
    
    
    titleButton.imageEdgeInsets=UIEdgeInsetsMake(0, 50, 0, -50);
    titleButton.titleEdgeInsets=UIEdgeInsetsMake(0, -10, 0, 10);
    self.navigationItem.titleView=titleButton;
    
    [titleButton addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)titleClick:(UIButton *)button
{
    static BOOL isDown;
    if ((isDown=!isDown)) {
            [button setImage:[UIImage imageWithIOS7Name:@"navigationbar_arrow_up"] forState:UIControlStateNormal];
    }
    else
    {
            [button setImage:[UIImage imageWithIOS7Name:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
    }
}


-(void)setupStatusData
{
    AFHTTPSessionManager * manager =[AFHTTPSessionManager manager];
    
    
    NSDictionary * parm =@{@"access_token":[ZYCAccountTool account].access_token};
    
    [manager GET:@"https://api.weibo.com/2/statuses/home_timeline.json" parameters:parm success:^(NSURLSessionDataTask *task, id responseObject) {
        ZYCLog(@"%@",responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        ZYCLog(@"home err!");
    }];
}




-(void)findFriend
{
    ZYCLog(@"findFriend");
}

-(void)pop
{
    ZYCLog(@"pop");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ID"];
    
    if (!cell) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ID"];
    }
    return cell;
}





@end
