//
//  UILabel+Util.m
//  objc-categories
//
//  Created by Yusuke Murata on 2014/03/23.
//  Copyright (c) 2014 Yusuke Murata (http://www.muratayusuke.com/)
//

#import "UILabel+Util.h"
#import "NSDictionary+Merge.h"

@implementation UILabel (Util)

- (id)initWithText:(NSString *)text font:(UIFont *)font maxWidth:(CGFloat)maxWidth {
  self = [super init];
  if (self) {
    self.text = text;
    self.font = font;
    NSDictionary *attributeDic = @{NSFontAttributeName : font};
    CGSize size =
      [text boundingRectWithSize:CGSizeMake(maxWidth, CGFLOAT_MAX)
                         options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingTruncatesLastVisibleLine
                      attributes:attributeDic
                         context:nil].size;
    self.frame = CGRectMake(0, 0, size.width, size.height);
  }
  return self;
}

- (void)addUnderLine {
  [self addAttributes:@{NSUnderlineStyleAttributeName : [NSNumber numberWithInteger:NSUnderlineStyleSingle]}];
}

- (void)setKern:(CGFloat)kern {
  [self addAttributes:@{ NSKernAttributeName : @(kern) }];
}

- (void)addAttributes:(NSDictionary *)attributes {
  if (self.text.length == 0) {
    return;
  }
  NSDictionary *currentAttributes = [self.attributedText attributesAtIndex:0 effectiveRange:nil];
  NSDictionary *newAttributes = [currentAttributes mergeWithDictionary:attributes];
  self.attributedText = [[NSAttributedString alloc] initWithString:self.text attributes:newAttributes];
}

- (void)searchAndMakeBoldString:(NSString *)string {
  NSRegularExpression *regexp = [NSRegularExpression regularExpressionWithPattern:string options:0 error:NULL];
  NSArray *matches = [regexp matchesInString:self.text options:0 range:NSMakeRange(0, self.text.length)];
  if ([matches count] == 0) {
    return;
  }

  NSMutableAttributedString *attributedString = [self.attributedText mutableCopy];
  UIFont *boldFont = [UIFont boldSystemFontOfSize:self.font.pointSize];

  for (NSTextCheckingResult *match in matches) {
    [attributedString addAttribute:NSFontAttributeName value:boldFont range:match.range];
  }

  self.attributedText = attributedString;
}

@end
