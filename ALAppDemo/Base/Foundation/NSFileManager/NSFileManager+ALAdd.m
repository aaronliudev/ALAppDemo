//
//  NSFileManager+ALAdd.m
//  ALAppDemo
//
//  Created by Alan on 2018/2/22.
//  Copyright © 2018年 Alan. All rights reserved.
//

#import "NSFileManager+ALAdd.h"

@implementation NSFileManager (ALAdd)

/// 路径是否是文件夹
+ (BOOL)isDirectory:(NSString *)filePath
{
    BOOL isDir;
    return ([[NSFileManager defaultManager] fileExistsAtPath:filePath isDirectory:&isDir] && isDir);
}

/// 文件是否存在
+ (BOOL)existFile:(NSString *)filePath
{
    return [[NSFileManager defaultManager] fileExistsAtPath:filePath];
}

/**
 文件后缀名，包含点，比如 .png
 @return 包含点的文件后缀名
 */
+ (NSString *)fileExtensionWithDotForPath:(NSString *)path
{
    NSString *extension = [path pathExtension];
    if (![extension isEqualToString:@""])
    {
        extension = [NSString stringWithFormat:@".%@", extension];
    }
    return extension;
}

/// 获取路径
+ (NSString *)filePathForPath:(NSString *)path
{
    return [path stringByDeletingLastPathComponent];
}

/// 文件尺寸
+ (NSNumber *)fileSizeWithFilePath:(NSString *)filePath
{
    if (!filePath)
    {
        return nil;
    }
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL isDir;
    if ([fileManager fileExistsAtPath:filePath isDirectory:&isDir] && !isDir)
    {
        NSDictionary *fileAttributes = [fileManager attributesOfItemAtPath:filePath error:nil];
        if (fileAttributes)
        {
            return [fileAttributes objectForKey:NSFileSize];
        }
    }
    return nil;
}

/**
 返回目录下所有文件路径
 @return 所有文件路径
 */
+ (NSArray <NSString *> *)fileNamesInFolder:(NSString *)path
{
    NSString *fileName;
    NSMutableArray *results = [NSMutableArray array];
    NSDirectoryEnumerator *dirEnum = [[NSFileManager defaultManager] enumeratorAtPath:path];
    while ((fileName = [dirEnum nextObject]))
    {
        BOOL isDir;
        [[NSFileManager defaultManager] fileExistsAtPath:[path stringByAppendingPathComponent:fileName] isDirectory: &isDir];
        if (!isDir) [results addObject:fileName];
    }
    return [results copy];
}

//MARK: - path相关
/// Document 目录路径
+ (NSString *)documentsPath
{
    static dispatch_once_t onceToken;
    static NSString *cachedPath;
    dispatch_once(&onceToken, ^{
        cachedPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    });
    return cachedPath;
}

/// Library 目录路径
+ (NSString *)libraryPath
{
    static dispatch_once_t onceToken;
    static NSString *cachedPath;
    dispatch_once(&onceToken, ^{
        cachedPath = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject];
    });
    return cachedPath;
}

/// main bundle 路径
+ (NSString *)bundlePath
{
    return [[NSBundle mainBundle] bundlePath];
}

/// Temporary 目录路径
+ (NSString *)temporaryPath
{
    static dispatch_once_t onceToken;
    static NSString *cachedPath;
    dispatch_once(&onceToken, ^{
        cachedPath = NSTemporaryDirectory();
    });
    return cachedPath;
}

/// Document目录下文件路径
+ (NSString *)documentFilePathWithFileName:(NSString *)fileName
{
    return [[self documentsPath] stringByAppendingPathComponent:fileName];
}

/// Main Bundle 下 文件路径
+ (NSString *)bundleFilePathWithFileName:(NSString *)fileName
{
    return [[self bundlePath] stringByAppendingPathComponent:fileName];
}

//MARK: - 文件操作
/// 创建文件夹
+ (BOOL)createDirectoryIfNotExist:(NSString *)filePath
{
    if (![self isDirectory:filePath])
    {
        BOOL success = [[NSFileManager defaultManager] createDirectoryAtPath:filePath withIntermediateDirectories:YES attributes:nil error:nil];
        
        return success;
    }
    return YES; //path existed and was a directory
}

/// 删除目录下文件
+ (BOOL)deleteFileForPath:(NSString *)path
{
    if ([self existFile:path])
    {
        return [[self defaultManager] removeItemAtPath:path error:nil];
    }
    return NO;
}

@end
