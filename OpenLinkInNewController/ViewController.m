//
//  ViewController.m
//  OpenLinkInNewController
//
//  Created by Oleksandr Kulakov on 10/6/14.
//  Copyright (c) 2014 Alex Kulakov. All rights reserved.
//

#import "ViewController.h"
#import "OtherViewController.h"

@interface ViewController () <UIWebViewDelegate>

@property (nonatomic) BOOL isNeedPush;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.frame];
    [webView setDelegate:self];
    
    //Setup your url
    NSString *urlAddress = @"https://www.etsy.com/browse/home-garden/lighting?ref=br_nav_new_2";
    NSURL *url = [NSURL URLWithString:urlAddress];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [webView loadRequest:requestObj];
    [self.view addSubview: webView];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.isNeedPush = YES;
}

-(BOOL)webView:(UIWebView*)webView shouldStartLoadWithRequest:(NSURLRequest*)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSString *urlString = request.URL.absoluteString;
    
    if ([urlString rangeOfString:@"www.etsy.com/listing/"].location != NSNotFound)
    {
        if (self.isNeedPush) {
            OtherViewController *otherVC = [[OtherViewController alloc] initWithRequest:request];
            
            [self.navigationController pushViewController:otherVC animated:YES];
            [webView stopLoading];
            
            self.isNeedPush = NO;
        }
        return NO;
    }
    
    return YES;
    
}

@end
