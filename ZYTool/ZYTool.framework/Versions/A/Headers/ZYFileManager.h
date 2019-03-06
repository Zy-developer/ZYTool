//
//  ZYFileManager.h
//
//  Created by ZY on 16/8/3.
//  Copyright © 2016年 ZY. All rights reserved.
//
//  FileManager

#import <Foundation/Foundation.h>

/** 文件管理. */
@interface ZYFileManager : NSObject

/**
 * 获取沙盒Document文件夹目录:
 *  最常用的目录，iTunes同步该应用时会同步此文件夹中的内容，适合存储重要数据.
 *  @return Document文件夹路径
 */
+ (NSString *)getDocumentDirectory;
/**
 * 获取沙盒Library文件夹目录:
 *  [Caches, Preference].
 *  @return Library文件夹路径
 */
+ (NSString *)getLibraryDirectory;
/**
 * 获取沙盒Caches文件夹目录:
 *  iTunes不会同步此文件夹，适合存储体积大，不需要备份的非重要数据.
 *  @return Caches文件夹路径
 */
+ (NSString *)getCachesDirectory;
/**
 * 获取沙盒Preference文件夹目录:
 *  iTunes同步该应用时会同步此文件夹中的内容，通常保存应用的设置信息.
 *  @return Preference文件夹路径
 */
+ (NSString *)getPreferencePanesDirectory;
/**
 * 获取沙盒Tmp文件夹目录:
 *  iTunes不会同步此文件夹，系统可能在应用没运行时就删除该目录下的文件，所以此目录适合保存应用中的一些临时文件，用完就删除.
 *  @return Tmp文件夹路径
 */
+ (NSString *)getTmpDirectory;

/**
 * 获取沙盒Document文件路径:
 *  最常用的目录，iTunes同步该应用时会同步此文件夹中的内容，适合存储重要数据.
 *  @param fileName 文件名
 *  @return 文件路径
 */
+ (NSString *)getDocumentDirectoryWithFileName:(NSString *)fileName;
/**
 * 获取沙盒Library文件路径.
 *  @param fileName 文件名
 *  @return 文件路径
 */
+ (NSString *)getLibraryDirectoryWithFileName:(NSString *)fileName;
/**
 * 获取沙盒Caches文件路径:
 *  iTunes不会同步此文件夹，适合存储体积大，不需要备份的非重要数据.
 *  @param fileName 文件名
 *  @return 文件路径
 */
+ (NSString *)getCachesDirectoryWithFileName:(NSString *)fileName;
/**
 * 获取沙盒Preference文件路径:
 *  iTunes同步该应用时会同步此文件夹中的内容，通常保存应用的设置信息.
 *  @param fileName 文件名
 *  @return 文件路径
 */
+ (NSString *)getPreferencePanesDirectoryWithFileName:(NSString *)fileName;
/**
 * 获取沙盒Tmp文件路径:
 *  iTunes不会同步此文件夹，系统可能在应用没运行时就删除该目录下的文件，所以此目录适合保存应用中的一些临时文件，用完就删除.
 *  @param fileName 文件名
 *  @return 文件路径
 */
+ (NSString *)getTmpDirectoryWithFileName:(NSString *)fileName;

/**
 * 获取文件大小.
 *  @param path 文件路径
 *  @return 文件大小(MB)
 */
+ (float)sizeWithFilePath:(NSString *)path;
/**
 * 获取指定路径下的所有文件.
 *  @param dirPath 文件路径
 *  @return 所有文件
 */
+ (NSArray *)getAllFileNames:(NSString *)dirPath;
/**
 * 删除指定路径下的文件.
 *  @param path 文件路径
 *  @return YES/NO
 */
+ (BOOL)deleteFinderAndFileWithPath:(NSString *)path;
/**
 * 清空指定目录下文件.
 *  @param dirPath 文件路径
 *  @return YES/NO
 */
+ (BOOL)clearCachesFromDirectoryPath:(NSString *)dirPath;

@end
