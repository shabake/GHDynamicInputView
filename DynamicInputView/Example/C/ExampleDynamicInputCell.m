//
//  ExampleDynamicInputCell.m
//  DynamicInputView
//
//  Created by mac on 2020/1/17.
//  Copyright © 2020 GHome. All rights reserved.
//

#import "ExampleDynamicInputCell.h"
#import "GHDynamicInputView.h"

@interface ExampleDynamicInputCell()

@property (nonatomic , strong) GHDynamicInputView *dynamicInputView;
@property (nonatomic , assign) float height;

@end

@implementation ExampleDynamicInputCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
        self.backgroundColor = [UIColor whiteColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)setupUI {
    [self.contentView addSubview:self.dynamicInputView];
    [self.dynamicInputView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.contentView).offset(10);
        make.right.bottom.equalTo(self.contentView).offset(-10);
    }];
    
    weakself(self);
    self.dynamicInputView.getHeightBlock = ^(float height, NSString * _Nonnull text) {
        if (weakSelf.getHeightBlock) {
            weakSelf.getHeightBlock(height + 20,text);
        }
    };
}

- (GHDynamicInputView *)dynamicInputView {
    if (_dynamicInputView == nil) {
        _dynamicInputView = [[GHDynamicInputView alloc]init];
        _dynamicInputView.layer.borderColor = [UIColor lightGrayColor].CGColor;
        _dynamicInputView.layer.borderWidth = 1;
        _dynamicInputView.layer.masksToBounds = YES;
        _dynamicInputView.layer.cornerRadius = 5;
        _dynamicInputView.imageName = @"delete";
    }
    return _dynamicInputView;
}

@end
