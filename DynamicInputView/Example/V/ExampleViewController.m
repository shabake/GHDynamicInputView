//
//  ExampleViewController.m
//  DynamicInputView
//
//  Created by mac on 2020/1/17.
//  Copyright © 2020 GHome. All rights reserved.
//

#import "ExampleViewController.h"
#import "ExampleDynamicInputCell.h"
#import "ExampleDynamicInputInfoView.h"
#import "ExampleDynamicFooter.h"
#import "ExampleDynamicSectionFooter.h"
#import "ExampleDynamicHeader.h"

@interface ExampleViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic , strong) UITableView *tableView;
@property (nonatomic , assign) float height;
@property (nonatomic , strong) ExampleDynamicFooter *footer;
@property (nonatomic , strong) ExampleDynamicHeader *header;

@end

@implementation ExampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"GHDynamicInputView";
    [self setupUI];
}

- (void)setupUI {
    [self.view addSubview:self.tableView];
    self.tableView.tableHeaderView = self.header;
    self.tableView.tableFooterView = self.footer;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 34;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 64.01f;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    ExampleDynamicSectionFooter *view = [[ExampleDynamicSectionFooter alloc]init];
    weakself(self);
    view.didClickSureBlock = ^{
        [weakSelf.view endEditing:YES];
    };
    return view;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        ExampleDynamicInputInfoView *view = [[ExampleDynamicInputInfoView alloc]init];
        view.infoStr = @"动态计算高度";
        return view;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.height > 0 ?self.height:64;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ExampleDynamicInputCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ExampleDynamicInputCellID"];
    weakself(self);
    cell.getHeightBlock = ^(float height, NSString * _Nonnull text) {
        weakSelf.height = height;
        weakSelf.footer.text = text;
        [weakSelf getLastFrameWithString:text];
        [weakSelf.tableView beginUpdates];
        [weakSelf.tableView endUpdates];
    };
    return cell;
}

- (void)getLastFrameWithString:(NSString *)string {
    CGRect frame = self.footer.frame;
    CGSize headerSize = [NSString sizeWithText:string andFont:[UIFont systemFontOfSize:14] andMaxSize:CGSizeMake(kScreenWidth - 20, CGFLOAT_MAX)];
    frame.size.height = headerSize.height + 20;
    [UIView animateWithDuration:0.25 animations:^{
        self.footer.frame = frame;
    }];
}

- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[ExampleDynamicInputCell class] forCellReuseIdentifier:@"ExampleDynamicInputCellID"];
    }
    return _tableView;
}

- (ExampleDynamicHeader *)header {
    if (_header == nil) {
        _header = [[ExampleDynamicHeader alloc]initWithFrame:CGRectMake(0, 0, 0, 90.01)];
    }
    return _header;
}

- (ExampleDynamicFooter *)footer {
    if (_footer == nil) {
        _footer = [[ExampleDynamicFooter alloc]initWithFrame:CGRectMake(0, 0, 0, 60.01)];
    }
    return _footer;
}

@end
