//
//  FRHttpError.h
//  FRTools
//
//  Created by sonny on 16/12/5.
//  Copyright © 2016年 github.com/xfdev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FRHttpError : NSObject

@property (nonatomic, copy) NSString *message;  // 错误信息.
@property (nonatomic, copy) NSString *code;     // 错误代码.

@property (nonatomic, copy) NSString *other;    // 其他.


@end
