//
//  GHDynamicInputView.h
//  DynamicInputView
//
//  Created by mac on 2020/1/17.
//  Copyright © 2020 GHome. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class GHDynamicInputView;

typedef void (^GHDynamicInputViewGetHeightBlock)(float height ,NSString *text);

@interface GHDynamicInputView : UIView

/**
 *  获取高度回调
 */
@property (nonatomic , copy) GHDynamicInputViewGetHeightBlock getHeightBlock;

/**
 *  字号 默认14
 */
@property (nonatomic , strong) UIFont *font;

/**
 *  inputViewbackgroundColor 默认clearColor
 */
@property (nonatomic , strong) UIColor *inputViewbackgroundColor;

/**
 *  imageName
 */
@property (nonatomic , copy) NSString *imageName;

/**
 *  获取用户输入内容
 */
- (NSString *)getInputText;

/**
 *  获取用户输入内容
 */
@property (nonatomic , copy) NSString *inputText;

@end



NS_ASSUME_NONNULL_END
