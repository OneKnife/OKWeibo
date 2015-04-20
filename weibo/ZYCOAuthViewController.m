//
//  ZYCOAuthViewController.m
//  weibo
//
//  Created by qianfeng on 15-4-20.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import "ZYCOAuthViewController.h"

@interface ZYCOAuthViewController ()<UIWebViewDelegate>

@end

@implementation ZYCOAuthViewController

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
    
    return YES;
}


//
-(void)accessTokenWithCode:(NSString *)code
{
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
