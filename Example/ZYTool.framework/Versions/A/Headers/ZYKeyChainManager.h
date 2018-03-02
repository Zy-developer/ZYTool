//
//  ZYKeyChainManager.h
//
//  Created by ZY on 16/7/7.
//  Copyright © 2016年 ZY. All rights reserved.
//
//  KeyChainManager

#import <Foundation/Foundation.h>

/**
 * 钥匙串管理.
 */
@interface ZYKeyChainManager : NSObject

/**
 * 读取钥匙串.
 *  @param service service
 *  @return Data
 */
+ (NSMutableDictionary *)getKeychainQuery:(NSString *)service;
    
/**
 * 保存钥匙串.
 *  @param service service
 *  @param data data
 */
+ (void)saveService:(NSString *)service data:(id)data;

/**
 * 保存钥匙串.
 *  @param service service
 *  @return data
 */
+ (id)loadService:(NSString *)service;

/**
 * 删除钥匙串.
 *  @param service service
 */
+ (void)deleteService:(NSString *)service;

@end
