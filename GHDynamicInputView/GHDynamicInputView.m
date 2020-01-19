//
//  GHDynamicInputView.m
//  DynamicInputView
//
//  Created by mac on 2020/1/17.
//  Copyright © 2020 GHome. All rights reserved.
//

#import "GHDynamicInputView.h"

@interface GHDynamicInputView()<UITextViewDelegate>

/**
 *
 */
@property (nonatomic , strong) UITextView *textView;

/**
 *  删除
 */
@property (nonatomic , strong) UIButton *delete;

@property (nonatomic , assign) BOOL isEditing;

/**
 *  占位
 */
@property (nonatomic , strong) UITextView *placeholder;
@end

@implementation GHDynamicInputView

#pragma mark - set
- (void)setFont:(UIFont *)font {
    self.textView.font = font;
}

- (void)setInputViewbackgroundColor:(UIColor *)inputViewbackgroundColor {
    self.textView.backgroundColor = inputViewbackgroundColor;
}

- (void)setImageName:(NSString *)imageName {
    [self.delete setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
}

- (void)setIsEditing:(BOOL)isEditing {
    _isEditing = isEditing;
    self.delete.hidden = !isEditing;
}

#pragma mark - 初始化
- (instancetype)init {
    if (self == [super init]) {
        [self configuration];
        [self setupUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        [self configuration];
        [self setupUI];
    }
    return self;
}

- (void)configuration {
    self.isEditing = NO;
    self.font = [UIFont systemFontOfSize:14];
}

- (void)setupUI {
    [self addSubview:self.textView];
    [self addSubview:self.delete];
}

#pragma mark - layoutSubviews
- (void)layoutSubviews {
    CGFloat width = self.bounds.size.width;
    self.textView.frame = CGRectMake(0, 0,
                                     self.isEditing ? width - 15 - 10:
                                     width,
                                     self.bounds.size.height);
    self.delete.frame = CGRectMake(width - 15 - 10, CGRectGetMaxY(self.textView.frame) - 15 - 10, 15, 15);
}

#pragma mark - UITextViewDelegate
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView {

    CGRect frame = textView.frame;
    CGFloat width = self.bounds.size.width;
    self.isEditing = YES;
    self.delete.hidden = NO;
    float height = [self _heightForTextView:textView text:textView.text width:0];
    frame.size.height = height;
    frame.size.width =  width - 15 - 10;
    [UIView animateWithDuration:0.25 animations:^{
        textView.frame = frame;
    }];
    if (self.getHeightBlock) {
        self.getHeightBlock(height, self.textView.text);
    }
    return YES;
}

- (BOOL)textViewShouldEndEditing:(UITextView *)textView{
    CGRect frame = textView.frame;
    self.isEditing = NO;
    self.delete.hidden = YES;
    float height = [self _heightForTextView:textView text:textView.text width:0];
    frame.size.height = height;
    frame.size.width = self.bounds.size.width - 10;
    [UIView animateWithDuration:0.25 animations:^{
        textView.frame = frame;
    }];
    if (self.getHeightBlock) {
        self.getHeightBlock(height, self.textView.text);
    }
    return YES;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    CGRect frame = textView.frame;
    float height;
    if ([text isEqual:@""]) {
        if (![textView.text isEqualToString:@""]) {
            height = [self _heightForTextView:textView text:[textView.text substringToIndex:[textView.text length] - 1] width:0];
        } else{
            height = [self _heightForTextView:textView text:textView.text width:0];
        }
    } else{
        height = [self _heightForTextView:textView text:[NSString stringWithFormat:@"%@%@",textView.text,text] width:0];
    }
    frame.size.height = height;
    [UIView animateWithDuration:0.25 animations:^{
        textView.frame = frame;
    }];
    if (self.getHeightBlock) {
        self.getHeightBlock(height, self.textView.text);
    }
    return YES;
}

- (void)clickDelete {
    self.textView.text = nil;
    self.isEditing = NO;
    [self.textView endEditing:YES];
    CGRect frame = self.textView.frame;
    float height = [self _heightForTextView:self.textView text:self.textView.text width: 25];
    self.textView.frame = frame;
    if (self.getHeightBlock) {
        self.getHeightBlock(height, self.textView.text);
    }
}

- (float)_heightForTextView:(UITextView *)textView text:(NSString *)text width:(float)width {
    CGSize constraint = CGSizeMake(textView.contentSize.width , CGFLOAT_MAX);
    CGRect size = [text boundingRectWithSize:constraint                                        options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading)
                                  attributes:@{NSFontAttributeName:self.textView.font}
                                     context:nil];
    float textHeight = size.size.height + 22.0;
    return textHeight;
}

- (NSString *)getInputText {
    return self.textView.text;
}

- (NSString *)inputText {
    return self.textView.text;
}

#pragma mark - lazy

- (UITextView *)placeholder {
    if (_placeholder == nil) {
        _placeholder = [[UITextView alloc]init];
        _placeholder.backgroundColor = [UIColor redColor];
        _placeholder.delegate = self;
        _placeholder.font = self.font;
        _placeholder.showsVerticalScrollIndicator = NO;
        _placeholder.textContainerInset = UIEdgeInsetsMake(10,0, 0, 0);
        _placeholder.text = @"请输入";
        _placeholder.textColor = [UIColor lightGrayColor];
    }
    return _placeholder;
}

- (UITextView *)textView {
    if (_textView == nil) {
        _textView = [[UITextView alloc]init];
        _textView.backgroundColor = [UIColor clearColor];
        _textView.delegate = self;
        _textView.font = self.font;
        _textView.showsVerticalScrollIndicator = NO;
        _textView.textContainerInset = UIEdgeInsetsMake(10,0, 0, 0);
        _textView.text = @"";
        _textView.textColor = [UIColor lightGrayColor];
    }
    return _textView;
}

- (UIButton *)delete {
    if (_delete == nil) {
        _delete = [[UIButton alloc]init];
        [_delete addTarget:self action:@selector(clickDelete) forControlEvents:UIControlEventTouchUpInside];
        _delete.hidden = YES;
    }
    return _delete;
}

@end
