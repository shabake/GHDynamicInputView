//
//  ViewController.m
//  DynamicInputView
//
//  Created by mac on 2020/1/17.
//  Copyright © 2020 GHome. All rights reserved.
//

#import "ViewController.h"
#import "GHDynamicInputView.h"
#import "ExampleViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic , strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    GHDynamicInputView *dynamicInputView = [[GHDynamicInputView alloc]initWithFrame:CGRectMake(100, 100, [UIScreen mainScreen].bounds.size.width - 200, 38)];
//    dynamicInputView.getHeightBlock = ^(float height, GHDynamicInputView * _Nonnull dynamicInputView) {
//        CGRect frame = dynamicInputView.frame;
//        frame.size.height = height;
//        dynamicInputView.frame = frame;
//    };
//    [self.view addSubview:dynamicInputView];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    ExampleViewController *vc = [[ExampleViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
