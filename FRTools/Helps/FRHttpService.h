//
//  FRHttpService.h
//  FRTools
//
//  Created by sonny on 16/12/5.
//  Copyright © 2016年 github.com/xfdev. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FRHttpError;

@interface FRHttpService : NSObject {
    
    NSString *_baseURL;
    NSMutableDictionary *_params;
}



+ (instancetype)sharedInstance;


/**
 对内 Get 请求
 */
- (void)get:(NSString *)method param:(NSDictionary *)dic success:(void (^)(id responseObj))success failure:(void (^)(FRHttpError *error))fail;

/**
 对内 Post 请求
 */
- (void)post:(NSString *)method param:(NSDictionary *)dic success:(void (^)(id responseObj))success failure:(void (^)(FRHttpError *error))fail;


/**
 对内 Post 上传多张图片
 */
//- (void)request;

@end
