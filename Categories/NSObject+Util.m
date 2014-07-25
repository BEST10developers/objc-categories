//
//  NSObject+Util.m
//  Best10
//
//  Created by Yusuke Murata on 2014/07/25.
//  Copyright (c) 2014 Yusuke Murata (http://www.muratayusuke.com/)
//

#import "NSObject+Util.h"
#import <objc/runtime.h>

@implementation NSObject (Util)

- (NSArray *)BT_propertyKeys {
  NSString *propertyName;
  unsigned int outCount, i;
  NSMutableArray *propertieNames = @[].mutableCopy;

  objc_property_t *properties = class_copyPropertyList(self.class, &outCount);
  for (i = 0; i < outCount; i++) {
    objc_property_t property = properties[i];
    propertyName = [NSString stringWithUTF8String:property_getName(property)];
    [propertieNames addObject:propertyName];
  }
  return propertieNames;
}

- (NSDictionary *)BT_properties {
  NSString *propertyName;
  unsigned int outCount, i;
  NSMutableDictionary *propertieDictionary = @{}.mutableCopy;

  objc_property_t *properties = class_copyPropertyList(self.class, &outCount);
  for (i = 0; i < outCount; i++) {
    objc_property_t property = properties[i];
    propertyName = [NSString stringWithUTF8String:property_getName(property)];
    id value = [self valueForKey:propertyName];
    if (!value) {
      value = [NSNull null];
    }
    [propertieDictionary setObject:value forKey:propertyName];
  }
  return propertieDictionary;
}

- (BOOL)BT_isKindOfClassInArray:(NSArray *)array {
  for (NSString *className in array) {
    if ([self isKindOfClass:NSClassFromString(className)]) {
      return YES;
    }
  }
  return NO;
}

@end
