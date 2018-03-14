//
//  ZYViewController.m
//  ZYTool
//
//  Created by zengyuios on 06/22/2017.
//  Copyright (c) 2017 zengyuios. All rights reserved.
//


/**
 * ZYTool Framework.
 *  使用 CocoaPods 导入:
 *  pod 'ZYTool'
 *  成功导入后，在需要的地方:
 *  #import <ZYTool.h>
 *
 *  各类的使用方法请前往各类的头文件观看.
 *  每个头文件都有详细的注释说明.
 */


#import "ZYViewController.h"

/** 导入组件 */
#import <ZYTool/ZYTool.h>

@interface ZYViewController ()

@end

@implementation ZYViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Toast
- (void)testToast {
    [ZYToast showWithText:@"--- Toast ---"];
    [ZYToast showBottomText:@"--- showBottomText ---"];
    [ZYToast showWithText:@"--- showTop ---" topOffset:50.0f duration:2.0f];
    [ZYToast showOperationSuccess];
    [ZYToast showOperationFail];
}

#pragma mark - UserDefaults
- (void)testUserDefaultsTool {
    [UserDefaultsTool setBool:YES forKey:@"boolean"];
    if ([UserDefaultsTool boolForKey:@"boolean"]) {
        NSLog(@"boolean - YES");
    } else {
        NSLog(@"boolean - NO");
    }
}

#pragma mark - Device
- (void)testDeviceTool {
    NSString *IPAddresses = [ZYDeviceIPAdresses getIpAddresses];
    NSLog(@"IPAddresses: %@", IPAddresses);
    
    [ZYUUIDManager saveUUID:@"170525testUUID"];
    NSString *uuid = [ZYUUIDManager getUUID];
    NSLog(@"UUID: %@", uuid);
}

#pragma mark - FileManager
- (void)testFileManager {
    NSString *documentPath = [ZYFileManager getDocumentDirectory];
    NSString *cachesPath = [ZYFileManager getCachesDirectory];
    NSString *tmpPath = [ZYFileManager getTmpDirectory];
    NSLog(@"documentPath: %@, cachesPath: %@, tmpPath: %@", documentPath, cachesPath, tmpPath);
}

#pragma mark - SpeechSynthesizer
- (void)testSpeechSynthesizer {
    [[SpeechSynthesizer sharedInstance] speakString:@"Hello ZYTool."];
}

@end
