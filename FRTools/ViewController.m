//
//  ViewController.m
//  FRTools
//
//  Created by sonny on 16/12/5.
//  Copyright © 2016年 github.com/xfdev. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    NSLog(@"touchesBegan...");
    
    NSString *URL = @"http://120.26.100.181/app_1_1_5/RequestInterface/send/taskid/UQ003";
    
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"1",@"userid",@"3",@"housingState",@"0",@"page", nil];
    
    [[FRHttpRequest sharedInstance] requestPost:URL param:dic success:^(id responseObj) {
        
        NSLog(@"...");
        
    } failure:^(FRHttpError *error) {
        
        NSLog(@"error = %@",error);
        
    }];
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
