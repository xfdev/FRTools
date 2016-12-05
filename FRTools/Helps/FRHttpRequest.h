//
//  FRHttpRequest.h
//  FRTools
//
//  Created by sonny on 16/12/5.
//  Copyright © 2016年 github.com/xfdev. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "FRHttpError.h"


@interface FRHttpRequest : NSObject

+ (instancetype)sharedInstance;


/**
 统一 Get 请求
 */
- (void)requestGet:(NSString *)method param:(NSDictionary *)dic success:(void (^)(id responseObj))success failure:(void (^)(FRHttpError *error))fail;

/**
 统一 Post 请求
 */
- (void)requestPost:(NSString *)method param:(NSDictionary *)dic success:(void (^)(id responseObj))success failure:(void (^)(FRHttpError *error))fail;

/**
 统一 Post 上传多张图片
 */
//- (void)request;




@end
