//
//  UIView+Util.h
//  objc-categories
//
//  Created by Yusuke Murata on 2014/03/23.
//  Copyright (c) 2014 Yusuke Murata (http://www.muratayusuke.com/)
//

#import <UIKit/UIKit.h>

typedef void (^basicBlock)(void);

@interface UIView (Util)

@property(nonatomic) CGFloat centerX;
@property(nonatomic) CGFloat centerY;
@property(nonatomic) CGFloat left;
@property(nonatomic) CGFloat right;
@property(nonatomic) CGFloat top;
@property(nonatomic) CGFloat bottom;
@property(nonatomic) CGFloat width;
@property(nonatomic) CGFloat height;
@property(nonatomic) basicBlock onTouchesBegan;
@property(nonatomic) basicBlock onTouchesEnded;

- (void)BT_expandFrame:(CGFloat)length;
- (void)BT_fitHeightWithSubViews;
- (void)BT_fitWidthWithSubViews;
- (void)BT_fitSizeWithSubViews;
- (void)addBorderBottom:(CGFloat)lineWeight color:(UIColor*)color;
- (void)logFrame;
- (void)removeSubviews;
- (void)BT_printHierarchy;
- (void)BT_travel:(void (^)(UIView *view, NSUInteger level))block;

@end
