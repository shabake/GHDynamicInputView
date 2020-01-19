//
//  NSString+GHome.h
//  DynamicInputView
//
//  Created by mac on 2020/1/18.
//  Copyright © 2020 GHome. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (GHome)

+ (CGSize)sizeWithText:(NSString *)text andFont:(UIFont *)font andMaxSize:(CGSize)maxSize;

@end

NS_ASSUME_NONNULL_END
