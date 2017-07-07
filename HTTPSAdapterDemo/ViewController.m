//
//  ViewController.m
//  HTTPSAdapterDemo
//
//  Created by Lannister on 16/12/1.
//  Copyright © 2016年 郑超. All rights reserved.
//

#import "ViewController.h"
#import "NetworkManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    [btn setTitle:@"AFNetworking" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor blackColor];
    [btn addTarget:self action:@selector(btnClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}

- (void)btnClicked {
#warning 在此填写你的HTTPS网址
    
    NSString *urlString = @"https://10.71.66.2:8100/test";
#warning ====
    if ([urlString isEqualToString:@""]) {
        NSLog(@" ===== the URL is nil =====");
    }
    NetworkManager *httpManager = [NetworkManager shareHttpManager];
    [httpManager post:urlString withParameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@" ===== success ===== %@",responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@" ===== failure ===== %@",error);
    }];
}


@end
