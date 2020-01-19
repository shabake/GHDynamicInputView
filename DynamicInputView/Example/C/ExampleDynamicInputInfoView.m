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
@property (nonatomic , strong) UIView *line;

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
    
    [self addSubview:self.line];
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.height.equalTo(self).multipliedBy(0.5);
        make.centerY.equalTo(self);
        make.width.equalTo(@5);
    }];
    
    [self addSubview:self.info];
    [self.info mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.line.mas_right).offset(10);
        make.right.equalTo(self).offset(-10);
        make.centerY.equalTo(self.line);
    }];
}

- (UIView *)line {
    if (_line == nil) {
        _line = [[UIView alloc]init];
        _line.backgroundColor = KMainColor;
    }
    return _line;
}

- (UILabel *)info {
    if (_info == nil) {
        _info = [[UILabel alloc]init];
        _info.numberOfLines = 0;
    }
    return _info;
}

@end
