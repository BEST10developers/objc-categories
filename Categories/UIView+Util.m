//
//  UIView+Util.m
//  objc-categories
//
//  Created by Yusuke Murata on 2014/03/23.
//  Copyright (c) 2014 Yusuke Murata (http://www.muratayusuke.com/)
//

#import "UIView+Util.h"
#import <objc/runtime.h>

NSString* const kOnTouchesBeganKey = @"kOnTouchesBeganKey";
NSString* const kOnTouchesEndedKey = @"kOnTouchesEndedKey";

@implementation UIView (Util)

@dynamic onTouchesBegan;
@dynamic onTouchesEnded;

#pragma mark--- setters & getters

- (CGFloat)centerX {
  return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX {
  CGPoint center = self.center;
  center.x = centerX;
  self.center = center;
}

- (CGFloat)centerY {
  return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY {
  CGPoint center = self.center;
  center.y = centerY;
  self.center = center;
}

- (CGFloat)left {
  return self.frame.origin.x;
}

- (void)setLeft:(CGFloat)left {
  self.centerX = left + self.width / 2;
}

- (CGFloat)right {
  return self.frame.origin.x + self.frame.size.width;
}

- (void)setRight:(CGFloat)right {
  self.centerX = right - self.width / 2;
}

- (CGFloat)top {
  return self.frame.origin.y;
}

- (void)setTop:(CGFloat)top {
  self.centerY = top + self.height / 2;
}

- (CGFloat)bottom {
  return self.frame.origin.y + self.frame.size.height;
}

- (void)setBottom:(CGFloat)bottom {
  self.centerY = bottom - self.height / 2;
}

- (CGFloat)width {
  return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width {
  CGRect frame = self.frame;
  frame.size.width = width;
  self.frame = frame;
}

- (CGFloat)height {
  return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height {
  CGRect frame = self.frame;
  frame.size.height = height;
  self.frame = frame;
}

- (basicBlock)onTouchesBegan {
  return objc_getAssociatedObject(self,
                                  (__bridge const void*)(kOnTouchesBeganKey));
}

- (void)setOnTouchesBegan:(basicBlock)onTouchesBegan {
  objc_setAssociatedObject(self, (__bridge const void*)(kOnTouchesBeganKey),
                           onTouchesBegan, OBJC_ASSOCIATION_COPY);
}

- (basicBlock)onTouchesEnded {
  return objc_getAssociatedObject(self,
                                  (__bridge const void*)(kOnTouchesEndedKey));
}

- (void)setOnTouchesEnded:(basicBlock)onTouchesEnded {
  objc_setAssociatedObject(self, (__bridge const void*)(kOnTouchesEndedKey),
                           onTouchesEnded, OBJC_ASSOCIATION_COPY);
}

#pragma mark--- functions

- (void)BT_expandFrame:(CGFloat)length {
  self.left -= length;
  self.top -= length;
  self.width += length * 2;
  self.height += length * 2;

  for (UIView* view in self.subviews) {
    view.left += length;
    view.top += length;
  }
}

- (void)BT_fitHeightWithSubViews {
  CGFloat height = 0;
  for (UIView* view in self.subviews) {
    if (height < view.bottom) {
      height = view.bottom;
    }
  }
  self.height = height;
}

- (void)BT_fitWidthWithSubViews {
  CGFloat width = 0;
  for (UIView* view in self.subviews) {
    if (width < view.right) {
      width = view.right;
    }
  }
  self.width = width;
}

- (void)BT_fitSizeWithSubViews {
  CGFloat height = 0;
  CGFloat width = 0;
  for (UIView* view in self.subviews) {
    if (height < view.bottom) {
      height = view.bottom;
    }
    if (width < view.right) {
      width = view.right;
    }
  }
  self.height = height;
  self.width = width;
}

- (void)BT_travel:(void (^)(UIView* view, NSUInteger level))block {
  [self BT_travel:block level:0];
}

- (void)BT_travel:(void (^)(UIView* view, NSUInteger level))block
            level:(NSUInteger)level {
  if (block) {
    block(self, level);
  }
  NSUInteger nextLevel = level + 1;
  for (UIView* view in self.subviews) {
    [view BT_travel:block level:nextLevel];
  }
}

- (void)BT_printHierarchy {
  [self BT_travel:^(UIView* view, NSUInteger level) {
      NSMutableString* indent = [NSMutableString string];
      for (NSUInteger i = 0; i < level; i++) {
        [indent appendString:@"  "];
      }
      NSLog(@"%@%@", indent, view);
  }];
}

- (UIView*)BT_findFirstResponder {
  if (self.isFirstResponder) {
    return self;
  }
  for (UIView* view in self.subviews) {
    UIView* v = [view BT_findFirstResponder];
    if (v) {
      return v;
    }
  }
  return nil;
}

- (void)addBorderBottom:(CGFloat)lineWeight color:(UIColor*)color {
  UIView* line = [[UIView alloc] init];
  line.width = self.width;
  line.height = lineWeight;
  line.top = self.height;
  line.backgroundColor = color;
  [self addSubview:line];

  self.height += lineWeight;
}

- (void)logFrame {
  NSLog(@"x: %f, y: %f, width: %f, height: %f", self.frame.origin.x,
        self.frame.origin.y, self.frame.size.width, self.frame.size.height);
}

- (void)removeSubviews {
  for (UIView* view in [self subviews]) {
    [view removeFromSuperview];
  }
}

- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
  [super touchesBegan:touches withEvent:event];
  if (self.onTouchesBegan) {
    self.onTouchesBegan();
  }
}

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
  [super touchesEnded:touches withEvent:event];
  if (self.onTouchesEnded) {
    self.onTouchesEnded();
  }
}

@end
