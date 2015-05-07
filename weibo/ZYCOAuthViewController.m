//
//  ZYCOAuthViewController.m
//  weibo
//
//  Created by qianfeng on 15-4-20.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import "ZYCOAuthViewController.h"
#import "AFNetworking.h"
#import "ZYCOAuthModel.h"
#import "ZYCAccountTool.h"
#import "ZYCWeiboTools.h"
#import "MBProgressHUD.h"

@interface ZYCOAuthViewController ()<UIWebViewDelegate,MBProgressHUDDelegate>

@end

@implementation ZYCOAuthViewController
{
    MBProgressHUD * _HUD;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self createWebView];
}


-(void)createWebView
{
    UIWebView * webView =[[UIWebView alloc]initWithFrame:self.view.frame];
    
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://api.weibo.com/oauth2/authorize?client_id=1497966800&response_type=code&redirect_uri=http://www.baidu.com"]]];
    
    webView.delegate=self;
    
    [self.view addSubview:webView];
    
    
}

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSString * strUrl =request.URL.absoluteString;
    
    NSRange rang = [strUrl rangeOfString:@"code="];
    if (rang.length) {
        NSString * code =[strUrl substringFromIndex:rang.length+rang.location];
        NSLog(@"%@",strUrl);
        NSLog(@"%@",code);
        [self accessTokenWithCode:code];
    }
    //注释
    return YES;
}


//
-(void)accessTokenWithCode:(NSString *)code
{
//@"https://api.weibo.com/oauth2/access_token?client_id=YOUR_CLIENT_ID&client_secret=YOUR_CLIENT_SECRET&grant_type=authorization_code&redirect_uri=YOUR_REGISTERED_REDIRECT_URI&code=CODE"
    
    
    AFHTTPSessionManager * manager =[AFHTTPSessionManager manager];
    
    
    NSMutableDictionary * param =[NSMutableDictionary dictionary];
    [param setObject:@"1497966800" forKey:@"client_id"];
    [param setObject:@"dccf639b311338a7e427f699a178b1ef" forKey:@"client_secret"];
    [param setObject:@"authorization_code" forKey:@"grant_type"];
    [param setObject:@"http://www.baidu.com" forKey:@"redirect_uri"];
    [param setObject:code forKey:@"code"];
    manager.responseSerializer.acceptableContentTypes=[NSSet setWithObject:@"text/plain"];
    
    [manager POST:@"https://api.weibo.com/oauth2/access_token" parameters:param success:^(NSURLSessionDataTask *task, id responseObject) {
        
        ZYCOAuthModel * model =[ZYCOAuthModel accountWithDict:responseObject];
//        [model setValuesForKeysWithDictionary:responseObject];
        
        [ZYCAccountTool saveAccount:model];
        
        [ZYCWeiboTools chooseViewController];
        
        
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@",error);
    }];
    
    
}



#pragma mark - webView代理


-(void)webViewDidStartLoad:(UIWebView *)webView
{
    _HUD =[[MBProgressHUD alloc] initWithView:self.view];
    
    [self.view addSubview:_HUD];
    _HUD.labelText=@"loading...";
    _HUD.removeFromSuperViewOnHide=YES;
    [_HUD show:YES];
    
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [_HUD hide:YES];
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [_HUD hide:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)dealloc
{
    
}

@end
