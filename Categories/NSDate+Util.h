//
//  NSDate+Util.h
//  Best10
//
//  Created by Yusuke Murata on 2014/06/26.
//  Copyright (c) 2014 Yusuke Murata (http://www.muratayusuke.com/)
//

#import <Foundation/Foundation.h>

@interface NSDate (Util)

+ (NSDate *)dateWithFormat:(NSString *)format andString:(NSString *)dateString;

@end
