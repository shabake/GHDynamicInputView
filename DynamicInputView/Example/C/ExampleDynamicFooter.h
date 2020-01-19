//
//  ExampleDynamicFooter.h
//  DynamicInputView
//
//  Created by mac on 2020/1/19.
//  Copyright © 2020 GHome. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^ExampleDynamicFooterDidClickSureBlock)(void);

@interface ExampleDynamicFooter : UIView

@property (nonatomic , copy) ExampleDynamicFooterDidClickSureBlock didClickSureBlock;

@end

NS_ASSUME_NONNULL_END
