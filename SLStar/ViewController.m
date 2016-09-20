//
//  ViewController.m
//  SLStar
//
//  Created by shuanglong on 16/9/20.
//  Copyright © 2016年 shuanglong. All rights reserved.
//

#import "ViewController.h"
#import "SLStarRatingView.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.9];

    
    SLStarRatingView * s = [[SLStarRatingView alloc]initWithFrame:CGRectMake(0, 100, 468*0.7, 94*0.7)];

    
    s.progressBlock = ^(CGFloat progress){
    
        NSLog(@"progress = %f",progress);
    };
    
    
    [self.view addSubview:s];
}


@end
