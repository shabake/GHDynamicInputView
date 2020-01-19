//
//  ExampleDynamicInputCell.h
//  DynamicInputView
//
//  Created by mac on 2020/1/17.
//  Copyright © 2020 GHome. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^ExampleDynamicInputCellGetHeightBlock)(float height , NSString *text);

@interface ExampleDynamicInputCell : UITableViewCell

/**
 *  获取并返回cell的高度
 */
@property (nonatomic , copy) ExampleDynamicInputCellGetHeightBlock getHeightBlock;
 
@end

NS_ASSUME_NONNULL_END
