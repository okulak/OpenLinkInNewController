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

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.frame];
    [webView setDelegate:self];
    
    //Setup your url
    NSString *urlAddress = @"http://www.google.com/";
    NSURL *url = [NSURL URLWithString:urlAddress];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [webView loadRequest:requestObj];
    [self.view addSubview: webView];
}

-(BOOL)webView:(UIWebView*)webView shouldStartLoadWithRequest:(NSURLRequest*)request navigationType:(UIWebViewNavigationType)navigationType {
    
    NSURL *url = request.URL;
    NSString *urlString = url.absoluteString;
    
    //Check if special link
    if ( [ urlString isEqualToString: @"<--Specila link-->" ] ) {
        OtherViewController *otherVC = [[OtherViewController alloc] init];
        [otherVC.webView loadRequest:request];
        
        [self.navigationController pushViewController:otherVC animated:YES];
        
        return NO;
    }
    
    return YES;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
