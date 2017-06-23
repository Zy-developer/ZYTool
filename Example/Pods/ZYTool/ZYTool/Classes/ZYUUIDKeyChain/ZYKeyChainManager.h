//
//  ZYKeyChainManager.h
//
//  Created by ZY on 16/7/7.
//  Copyright © 2016年 ZY. All rights reserved.
//
//  KeyChainManager

#import <Foundation/Foundation.h>

@interface ZYKeyChainManager : NSObject

// Get
+ (NSMutableDictionary *)getKeychainQuery:(NSString *)service;
// Save
+ (void)saveService:(NSString *)service data:(id)data;
// Load
+ (id)loadService:(NSString *)service;
// Delete
+ (void)deleteService:(NSString *)service;

@end
