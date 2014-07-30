//
//  UIButton+Util.m
//  Best10
//
//  Created by Yusuke Murata on 2014/07/30.
//  Copyright (c) 2014 Yusuke Murata (http://www.muratayusuke.com/)
//

#import "UIButton+Util.h"

@implementation UIButton (Util)

- (void)setBackgroundColor:(UIColor *)color forState:(UIControlState)state {
  CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
  UIGraphicsBeginImageContext(rect.size);
  CGContextRef context = UIGraphicsGetCurrentContext();

  CGContextSetFillColorWithColor(context, [color CGColor]);
  CGContextFillRect(context, rect);

  UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  [self setBackgroundImage:image forState:state];
}

@end
