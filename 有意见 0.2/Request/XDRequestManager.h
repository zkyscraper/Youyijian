//
//  XDRequestManager.h
//  leCar
//
//  Created by xieyajie on 13-12-30.
//  Copyright (c) 2013年 XDIOS. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AFNetworking.h"

#define kHost @"http://demomonkeys.org"
#define kAppName @"youyijian"


@interface XDRequestManager : AFHTTPClient

@property (strong, nonatomic, readonly) NSString *appApiPath;

+ (instancetype)defaultManager;

/*执行下拉刷新请求*/
- (void)startTableHeaderRequestWithPath:(NSString *)path
                               userInfo:(NSDictionary *)userInfo
                                success:(void (^)(AFHTTPRequestOperation *operation, id JSONValue))success
                                failure:(void (^)(AFHTTPRequestOperation *operation, NSString *errorStr))failure;

/*执行上拉刷新请求*/
- (void)startTableFooterRequestWithPath:(NSString *)path
                               userInfo:(NSDictionary *)userInfo
                                success:(void (^)(AFHTTPRequestOperation *operation, id JSONValue))success
                                failure:(void (^)(AFHTTPRequestOperation *operation, NSString *errorStr))failure;

/**
 *  自定义申请方式
 */
- (void)sendRequest:(NSMutableURLRequest *)request
            success:(void (^)(AFHTTPRequestOperation *operation, id JSONValue))success
            failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

- (void)requestWithMode:(NSString *)mode
               path:(NSString *)path
         parameters:(NSDictionary *)parameters
            success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
            failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

- (void)requestWithMode:(NSString *)mode
                   path:(NSString *)path
             parameters:(NSDictionary *)parameters
                  bodys:(NSDictionary *)bodys
                success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

/**
 *  GET申请
 */
- (void)getPath:(NSString *)path
     parameters:(NSDictionary *)parameters
        success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
        failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

/**
 *  POST申请
 */
- (void)postPath:(NSString *)path
      parameters:(NSDictionary *)parameters
         success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
         failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

#pragma mark - 专用接口

@end
