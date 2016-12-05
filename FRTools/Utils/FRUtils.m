//
//  FRUtils.m
//  FRTools
//
//  Created by sonny on 16/12/5.
//  Copyright © 2016年 github.com/xfdev. All rights reserved.
//

#import "FRUtils.h"

@implementation FRUtils


+ (UIColor *)colorWithHex:(NSString *)hexValue alpha:(CGFloat)alphaValue {
    char *stopstring;
    long hex = strtol([hexValue cStringUsingEncoding:NSUTF8StringEncoding], &stopstring, 16);
    return [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16))/255.0
                           green:((float)((hex & 0xFF00) >> 8))/255.0
                            blue:((float)(hex & 0xFF))/255.0 alpha:alphaValue];
}

+ (UIColor *)colorWithHex:(NSString *)hexValue {
    
    if ([hexValue length] == 6) {
        return [self colorWithHex:hexValue alpha:1.0];
    }
    CGFloat al = [[self substringFromIndex:6 withString:hexValue] integerValue] / 10.f;
    return [self colorWithHex:[self substringToIndex:6 withString:hexValue] alpha:al];
}


//截取字符串
+ (NSString *)substringFromIndex:(NSUInteger)from withString:(NSString *)string {
    if ([string isKindOfClass:[NSString class]] && from < string.length) {
        return [string substringFromIndex:from];
    }
    return @"";
}
+ (NSString *)substringToIndex:(NSUInteger)to withString:(NSString *)string {
    if ([string isKindOfClass:[NSString class]] && to <= string.length) {
        return [string substringToIndex:to];
    }
    return @"";
}
+ (NSString *)substringWithRange:(NSRange)range withString:(NSString *)string {
    if ([string isKindOfClass:[NSString class]] && range.location+range.length <= string.length) {
        return [string substringWithRange:range];
    }
    return @"";
}





+ (NSString *)jsonStringWithjsonObject:(id)jsonObject {
    
    if (!jsonObject) return nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:jsonObject options:NSJSONWritingPrettyPrinted error:NULL];
    
    if (jsonData.length == 0) return nil;
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

@end
