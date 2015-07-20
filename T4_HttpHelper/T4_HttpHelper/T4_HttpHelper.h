//
//  HttpHelper.h
//  HttpHelper
//
//  Created by 胡 帅 on 15/7/15.
//  Copyright (c) 2015年 none. All rights reserved.
//

#import <Foundation/Foundation.h>

extern const int T4_HTTP_NETCOULDNOTACCESS_ERRORCODE;
extern NSString *const T4_HTTP_NETCOULDNOTACCESS_MESSAGE;
extern NSString *const T4_HTTP_ACCESS_STATUS_CHANGE_NOTIFICATION;
/*
 * Http Method
 *
 */
typedef NS_ENUM(NSUInteger, T4HTTPMethod)
{
    Get,
    Post,
    Put,
    Delete
};
/**
 *  T4HttpHelper header file
 */
@interface T4HttpHelper : NSObject
/**
 *  simple way to connect HTTP API
 *
 *  @param apiPath      eg. @"http://test.com/testAPI"
 *  @param paraDic      eg. @{@"user": @"Mitty"}
 *  @param method       eg. Get
 *  @param successBlock success handle  eg. ^(NSDictionary *responseDic) { NSLog(@"%@",responseDic);}
 *  @param errorBlock   error handle    eg. ^(NSError *error) { NSLog(@"%@",error.description); }];}
 */
+ (void)connectAPIPath:(NSString *)apiPath submitParam:(NSDictionary *)paraDic httpMethod:(T4HTTPMethod)method
          successBlock:( void (^)(NSDictionary *responseDic)) successBlock errorBlock:( void (^)(NSError *error)) errorBlock;

@end
