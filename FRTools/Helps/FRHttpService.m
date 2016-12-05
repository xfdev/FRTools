//
//  FRHttpService.m
//  FRTools
//
//  Created by sonny on 16/12/5.
//  Copyright © 2016年 github.com/xfdev. All rights reserved.
//

#import "FRHttpService.h"


#import "FRRequestInterface.h"
#import <AFNetworking.h>
#import "FRHttpError.h"

@implementation FRHttpService

static FRHttpService *service = nil;

+ (instancetype)sharedInstance {
    
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        service = [[self alloc] init];
    });
    return service;
}
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        service = [super allocWithZone:zone];
    });
    return service;
}

- (instancetype)copyWithZone:(struct _NSZone *)zone {
    return service;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self defaultParams];
    }
    return self;
}


- (void)defaultParams {
    
    _baseURL = [NSString stringWithFormat:@"%@%@/",FR_SERVER_BASE_PATH,FR_SERVER_PATH_APP_API];
    _params = [[NSMutableDictionary alloc] init];
    
    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    
    [_params setValue:@"1" forKey:@"userid"];
    [_params setValue:version forKey:@"version"];
}

- (void)get:(NSString *)method param:(NSDictionary *)dic success:(void (^)(id))success failure:(void (^)(FRHttpError *))fail {
    
    NSLog(@"内部 Get 请求...");
}

- (void)post:(NSString *)method param:(NSDictionary *)dic success:(void (^)(id))success failure:(void (^)(FRHttpError *))fail {
    
    
    // 处理接口相关
//    NSString *URL = [NSString stringWithFormat:@"%@%@",_baseURL,method];
    NSString *URL = method;
    
    // 对参数进行处理
    NSMutableDictionary *tmpDic = [NSMutableDictionary dictionaryWithDictionary:_params];
    if (dic) {
        [tmpDic addEntriesFromDictionary:dic];
    }
    
    NSLog(@"\n请求数据：method = %@,\njsonDic = %@,\nURL = %@\n\n",method,tmpDic,URL);
    
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy defaultPolicy];
    securityPolicy.allowInvalidCertificates = YES;  // 是否允许无效证书（也就是自建的证书），默认为NO
    securityPolicy.validatesDomainName = NO;        // 是否需要验证域名，默认为YES；
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.securityPolicy  = securityPolicy;
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", nil];
    
    [manager POST:URL parameters:tmpDic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"responseObject = %@",responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSDictionary *errorInfo = error.userInfo;
//        NSLog(@"\nerror.userInfo = %@\n\n",errorInfo);
        
        // NSUnderlyingErrorKey 相关信息，要比errorInfo更加详细
        NSError *underError = errorInfo[NSUnderlyingErrorKey];
//        NSLog(@"\nunderError = %@\n\n",underError);
        NSLog(@"\nunderError.localizedDescription = %@\n\n",underError.localizedDescription);
        
        NSDictionary *underInfo = underError.userInfo;
//        NSLog(@"\nunderInfo = %@\n\n",underInfo);
        
        NSString *underResponseError = underInfo[AFNetworkingOperationFailingURLResponseErrorKey];
        NSLog(@"\nunderResponseError = %@\n\n",underResponseError);
        
        NSData *underResponseData = underInfo[AFNetworkingOperationFailingURLResponseDataErrorKey];
        NSLog(@"\nunderResponseData = %@\n\n",[[NSString alloc] initWithData:underResponseData encoding:NSUTF8StringEncoding]);
        
        FRHttpError *err = [[FRHttpError alloc] init];
        err.code = [NSString stringWithFormat:@"%ld",error.code];
        err.message = error.localizedDescription;
        fail(err);
        
        // errorInfo有些错误信息不能打印或者不全面
//        NSLog(@"\nerror.localizedDescription = %@\n\n",error.localizedDescription);
//        NSString *responseError = errorInfo[AFNetworkingOperationFailingURLResponseErrorKey];
//        NSLog(@"\nresponseError = %@\n\n",responseError);
//        NSData *responseData = errorInfo[AFNetworkingOperationFailingURLResponseDataErrorKey];
//        NSLog(@"\nresponseData = %@\n\n",[[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding]);
    }];
}

@end
