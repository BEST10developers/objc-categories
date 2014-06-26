//
//  NSDate+Util.m
//  Best10
//
//  Created by Yusuke Murata on 2014/06/26.
//  Copyright (c) 2014 Yusuke Murata (http://www.muratayusuke.com/)
//

#import "NSDate+Util.h"

@implementation NSDate (Util)

+ (NSDate *)dateWithFormat:(NSString *)format andString:(NSString *)dateString {
  NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
  dateFormatter.dateFormat = format;
  NSDate *date = [dateFormatter dateFromString:dateString];
  return date;
}

@end
