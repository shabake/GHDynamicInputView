//
//  NSString+GHome.m
//  DynamicInputView
//
//  Created by mac on 2020/1/18.
//  Copyright © 2020 GHome. All rights reserved.
//

#import "NSString+GHome.h"

@implementation NSString (GHome)

+ (CGSize)sizeWithText:(NSString *)text andFont:(UIFont *)font andMaxSize:(CGSize)maxSize {
    CGSize expectedLabelSize = CGSizeZero;
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    [paragraphStyle setLineSpacing:0];
    NSDictionary *attributes = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle.copy};
    
    expectedLabelSize = [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attributes context:nil].size;
    
    return CGSizeMake(ceil(expectedLabelSize.width), ceil(expectedLabelSize.height));
}

@end
