//
//  ZYDeviceIPAdresses.m
//
//  Created by ZY on 16/7/8.
//  Copyright © 2016年 ZY. All rights reserved.
//

#import "ZYDeviceIPAdresses.h"

#import <ifaddrs.h>
#import <arpa/inet.h>

@implementation ZYDeviceIPAdresses

#pragma mark - 获取IP
+ (NSString *)getIpAddresses {
    NSString *address = @"an error occurred when obtaining ip address！Can not use the simulator to obtain";
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    int success = 0;
    
    success = getifaddrs(&interfaces);
    
    // 0 表示获取成功
    if (success == 0) {
        temp_addr = interfaces;
        while (temp_addr != NULL) {
            if( temp_addr->ifa_addr->sa_family == AF_INET) {
                // Check if interface is en0 which is the wifi connection on the iPhone
                if ([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"]) {
                    // Get NSString from C String
                    address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in  *)temp_addr->ifa_addr)->sin_addr)];
                }
            }
            temp_addr = temp_addr->ifa_next;
        }
    }
    freeifaddrs(interfaces);
    
    return address;
}

@end
