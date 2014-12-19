//
//  NSDictionary+Debug.m
//  Best10
//
//  Created by 村田 佑介 on 2014/12/19.
//  Copyright (c) 2014年 Best10, Inc. All rights reserved.
//

#import "NSDictionary+Debug.h"

@implementation NSDictionary (Debug)

- (NSString *)BT_descriptionWithEncoding {
  return [NSString stringWithCString:[self.description cStringUsingEncoding:NSASCIIStringEncoding]
                            encoding:NSNonLossyASCIIStringEncoding];
}

@end
