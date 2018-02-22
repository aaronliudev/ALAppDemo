//
//  ALCommonMcros.h
//  ALAppDemo
//
//  Created by Alan on 2017/12/1.
//  Copyright © 2017年 Alan. All rights reserved.
//

#ifndef ALCommonMcros_h
#define ALCommonMcros_h



///------
/// NSLog
///------

#ifdef DEBUG
#define NSLog(...) NSLog(__VA_ARGS__)
#else
#define NSLog(...) {}
#endif

#define ALLogError(error) NSLog(@"Error: %@", error)

///------
/// Block
///------

typedef void (^VoidBlock)();
typedef BOOL (^BoolBlock)();
typedef int  (^IntBlock) ();
typedef id   (^IDBlock)  ();

typedef void (^VoidBlock_int)(int);
typedef BOOL (^BoolBlock_int)(int);
typedef int  (^IntBlock_int) (int);
typedef id   (^IDBlock_int)  (int);

typedef void (^VoidBlock_string)(NSString *);
typedef BOOL (^BoolBlock_string)(NSString *);
typedef int  (^IntBlock_string) (NSString *);
typedef id   (^IDBlock_string)  (NSString *);

typedef void (^VoidBlock_id)(id);
typedef BOOL (^BoolBlock_id)(id);
typedef int  (^IntBlock_id) (id);
typedef id   (^IDBlock_id)  (id);

#define Device_is_iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

#pragma mark - UI macro

#define StatusBarHeight              [[UIApplication sharedApplication] statusBarFrame].size.height
#define NavBarDefaultHeight          44
#define NavBarHeight                 (NavBarDefaultHeight + StatusBarHeight)
#define TabBarHeight                 (Device_is_iPhoneX ? 83 : 49)
#define iPhoneXHomeIndicatorHeight   (TabBarHeight - 49)

#define SCREEN_WIDTH                 MIN(([[UIScreen mainScreen] bounds].size.width),([[UIScreen mainScreen] bounds].size.height))
#define SCREEN_HEIGHT                MAX(([[UIScreen mainScreen] bounds].size.height),([[UIScreen mainScreen] bounds].size.width))
#define MAINSCREEN_HEIGHT            (SCREEN_HEIGHT - STATUS_BAR_HEIGHT)
#define WHOLE_SCREEN_FRAME           CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)

#define KLeftOffset                12
#define KTopOffset                 8
#define KRightOffset               12
#define KBottomOffset              8
#define SCREEN_SCALE [UIScreen mainScreen].scale
#define AL_1PX_WIDTH (1 / [UIScreen mainScreen].scale)

///------
/// Color
///------

#define RGB(r, g, b) [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:1.0]
#define RGBAlpha(r, g, b, a) [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:(a)]

#define HexRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define HexRGBAlpha(rgbValue, a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:(a)]

#define BlackTextColor HexRGB(0x191a1c)
#define GrayTextColor HexRGB(0xF6F6F7)
#define SepLineColor HexRGB(0xDFDFE2)
#define ThemeMainColor HexRGB(0xFF7877)
#define ThemeMainHighLightColor HexRGBAlpha(0xFF7877, 0.3)

///-----------
/// Other Info
///-----------

#define AL_PLACEHOLDER_IMAGE [UIImage imageNamed:@""];

#define AL_EMPTY_PLACEHOLDER @"Not Set"

#define AL_ALERT_TITLE @"Tips"
#define MBPROGRESSHUD_LABEL_TEXT @"Loading..."

///---------
/// App Info
///---------

#define ALApplicationVersionKey @"ALApplicationVersionKey"

#define AL_APP_ID               @"961330940"
#define AL_APP_STORE_URL        @"https://itunes.apple.com/cn/app/id"AL_APP_ID"?mt=8"
#define AL_APP_STORE_REVIEW_URL @"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?id="AL_APP_ID@"&onlyLatestVersion=true&pageNumber=0&sortOrdering=1&type=Purple+Software"

#define AL_APP_NAME    ([[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleName"])
#define AL_APP_VERSION ([[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"])
#define AL_APP_BUILD   ([[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"])

///-----------------------------
/// MVVMReactiveCocoa Repository
///-----------------------------

#define MVVM_REACTIVECOCOA_OWNER_LOGIN @"leichunfeng"
#define MVVM_REACTIVECOCOA_NAME        @"MVVMReactiveCocoa"

#define AL_README_CSS_STYLE @"<style type=\"text/css\">body { font-family: \"Helvetica Neue\", Helvetica, \"Segoe UI\", Arial, freesans, sans-serif; }</style>"

///------------
/// UMengSocial
///------------

#define AL_UM_APP_KEY   @"553e402e67e58ed9f4004045"
#define AL_UM_SHARE_URL @"http://www.umeng.com/social"

// Wechat
#define AL_WX_APP_ID     @"wx738f343b7a8d1bdb"
#define AL_WX_APP_SECRET @"a09ec93457abc134f769e37da4d8ad21"

// Sina Weibo
#define AL_WEIBO_APP_KEY      @"2568724352"
#define AL_WEIBO_APP_SECRET   @"ef15e9184ff294fc67a3240e960782f2"
#define AL_WEIBO_REDIRECT_URL @"http://sns.whalecloud.com/sina2/callback"

// QQ
#define AL_QQ_APP_ID            @"1104637080"
#define AL_QQ_APP_KEY           @"WWGP247M3a7xIAUL"
#define AL_TENCENT_REDIRECT_URL @"http://sns.whalecloud.com/tencent2/callback"

///-----
/// FMDB
///-----

#define AL_FMDB_PATH [NSString stringWithFormat:@"%@/%@.db", AL_DOCUMENT_DIRECTORY, AL_APP_NAME]
#define ALLogLastError(db) NSLog(@"lastError: %@, lastErrorCode: %d, lastErrorMessage: %@", [db lastError], [db lastErrorCode], [db lastErrorMessage]);

///-------------
/// Notification
///-------------

#define ALStarredReposDidChangeNotification   @"ALStarredReposDidChangeNotification"
#define ALRecentSearchesDidChangeNotification @"ALRecentSearchesDidChangeNotification"


#endif /* ALCommonMcros_h */
