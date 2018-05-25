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
 *  注意：UUID只在同一个AppleID账号下共享，如果切换账号则无法获取会重新生成.
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
