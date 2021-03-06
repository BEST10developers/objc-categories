//
//  UIScrollView+Util.m
//  objc-categories
//
//  Created by Yusuke Murata on 2014/04/26.
//  Copyright (c) 2014 Yusuke Murata (http://www.muratayusuke.com/)
//

#import "UIScrollView+Util.h"
#import "UIView+Util.h"

@implementation UIScrollView (Util)

- (CGFloat)contentWidth {
  return self.contentSize.width;
}

- (void)setContentWidth:(CGFloat)width {
  self.contentSize = CGSizeMake(width, self.height);
}

- (CGFloat)contentHeight {
  return self.contentSize.height;
}

- (void)setContentHeight:(CGFloat)height {
  self.contentSize = CGSizeMake(self.width, height);
}

- (CGFloat)contentOffsetX {
  return self.contentOffset.x;
}

- (void)setContentOffsetX:(CGFloat)x {
  self.contentOffset = CGPointMake(x, self.contentOffset.y);
}

- (CGFloat)contentOffsetY {
  return self.contentOffset.y;
}

- (void)setContentOffsetY:(CGFloat)y {
  self.contentOffset = CGPointMake(self.contentOffset.x, y);
}

- (void)fitContentHeightWithSubViews {
  CGFloat height = 0;
  for (UIView* view in self.subviews) {
    if (height < view.bottom) {
      height = view.bottom;
    }
  }
  self.contentHeight = height;
}

- (void)fitContentHeightWithSubViewsWithPadding:(CGFloat)padding {
  [self fitContentHeightWithSubViews];
  self.contentHeight += padding;
}

@end
