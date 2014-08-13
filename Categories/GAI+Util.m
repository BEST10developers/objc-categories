//
//  GAI+Util.m
//  Best10
//
//  Created by Yusuke Murata on 2014/08/13.
//  Copyright (c) 2014 Yusuke Murata (http://www.muratayusuke.com/)
//

#import "GAI+Util.h"
#import "GAIDictionaryBuilder.h"

@implementation GAI (Util)

+ (void)sendEvent:(NSString *)category
           action:(NSString *)action
            label:(NSString *)label
            value:(NSNumber *)value {
  id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
  [tracker send:[[GAIDictionaryBuilder createEventWithCategory:category
                                                        action:action
                                                         label:label
                                                         value:value] build]];
}

@end
