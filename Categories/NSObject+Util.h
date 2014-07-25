//
//  NSObject+Util.h
//  Best10
//
//  Created by Yusuke Murata on 2014/07/25.
//  Copyright (c) 2014 Yusuke Murata (http://www.muratayusuke.com/)
//

#import <Foundation/Foundation.h>

@interface NSObject (Util)

- (NSArray *)BT_propertyKeys;
- (NSDictionary *)BT_properties;

/*!
 @method

 @abstract
 Test if passed array of NSString includes current class name.

 @param array        array of class names (each object must be NSString*)
 */
- (BOOL)BT_isKindOfClassInArray:(NSArray *)array;

@end
