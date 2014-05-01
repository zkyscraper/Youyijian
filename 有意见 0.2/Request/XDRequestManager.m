//
//  XDRequestManager.m
//  leCar
//
//  Created by xieyajie on 13-12-30.
//  Copyright (c) 2013年 XDIOS. All rights reserved.
//

#import "XDRequestManager.h"

#define KTIMEOUT 30

static NSString *const BASEURL = @"http://douban.fm/j/mine/playlist?type=n&h=&channel=0&from=mainsite&r=4941e23d79/";

static XDRequestManager *defaultManagerInstance;

@implementation XDRequestManager

- (id)initWithBaseURL:(NSURL *)url
{
    self = [super initWithBaseURL:url];
    if (self) {
        _appApiPath = kAppName;
    }
    
    return self;
}

+ (instancetype)defaultManager
{
    static dispatch_once_t pred;
    dispatch_once(&pred, ^{
        defaultManagerInstance = [[XDRequestManager alloc] initWithBaseURL:[NSURL URLWithString:kHost]];
    });
    return defaultManagerInstance;
}

#pragma mark - 信息处理

/*获取请求错误信息描述*/
- (NSString *)requestErrorDescription:(NSError *)error
{
    NSLog(@"请求失败: %@", error.localizedDescription);
    
//    switch (error.code) {
//        case AF:
//            return @"连接失败，请稍后再试";
//            break;
//            
//        case ASIRequestTimedOutErrorType:
//            return @"请求超时，请稍后再试";
//            break;
//            
//        case ASIAuthenticationErrorType:
//            return @"授权失败";
//            break;
//            
//        case ASIRequestCancelledErrorType:
//            return @"请求已取消";
//            break;
//            
//        case ASIUnableToCreateRequestErrorType:
//            return @"无法创建请求";
//            break;
//            
//        case ASIInternalErrorWhileBuildingRequestType:
//            return @"创建请求错误";
//            break;
//            
//        case ASIInternalErrorWhileApplyingCredentialsType:
//            return @"申请证书错误";
//            break;
//            
//        case ASIFileManagementError:
//            return @"文件管理错误";
//            break;
//            
//        case ASITooMuchRedirectionErrorType:
//            return @"重定向过多错误";
//            break;
//            
//        case ASIUnhandledExceptionError:
//            return @"未知错误";
//            break;
//            
//        case ASICompressionError:
//            return @"文件管理错误";
//            break;
//            
//        default:
//            return @"请求失败，请稍后再试";
//            break;
//    }
    
    return @"";
}

- (void)sendRequest:(NSMutableURLRequest *)request
            success:(void (^)(AFHTTPRequestOperation *operation, id JSONValue))success
            failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    request.timeoutInterval = KTIMEOUT;
    AFHTTPRequestOperation *operation = [self HTTPRequestOperationWithRequest:request success:^(AFHTTPRequestOperation *operation, id responseObject){
        NSError *error;
        id jsonObject = [NSJSONSerialization
                         JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments
                         error:&error];
        if (jsonObject != nil && error == nil){
            success(operation, jsonObject);
        }
        else{
            success(operation, responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error){
        failure(operation, error);
    }];
    [self enqueueHTTPRequestOperation:operation];
}

#pragma mark - 上拉、下拉申请数据

/**
 *  执行下拉刷新请求
 *
 *  @param path       链接字符串
 *  @param userInfo   参数
 *  @param success    申请成功时，回调方法
 *  @param failure    申请失败时，回调方法
 */
- (void)startTableHeaderRequestWithPath:(NSString *)path
                               userInfo:(NSDictionary *)userInfo
                                success:(void (^)(AFHTTPRequestOperation *operation, id JSONValue))success
                                failure:(void (^)(AFHTTPRequestOperation *operation, NSString *errorStr))failure
{
    path = [path stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    path = [path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSURL *url = [NSURL URLWithString:path];
    if (!url || !url.scheme.length) {
        NSString *tmpPath = [NSString stringWithString:path];
        path = [NSString stringWithFormat:@"%@/%@/%@", kHost, self.appApiPath, tmpPath];
    }
    
    NSMutableURLRequest *request = [self requestWithMethod:@"GET" path:path parameters:userInfo];
    
    [self sendRequest:request success:success failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(operation, [self requestErrorDescription:error]);
    }];
}

/**
 *  执行上拉刷新请求
 *
 *  @param path       链接字符串
 *  @param userInfo   参数
 *  @param success    申请成功时，回调方法
 *  @param failure    申请失败时，回调方法
 */
- (void)startTableFooterRequestWithPath:(NSString *)path
                               userInfo:(NSDictionary *)userInfo
                                success:(void (^)(AFHTTPRequestOperation *operation, id JSONValue))success
                                failure:(void (^)(AFHTTPRequestOperation *operation, NSString *errorStr))failure
{
    path = [path stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    path = [path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSURL *url = [NSURL URLWithString:path];
    if (!url || !url.scheme.length) {
        NSString *tmpPath = [NSString stringWithString:path];
        path = [NSString stringWithFormat:@"%@/%@/%@", kHost, self.appApiPath, tmpPath];
    }
    
    NSMutableURLRequest *request = [self requestWithMethod:@"GET" path:path parameters:userInfo];
    
    [self sendRequest:request success:success failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(operation, [self requestErrorDescription:error]);
    }];
}

/**
 *  自定义申请方式
 */
- (void)requestWithMode:(NSString *)mode
               path:(NSString *)path
         parameters:(NSDictionary *)parameters
            success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
            failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    return [self requestWithMode:mode path:path parameters:parameters bodys:nil success:success failure:failure];
}

- (void)requestWithMode:(NSString *)mode
                   path:(NSString *)path
             parameters:(NSDictionary *)parameters
                  bodys:(NSDictionary *)bodys
                success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    if (mode == nil || mode.length == 0) {
        mode = @"GET";
    }
    else{
        mode = [mode uppercaseString];
    }
    
    path = [path stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    path = [path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSURL *url = [NSURL URLWithString:path];
    if (!url || !url.scheme.length) {
        NSString *tmpPath = [NSString stringWithString:path];
        path = [NSString stringWithFormat:@"%@/%@/%@", kHost, self.appApiPath, tmpPath];
    }
    
	NSMutableURLRequest *request = [self requestWithMethod:mode path:path parameters:parameters];
    request.timeoutInterval = KTIMEOUT;
    
    if (bodys && [bodys count] > 0) {
        NSData *bodyData = [NSJSONSerialization dataWithJSONObject:bodys options:NSJSONReadingAllowFragments error:nil];
        [request setHTTPBody:bodyData];
    }
    
    [self sendRequest:request success:success failure:failure];
}

/**
 *  GET申请
 *
 *  @param path       链接字符串
 *  @param parameters 参数
 *  @param success    申请成功时，回调方法
 *  @param failure    申请失败时，回调方法
 */
- (void)getPath:(NSString *)path
     parameters:(NSDictionary *)parameters
        success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
        failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    path = [path stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    path = [path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSURL *url = [NSURL URLWithString:path];
    if (!url || !url.scheme.length) {
        NSString *tmpPath = [NSString stringWithString:path];
        path = [NSString stringWithFormat:@"%@/%@/%@", kHost, self.appApiPath, tmpPath];
    }
    
	NSMutableURLRequest *request = [self requestWithMethod:@"GET" path:path parameters:parameters];
    
    [self sendRequest:request success:success failure:failure];
}

/**
 *  POST申请
 *
 *  @param path       链接字符串
 *  @param parameters 参数
 *  @param success    申请成功时，回调方法
 *  @param failure    申请失败时，回调方法
 */
- (void)postPath:(NSString *)path
      parameters:(NSDictionary *)parameters
         success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
         failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    path = [path stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    path = [path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSURL *url = [NSURL URLWithString:path];
    if (!url || !url.scheme.length) {
        NSString *tmpPath = [NSString stringWithString:path];
        path = [NSString stringWithFormat:@"%@/%@/%@", kHost, self.appApiPath, tmpPath];
    }
    
    NSMutableURLRequest *request = [self requestWithMethod:@"POST" path:path parameters:parameters];
    
	[self sendRequest:request success:success failure:failure];
}

#pragma mark - 专用接口

@end
