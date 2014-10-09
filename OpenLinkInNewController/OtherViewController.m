//
//  OtherViewController.m
//  OpenLinkInNewController
//
//  Created by Oleksandr Kulakov on 10/6/14.
//  Copyright (c) 2014 Alex Kulakov. All rights reserved.
//

#import "OtherViewController.h"

@interface OtherViewController ()

@end

@implementation OtherViewController

-(id)initWithRequest:(NSURLRequest*)request
{
    self = [super init];
    if (self) {
        UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.frame];
        [webView setDelegate:self];
        
        [self.view addSubview: webView];
        [webView loadRequest:request];
    }
    return self;
}

@end
