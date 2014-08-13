//
//  GAI+Util.h
//  Best10
//
//  Created by Yusuke Murata on 2014/08/13.
//  Copyright (c) 2014 Yusuke Murata (http://www.muratayusuke.com/)
//

#import "GAI.h"

@interface GAI (Util)

+ (void)sendEvent:(NSString*)category
           action:(NSString*)action
            label:(NSString*)label
            value:(NSNumber*)value;

@end
