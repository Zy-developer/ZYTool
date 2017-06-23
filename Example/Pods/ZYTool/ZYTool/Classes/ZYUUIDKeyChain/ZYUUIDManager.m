//
//  ZYUUIDManager.m
//
//  Created by ZY on 16/7/7.
//  Copyright © 2016年 ZY. All rights reserved.
//

#import "ZYUUIDManager.h"
#import "ZYKeyChainManager.h"

static NSString * const ZY_UUID_KEY = @"com.zyuuid.uuid";

@implementation ZYUUIDManager

#pragma mark - 保存UUID(新增/修改)
+ (void)saveUUID:(NSString *)uuid {
    if (uuid && uuid.length > 0) {
        [ZYKeyChainManager saveService:ZY_UUID_KEY data:uuid];
    }
}

#pragma mark - 读取UUID
+ (NSString *)getUUID {
    //先获取keychain里面的UUID字段，看是否存在
    NSString *uuid = (NSString *)[ZYKeyChainManager loadService:ZY_UUID_KEY];
    
    //如果不存在则为首次获取UUID，所以获取保存。
    if (!uuid || uuid.length == 0) {
        CFUUIDRef puuid = CFUUIDCreate( nil );
        CFStringRef uuidString = CFUUIDCreateString( nil, puuid );
        uuid = [NSString stringWithFormat:@"%@", uuidString];
        
        [self saveUUID:uuid];
        
        CFRelease(puuid);
        CFRelease(uuidString);
    }
    
    return uuid;
}

#pragma mark - 删除UUID
+ (void)deleteUUID {
    [ZYKeyChainManager deleteService:ZY_UUID_KEY];
}

#pragma mark - 读取GUID
+ (NSString *)getGUID {
    CFUUIDRef uuid_ref = CFUUIDCreate(NULL);
    CFStringRef uuid_string_ref= CFUUIDCreateString(NULL, uuid_ref);
    CFRelease(uuid_ref);
    NSString *uuid = [NSString stringWithString:(__bridge NSString*)uuid_string_ref];
    CFRelease(uuid_string_ref);
    return uuid;
}


@end
