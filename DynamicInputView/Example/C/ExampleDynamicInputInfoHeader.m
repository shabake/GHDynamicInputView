//
//  ExampleDynamicInputInfoHeader.m
//  DynamicInputView
//
//  Created by mac on 2020/1/18.
//  Copyright © 2020 GHome. All rights reserved.
//

#import "ExampleDynamicInputInfoHeader.h"

@interface ExampleDynamicInputInfoHeader()

@property (nonatomic , strong) UILabel *info;
@end

@implementation ExampleDynamicInputInfoHeader

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
        _info.font = [UIFont systemFontOfSize:14];
        _info.textColor = [UIColor lightGrayColor];
    }
    return _info;
}

@end
