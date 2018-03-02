//
//  UserDefaultsTool.h
//
//  Created by ZY on 16/7/1.
//  Copyright © 2016年 ZY. All rights reserved.
//
//  UserDefaults

#import <UIKit/UIKit.h>

/**
 * 本地数据存储.
 */
@interface UserDefaultsTool : NSObject

/**
 * 设置(保存)对象类型的值.
 *  @param value 要保存的值
 *  @param defaultName 要保存值的Key
 */
+ (void)setObject:(id)value forKey:(NSString *)defaultName;

/**
 * 设置(保存)布尔类型的值.
 *  @param value 要保存的值
 *  @param defaultName 要保存值的Key
 */
+ (void)setBool:(BOOL)value forKey:(NSString *)defaultName;

/**
 * 设置(保存)浮点类型的值.
 *  @param value 要保存的值
 *  @param defaultName 要保存值的Key
 */
+ (void)setFloat:(CGFloat)value forKey:(NSString *)defaultName;

/**
 * 设置(保存)整数类型的值.
 *  @param value 要保存的值
 *  @param defaultName 要保存值的Key
 */
+ (void)setInteger:(NSInteger)value forKey:(NSString *)defaultName;

/**
 * 获取对象类型的值.
 *  @param defaultName 要获取值的Key
 *  @return 获取到的值
 */
+ (id)objectForKey:(NSString *)defaultName;

/**
 * 获取数组类型的值.
 *  @param defaultName 要获取值的Key
 *  @return 获取到的值
 */
+ (NSArray *)arrayForKey:(NSString *)defaultName;

/**
 * 获取字典类型的值.
 *  @param defaultName 要获取值的Key
 *  @return 获取到的值
 */
+ (NSDictionary *)dictionaryForKey:(NSString *)defaultName;

/**
 * 获取字符串类型的值.
 *  @param defaultName 要获取值的Key
 *  @return 获取到的值
 */
+ (NSString *)stringForKey:(NSString *)defaultName;

/**
 * 获取布尔类型的值.
 *  @param defaultName 要获取值的Key
 *  @return 获取到的值
 */
+ (BOOL)boolForKey:(NSString *)defaultName;

/**
 * 获取浮点类型的值.
 *  @param defaultName 要获取值的Key
 *  @return 获取到的值
 */
+ (CGFloat)floatForKey:(NSString *)defaultName;

/**
 * 获取整数类型的值.
 *  @param defaultName 要获取值的Key
 *  @return 获取到的值
 */
+ (NSInteger)integerForKey:(NSString *)defaultName;

/**
 * 删除.
 *  @param defaultName 要删除的Key
 */
+ (void)removeObjectForKey:(NSString *)defaultName;

@end
