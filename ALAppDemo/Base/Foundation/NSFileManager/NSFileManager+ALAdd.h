//
//  NSFileManager+ALAdd.h
//  ALAppDemo
//
//  Created by Alan on 2018/2/22.
//  Copyright © 2018年 Alan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (ALAdd)

+ (BOOL)isDirectory:(NSString *)filePath;
+ (BOOL)existFile:(NSString *)filePath;

/**
 文件后缀名，包含点，比如 .png
 @return 包含点的文件后缀名
 */
+ (NSString *)fileExtensionWithDotForPath:(NSString *)path;

/// 获取路径
+ (NSString *)filePathForPath:(NSString *)path;

/// 文件大小
+ (NSNumber *)fileSizeWithFilePath:(NSString *)filePath;
/// 文件夹下所有文件
+ (NSArray <NSString *> *)fileNamesInFolder:(NSString *)path;


//MARK: - path相关
+ (NSString *)documentsPath;
+ (NSString *)libraryPath;
+ (NSString *)temporaryPath;
+ (NSString *)bundlePath;
+ (NSString *)documentFilePathWithFileName:(NSString *)fileName;
+ (NSString *)bundleFilePathWithFileName:(NSString *)fileName;

/// 创建文件夹
+ (BOOL)createDirectoryIfNotExist:(NSString *)filePath;
/// 删除目录下文件
+ (BOOL)deleteFileForPath:(NSString *)path;

@end
