//
//  BaseNetManager.m
//  testPhoto
//
//  Created by 游文琴 on 2017/8/7.
//  Copyright © 2017年 TuoRong. All rights reserved.
//

#import "BaseNetManager.h"
#import "AFNetworking.h"


@implementation BaseNetManager

static AFHTTPSessionManager *manager = nil;

+ (AFHTTPSessionManager *)sharedAFManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [AFHTTPSessionManager manager];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:
                                                             @"text/html",
                                                             @"application/json",
                                                             @"text/json",
                                                             @"text/javascript",
                                                             @"text/plain", nil];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        manager.requestSerializer.timeoutInterval = 30;
    });
    return manager;
}

+ (void)GET:(NSString *)path parameters:(NSDictionary *)params success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure
{
    [[self sharedAFManager] GET:path
                     parameters:params
                       progress:^(NSProgress * _Nonnull downloadProgress)
    {
        
    }
                        success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
    {
        success(responseObject);
    }
                        failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
    {
        failure(error);
    }];
    
    
}

+ (void)POST:(NSString *)path parameters:(NSDictionary *)params success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure
{
    [[self sharedAFManager] POST:path parameters:params progress:^(NSProgress * _Nonnull uploadProgress)
    {
        
    }
                         success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
    {
        success(responseObject);
    }
                         failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
    {
        failure(error);
    }];
}



@end
