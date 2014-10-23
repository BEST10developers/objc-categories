//
//  UILabel+Util.h
//  objc-categories
//
//  Created by Yusuke Murata on 2014/03/23.
//  Copyright (c) 2014 Yusuke Murata (http://www.muratayusuke.com/)
//

#import <UIKit/UIKit.h>

@interface UILabel (Util)

- (id)initWithText:(NSString *)text font:(UIFont *)font maxWidth:(CGFloat)maxWidth;
- (void)addUnderLine;
- (void)setKern:(CGFloat)kern;
- (void)addAttributes:(NSDictionary *)attributes;
- (void)searchAndMakeBoldString:(NSString *)string;
- (void)searchAndMakeBoldStringWithArray:(NSArray *)strings;

@end
