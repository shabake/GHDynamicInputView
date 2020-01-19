//
//  ExampleDynamicInputInfoView.m
//  DynamicInputView
//
//  Created by mac on 2020/1/18.
//  Copyright © 2020 GHome. All rights reserved.
//

#import "ExampleDynamicInputInfoView.h"

@interface ExampleDynamicInputInfoView()

@property (nonatomic , strong) UILabel *info;

@end

@implementation ExampleDynamicInputInfoView

- (void)setInfoStr:(NSString *)infoStr {
    self.info.text = infoStr;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        [self setupUI];
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
    }
    return _info;
}

@end
