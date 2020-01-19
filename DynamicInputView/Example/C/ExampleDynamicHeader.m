//
//  ExampleDynamicHeader.m
//  DynamicInputView
//
//  Created by mac on 2020/1/19.
//  Copyright © 2020 GHome. All rights reserved.
//

#import "ExampleDynamicHeader.h"

@interface ExampleDynamicHeader()

@property (nonatomic , strong) UILabel *info;

@end
@implementation ExampleDynamicHeader

- (void)setText:(NSString *)text {
    self.info.text = text;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        [self setupUI];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)setupUI {
    [self addSubview:self.info];
    [self.info mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.right.equalTo(self).offset(-10);
        make.top.equalTo(self).offset(10);
    }];
}

- (UILabel *)info {
    if (_info == nil) {
        _info = [[UILabel alloc]init];
        _info.numberOfLines = 0;
        _info.text = @"开发环境: Xcode 11.3\n系统: iOS13\n语言: Object-C\n需求: 实现点击删除输入内容，动态高度。";
        _info.font = [UIFont systemFontOfSize:14];
    }
    return _info;
}

@end
