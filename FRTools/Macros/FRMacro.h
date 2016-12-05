//
//  FRMacro.h
//  FRTools
//
//  Created by sonny on 16/12/5.
//  Copyright © 2016年 github.com/xfdev. All rights reserved.
//

#ifndef FRMacro_h
#define FRMacro_h


















#ifndef __OPTIMIZE__
#define NSLog(xx, ...)      NSLog(@"打印日志: %s(%d): " xx, __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define NSLog(xx, ...)      ((void)0)
#endif

#endif /* FRMacro_h */
