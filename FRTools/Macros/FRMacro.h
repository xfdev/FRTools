//
//  FRMacro.h
//  FRTools
//
//  Created by sonny on 16/12/5.
//  Copyright © 2016年 github.com/xfdev. All rights reserved.
//

#ifndef FRMacro_h
#define FRMacro_h


#define weakSelf(wSelf)  __weak __typeof(&*self)wSelf = self;
#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height

// 6位或8位，后两位为透明度（00-10，可不传）
#ifndef FRColorHex
#define FRColorHex(hex)     [FRUtils colorWithHex:hex]
#endif

// 文字类颜色 FRColor
#define FRColor333          FRColorHex(@"333333")       // 项目中黑色
#define FRColor666          FRColorHex(@"666666")       // 项目中中黑色
#define FRColor999          FRColorHex(@"999999")       // 项目中灰色








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
