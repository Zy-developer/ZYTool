//
//  ZYFileManager.m
//
//  Created by ZY on 16/8/3.
//  Copyright © 2016年 ZY. All rights reserved.
//

#import "ZYFileManager.h"

@interface ZYFileManager ()

@end

@implementation ZYFileManager

#pragma mark - 获取沙盒Document的文件目录
+ (NSString *)getDocumentDirectory{
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}
+ (NSString *)getDocumentDirectoryWithFileName:(NSString *)fileName {
    fileName = [fileName stringByReplacingOccurrencesOfString:@" " withString:@""];
    if (!fileName || [fileName isEqualToString:@""]) return [self getDocumentDirectory];
    return [[self getDocumentDirectory] stringByAppendingPathComponent:fileName];
}

#pragma mark - 获取沙盒Library的文件目录
+ (NSString *)getLibraryDirectory{
    return [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject];
}
+(NSString *)getLibraryDirectoryWithFileName:(NSString *)fileName {
    fileName = [fileName stringByReplacingOccurrencesOfString:@" " withString:@""];
    if (!fileName || [fileName isEqualToString:@""]) return [self getLibraryDirectory];
    return [[self getLibraryDirectory] stringByAppendingPathComponent:fileName];
}

#pragma mark - 获取沙盒Library/Caches的文件目录
+ (NSString *)getCachesDirectory{
    return [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
}
+ (NSString *)getCachesDirectoryWithFileName:(NSString *)fileName {
    fileName = [fileName stringByReplacingOccurrencesOfString:@" " withString:@""];
    if (!fileName || [fileName isEqualToString:@""]) return [self getCachesDirectory];
    return [[self getCachesDirectory] stringByAppendingPathComponent:fileName];
}

#pragma mark - 获取沙盒Preference的文件目录
+ (NSString *)getPreferencePanesDirectory{
    return [NSSearchPathForDirectoriesInDomains(NSPreferencePanesDirectory, NSUserDomainMask, YES) lastObject];
}
+ (NSString *)getPreferencePanesDirectoryWithFileName:(NSString *)fileName {
    fileName = [fileName stringByReplacingOccurrencesOfString:@" " withString:@""];
    if (!fileName || [fileName isEqualToString:@""]) return [self getPreferencePanesDirectory];
    return [[self getPreferencePanesDirectory] stringByAppendingPathComponent:fileName];
}

#pragma mark - 获取沙盒tmp的文件目录
+ (NSString *)getTmpDirectory{
    return NSTemporaryDirectory();
}
+ (NSString *)getTmpDirectoryWithFileName:(NSString *)fileName {
    fileName = [fileName stringByReplacingOccurrencesOfString:@" " withString:@""];
    if (fileName == nil || fileName.length == 0) return [self getTmpDirectory];
    return [[self getTmpDirectory] stringByAppendingPathComponent:fileName];
}

#pragma mark - 根据路径返回目录或文件的大小
+ (float)sizeWithFilePath:(NSString *)path {
    if (!path || [path isEqualToString:@""]) return 0.0f;
    // 1.获得文件夹管理者
    NSFileManager *manger = [NSFileManager defaultManager];
    // 2.检测路径的合理性
    BOOL dir = NO;
    BOOL exits = [manger fileExistsAtPath:path isDirectory:&dir];
    if (!exits) return 0;
    // 3.判断是否为文件夹
    if (dir) { // 文件夹, 遍历文件夹里面的所有文件
        // 这个方法能获得这个文件夹下面的所有子路径(直接\间接子路径)
        NSArray *subpaths = [manger subpathsAtPath:path];
        int totalSize = 0;
        for (NSString *subpath in subpaths) {
            NSString *fullsubpath = [path stringByAppendingPathComponent:subpath];
            BOOL dir = NO;
            [manger fileExistsAtPath:fullsubpath isDirectory:&dir];
            if (!dir) { // 子路径是个文件
                NSDictionary *attrs = [manger attributesOfItemAtPath:fullsubpath error:nil];
                totalSize += [attrs[NSFileSize] intValue];
            }
        }
        return totalSize / (1024 * 1024.0);
    } else { // 文件
        NSDictionary *attrs = [manger attributesOfItemAtPath:path error:nil];
        return [attrs[NSFileSize] intValue] / (1024.0 * 1024.0);
    }
}

#pragma mark - 得到指定目录下的所有文件
+ (NSArray *)getAllFileNames:(NSString *)dirPath{
    if (!dirPath || [dirPath isEqualToString:@""]) return nil;
    NSArray *files = [[NSFileManager defaultManager] subpathsOfDirectoryAtPath:dirPath error:nil];
    return files;
}

#pragma mark - 删除指定目录或文件
+ (BOOL)deleteFinderAndFileWithPath:(NSString *)path {
    if (!path || [path isEqualToString:@""]) return NO;
    NSFileManager *mgr = [NSFileManager defaultManager];
    return [mgr removeItemAtPath:path error:nil];
}

#pragma mark - 清空指定目录下文件
+ (BOOL)clearCachesFromDirectoryPath:(NSString *)dirPath {
    if (!dirPath || [dirPath isEqualToString:@""]) return NO;
    //获得全部文件数组
    NSArray *fileAry =  [self getAllFileNames:dirPath];
    //遍历数组
    BOOL flag = NO;
    for (NSString *fileName in fileAry) {
        NSString *filePath = [dirPath stringByAppendingPathComponent:fileName];
        flag = [self deleteFinderAndFileWithPath:filePath];
        if (!flag) break ;
    }
    return flag;
}

@end
