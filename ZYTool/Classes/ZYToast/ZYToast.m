//
//  ZYToast.m
//  ZYToast
//
//  Created by ZY on 16/8/4.
//  Copyright © 2016年 ZY. All rights reserved.
//

#import "ZYToast.h"
#import <QuartzCore/QuartzCore.h>

static CGFloat const defaultDisplayDuration = 2.5f;

@interface ZYToast ()
{
    NSString *text;
    UIButton *contentView;
    CGFloat  duration;
}

- (id)initWithText:(NSString *)text;  
- (void)setDuration:(CGFloat) duration;  

- (void)dismissToast; 
- (void)toastTaped:(UIButton *)sender;  

- (void)showAnimation;  
- (void)hideAnimation;  

- (void)show;  
- (void)showFromTopOffset:(CGFloat) topOffset;  
- (void)showFromBottomOffset:(CGFloat) bottomOffset;

@end

@implementation ZYToast

- (void)dealloc {  
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIDeviceOrientationDidChangeNotification object:[UIDevice currentDevice]];
    contentView = nil;
    text = nil;   
}  

- (id)initWithText:(NSString *)newText {
    if (self = [super init]) {
        text = [newText copy];
        UIFont *font = [UIFont boldSystemFontOfSize:14];
        CGSize textSize = [newText boundingRectWithSize:[UIScreen mainScreen].bounds.size options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName : font} context:nil].size;
        
        UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, textSize.width + 12, textSize.height + 12)];  
        textLabel.backgroundColor = [UIColor clearColor];
        textLabel.textColor = [UIColor whiteColor];
        textLabel.textAlignment = NSTextAlignmentCenter;
        textLabel.font = font;
        textLabel.text = newText;
        textLabel.numberOfLines = 0;
        
        contentView = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, textLabel.frame.size.width, textLabel.frame.size.height)];  
        contentView.layer.cornerRadius = 5.0f;
        contentView.layer.borderWidth = 1.0f;
        contentView.layer.borderColor = [[UIColor grayColor] colorWithAlphaComponent:0.5].CGColor;
        contentView.backgroundColor = [UIColor colorWithRed:0.2f green:0.2f blue:0.2f alpha:0.75f];
        [contentView addSubview:textLabel];
        contentView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        [contentView addTarget:self action:@selector(toastTaped:) forControlEvents:UIControlEventTouchDown];
        contentView.alpha = 0.0f;
        
        duration = defaultDisplayDuration;
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deviceOrientationDidChanged:) name:UIDeviceOrientationDidChangeNotification object:[UIDevice currentDevice]];
    }
    return self;
}

- (void)deviceOrientationDidChanged:(NSNotification *)notify {
    [self hideAnimation];
}

- (void)dismissToast {
    [contentView removeFromSuperview];
}

- (void)toastTaped:(UIButton *)sender {
    [self hideAnimation];
}

- (void)setDuration:(CGFloat)newDuration {
    duration = newDuration;
}

- (void)showAnimation {
    [UIView beginAnimations:@"show" context:NULL];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [UIView setAnimationDuration:0.3];
    contentView.alpha = 1.0f;
    [UIView commitAnimations];
}

- (void)hideAnimation {
    [UIView beginAnimations:@"hide" context:NULL];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(dismissToast)];
    [UIView setAnimationDuration:0.3];
    contentView.alpha = 0.0f;
    [UIView commitAnimations];
}

- (void)show {
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    contentView.center = window.center;
    [window  addSubview:contentView];
    [self showAnimation];
    [self performSelector:@selector(hideAnimation) withObject:nil afterDelay:duration];
}

- (void)showFromTopOffset:(CGFloat)top {
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    contentView.center = CGPointMake(window.center.x, top  + contentView.frame.size.height/2);
    [window  addSubview:contentView];
    [self showAnimation];
    [self performSelector:@selector(hideAnimation) withObject:nil afterDelay:duration];
}

- (void)showFromBottomOffset:(CGFloat)bottom {
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    contentView.center = CGPointMake(window.center.x, window.frame.size.height-(bottom  + contentView.frame.size.height/2));
    [window  addSubview:contentView];
    [self showAnimation];
    [self performSelector:@selector(hideAnimation) withObject:nil afterDelay:duration];
}

+ (void)showWithText:(NSString *)text {
    [self showWithText:text duration:defaultDisplayDuration];
}

+ (void)showWithText:(NSString *)text duration:(CGFloat)duration {
    ZYToast *toast = [[self alloc] initWithText:text];
    [toast setDuration:duration];
    [toast show];
}

+ (void)showWithText:(NSString *)text topOffset:(CGFloat)topOffset {
    [self showWithText:text topOffset:topOffset  duration:defaultDisplayDuration];
}

+ (void)showWithText:(NSString *)text topOffset:(CGFloat)topOffset duration:(CGFloat)duration {
    ZYToast *toast = [[self alloc] initWithText:text];
    [toast setDuration:duration];
    [toast showFromTopOffset:topOffset];
}

+ (void)showWithText:(NSString *)text bottomOffset:(CGFloat)bottomOffset {
    [self showWithText:text bottomOffset:bottomOffset  duration:defaultDisplayDuration];
}

+ (void)showWithText:(NSString *)text bottomOffset:(CGFloat)bottomOffset duration:(CGFloat)duration {
    ZYToast *toast = [[self alloc] initWithText:text];
    [toast setDuration:duration ];
    [toast showFromBottomOffset:bottomOffset];
}

+ (void)showOperationSuccess {
    [self showWithText:@"操作成功" bottomOffset:50.0f];
}

+ (void)showOperationFail {
    [self showWithText:@"操作失败, 请重试" bottomOffset:50.0f];
}

+ (void)showBottomText:(NSString *)text {
    [self showWithText:text bottomOffset:50.0f];
}

@end
