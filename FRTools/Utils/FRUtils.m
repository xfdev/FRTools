//
//  FRUtils.m
//  FRTools
//
//  Created by sonny on 16/12/5.
//  Copyright © 2016年 github.com/xfdev. All rights reserved.
//

#import "FRUtils.h"

@implementation FRUtils











+ (NSString *)jsonStringWithjsonObject:(id)jsonObject {
    
    if (!jsonObject) return nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:jsonObject options:NSJSONWritingPrettyPrinted error:NULL];
    
    if (jsonData.length == 0) return nil;
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

@end
