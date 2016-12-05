//
//  FRMacro.h
//  FRTools
//
//  Created by sonny on 16/12/5.
//  Copyright © 2016年 github.com/xfdev. All rights reserved.
//

#ifndef FRMacro_h
#define FRMacro_h













#define YYModelSynthCoderAndHash \
- (void)encodeWithCoder:(NSCoder *)aCoder { [self yy_modelEncodeWithCoder:aCoder]; } \
- (id)initWithCoder:(NSCoder *)aDecoder { return [self yy_modelInitWithCoder:aDecoder]; } \
- (id)copyWithZone:(NSZone *)zone { return [self yy_modelCopy]; } \
- (NSUInteger)hash { return [self yy_modelHash]; } \
- (BOOL)isEqual:(id)object { return [self yy_modelIsEqual:object]; } \
- (NSString *)description { return [self yy_modelDescription]; }




#ifndef __OPTIMIZE__
#define NSLog(xx, ...)      NSLog(@"打印日志: %s(%d): " xx, __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define NSLog(xx, ...)      ((void)0)
#endif

#endif /* FRMacro_h */
