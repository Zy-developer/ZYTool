//
//  ZYUUIDManager.h
//
//  Created by ZY on 16/7/7.
//  Copyright © 2016年 ZY. All rights reserved.
//
//  UUIDManager

#import <Foundation/Foundation.h>

/**
 * 设备的唯一标识(UUID/GUID).
 */
@interface ZYUUIDManager : NSObject

/**
 * 保存UUID.
 *  @param uuid 要保存的UUID
 */
+ (void)saveUUID:(NSString *)uuid;

/**
 * 读取UUID.
 *  @return 读取到的UUID
 */
+ (NSString *)getUUID;

/**
 * 删除UUID.
 */
+ (void)deleteUUID;

/**
 * 读取GUID.
 */
+ (NSString *)getGUID;

@end
