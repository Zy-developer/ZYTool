//
//  ZYDeviceIPAdresses.h
//
//  Created by ZY on 16/7/8.
//  Copyright © 2016年 ZY. All rights reserved.
//
//  

#import <Foundation/Foundation.h>

/** 设备IP地址. */
@interface ZYDeviceIPAdresses : NSObject

/**
 * 获取内网IP地址.
 *  @return IP地址.
 */
+ (NSString *)getIntranetIPAddresses;

/**
 * 获取公网IP地址数据.
 *  @param completedBlock 完成回调.
 * 注: 由于用到HTTP请求，需要在Info.plist里面开启允许HTTP协议请求.
 *      NSAppTransportSecurity  NSDictionary
 *          NSAllowsArbitraryLoads Boolean  YES
 */
+ (void)getPublicIPInfoData:(void(^)(NSDictionary *ipInfo))completedBlock;

@end
