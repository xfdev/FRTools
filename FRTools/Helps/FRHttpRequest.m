//
//  FRHttpRequest.m
//  FRTools
//
//  Created by sonny on 16/12/5.
//  Copyright © 2016年 github.com/xfdev. All rights reserved.
//

#import "FRHttpRequest.h"

#import "FRHttpService.h"

@implementation FRHttpRequest


static FRHttpRequest *instance = nil;

+ (instancetype)sharedInstance {
    
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        instance = [[self alloc] init];
    });
    return instance;
}
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        instance = [super allocWithZone:zone];
    });
    return instance;
}

- (instancetype)copyWithZone:(struct _NSZone *)zone {
    return instance;
}

- (void)requestGet:(NSString *)method param:(NSDictionary *)dic success:(void (^)(id))success failure:(void (^)(FRHttpError *))fail {
    
    [[FRHttpService sharedInstance] get:method param:dic success:^(id responseObj) {
        
        success(responseObj);
        
    } failure:^(FRHttpError *error) {
        
        fail(error);
        
    }];
    
}

- (void)requestPost:(NSString *)method param:(NSDictionary *)dic success:(void (^)(id))success failure:(void (^)(FRHttpError *))fail {
    
    [[FRHttpService sharedInstance] post:method param:dic success:^(id responseObj) {
        
        success(responseObj);
        
    } failure:^(FRHttpError *error) {
        
        fail(error);
        
    }];
    
    
}

















@end
