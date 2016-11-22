//
//  ViewController.m
//  TestButton
//
//  Created by apple on 16/1/3.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ViewController.h"
#import "CustomButton.h"
@interface ViewController () <CustomButtonDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CGFloat screenWidth   = [UIScreen mainScreen].bounds.size.width;
    
    UIColor      *rColor   = [UIColor colorWithRed:255/255.0 green:236/255.0 blue:139/255.0 alpha:1.0];
    UIColor      *yColor   = [UIColor colorWithRed:241/255.0 green:208/255.0 blue:176/255.0 alpha:1.0];
    UIColor      *bColor   = [UIColor colorWithRed:177/255.0 green:205/255.0 blue:164/255.0 alpha:1.0];
    UIColor      *gColor   = [UIColor colorWithRed:164/255.0 green:205/255.0 blue:201/255.0 alpha:1.0];
    
    
    CustomButton *firstLine   = [[CustomButton alloc] initCustomButton:@[@{@"color":rColor, @"title":@"魔法少女"}] farme:CGRectMake(0, 200, screenWidth, 30)];
    
    CustomButton *secondLine = [[CustomButton alloc] initCustomButton:@[@{@"color":yColor, @"title":@"校园生活"},@{@"color":bColor, @"title":@"开学"},@{@"color":rColor, @"title":@"南小鸟"}] farme:CGRectMake(0, 240, screenWidth, 30)];
    
    CustomButton *thirdLine = [[CustomButton alloc] initCustomButton:@[@{@"color":gColor, @"title":@"千本樱"},@{@"color":yColor, @"title":@"翻唱"},@{@"color":gColor, @"title":@"穿越"},@{@"color":yColor, @"title":@"kk之羁绊"}] farme:CGRectMake(0, 280, screenWidth, 30)];
    
    CustomButton *fourLine = [[CustomButton alloc] initCustomButton:@[@{@"color":bColor, @"title":@"未闻花名"},@{@"color":rColor, @"title":@"初音"}] farme:CGRectMake(0, 320, screenWidth, 30)];
    
    CustomButton *fiveLine = [[CustomButton alloc] initCustomButton:@[@{@"color":yColor, @"title":@"花千骨"}] farme:CGRectMake(0, 360, screenWidth, 30)];
    
    firstLine.delegate  = self;
    secondLine.delegate = self;
    thirdLine.delegate  = self;
    fourLine.delegate   = self;
    fiveLine.delegate   = self;
    
    [self.view addSubview:firstLine];
    [self.view addSubview:secondLine];
    [self.view addSubview:thirdLine];
    [self.view addSubview:fourLine];
    [self.view addSubview:fiveLine];
    
}

#pragma mark - custom button delegate
- (void)clickButton:(NSString *)title
{
    NSLog(@"the title which clcick button is %@", title);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
