//
//  ZYToast.h
//
//  Created by ZY on 16/8/4.
//  Copyright © 2016年 ZY. All rights reserved.
//
//  Toast

#import <UIKit/UIKit.h>

/** Toast 提示信息. */
@interface ZYToast : NSObject


/*** 默认显示时长为2.5秒. ***/


/**
 * 显示提示信息.
 *  @param text 要显示的消息
 */
+ (void)showWithText:(NSString *)text;

/**
 * 显示提示信息.
 *  @param text 要显示的消息
 *  @param duration 显示时长
 */
+ (void)showWithText:(NSString *)text duration:(CGFloat)duration;

/**
 * 显示提示信息.
 *  @param text 要显示的消息
 *  @param topOffset 与顶部的距离
 */
+ (void)showWithText:(NSString *)text topOffset:(CGFloat)topOffset;
/**
 * 显示提示信息.
 *  @param text 要显示的消息
 *  @param topOffset 与顶部的距离
 *  @param duration 显示时长
 */
+ (void)showWithText:(NSString *)text topOffset:(CGFloat)topOffset duration:(CGFloat)duration;

/**
 * 显示提示信息.
 *  @param text 要显示的消息
 *  @param bottomOffset 与底部的距离
 */
+ (void)showWithText:(NSString *)text bottomOffset:(CGFloat)bottomOffset;
/**
 * 显示提示信息.
 *  @param text 要显示的消息
 *  @param bottomOffset 与底部的距离
 *  @param duration 显示时长
 */
+ (void)showWithText:(NSString *)text bottomOffset:(CGFloat)bottomOffset duration:(CGFloat)duration;

/**
 * 显示"操作成功".
 */
+ (void)showOperationSuccess;
/**
 * 显示"操作失败, 请重试".
 */
+ (void)showOperationFail;

/**
 * 显示提示信息:
 *  与底部固定距离 50.
 *  @param text 要显示的消息
 */
+ (void)showBottomText:(NSString *)text;

@end
