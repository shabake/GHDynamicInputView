//
//  ExampleDynamicFooter.m
//  DynamicInputView
//
//  Created by mac on 2020/1/19.
//  Copyright © 2020 GHome. All rights reserved.
//

#import "ExampleDynamicFooter.h"

@interface ExampleDynamicFooter ()

@property (nonatomic , strong) UIButton *sure;
@end
@implementation ExampleDynamicFooter


- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        [self setupUI];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)setupUI {
    [self addSubview:self.sure];
    [self.sure mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self).offset(10);
        make.right.bottom.equalTo(self).offset(-10);
    }];
}

- (void)clickSure {
    if (self.didClickSureBlock) {
        self.didClickSureBlock();
    }
}

- (UIButton *)sure {
    if (_sure == nil) {
        _sure = [[UIButton alloc]init];
        _sure.backgroundColor = [UIColor blueColor];
        [_sure setTitle:@"确定" forState:UIControlStateNormal];
        [_sure setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _sure.layer.masksToBounds = YES;
        [_sure addTarget:self action:@selector(clickSure) forControlEvents:UIControlEventTouchUpInside];
        _sure.layer.cornerRadius = 10;
    }
    return _sure;
}

@end
