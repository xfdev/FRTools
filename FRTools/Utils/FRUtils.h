//
//  FRUtils.h
//  FRTools
//
//  Created by sonny on 16/12/5.
//  Copyright © 2016年 github.com/xfdev. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@interface FRUtils : NSObject

// 根据16进制字符串获取颜色值，能调节透明度
+ (UIColor *)colorWithHex:(NSString *)hexValue alpha:(CGFloat)alphaValue;
+ (UIColor *)colorWithHex:(NSString *)hexValue;

// 截取字符串
+ (NSString *)substringFromIndex:(NSUInteger)from withString:(NSString *)string;
+ (NSString *)substringToIndex:(NSUInteger)to withString:(NSString *)string;
+ (NSString *)substringWithRange:(NSRange)range withString:(NSString *)string;


+ (NSString *)jsonStringWithjsonObject:(id)jsonObject;


@end
