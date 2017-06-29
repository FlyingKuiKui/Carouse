//
//  ViewController.m
//  Carouse
//
//  Created by 王盛魁 on 16/5/9.
//  Copyright © 2016年 wangsk. All rights reserved.
//

#import "ViewController.h"

#import "WSKCarouselView.h"
#import "NSString+StringCategory.h"

@interface ViewController ()<WSKCarouselViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    WSKCarouselView *CarouselView = [WSKCarouselView carouselViewWithFrame:CGRectMake(10, 100, 300, 400) RollDirection:RollDirection_Vertical];
    CarouselView.dataArray = @[@"c1",@"c2",@"c3",@"c4",@"c5"];
    CarouselView.time = 2;
    CarouselView.delegate = self;
    [self.view addSubview:CarouselView];
    
    NSString *string = @"这是一这是个测试这是测试";
    for (NSString *temp in [string subStringFromString:@"这是" ToString:@"测试"]) {
        NSLog(@"%@",temp);
    }
}



- (void)clickViewWithCurrentIndex:(NSInteger)currentIndex{
    NSLog(@"%ld",(long)currentIndex);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
