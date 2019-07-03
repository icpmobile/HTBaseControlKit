//
//  BaseViewController.m
//  CodeDemo
//
//  Created by wangrui on 2017/5/16.
//  Copyright © 2017年 wangrui. All rights reserved.
//
//  Github地址：https://github.com/wangrui460/WRNavigationBar

#import "HTBaseVC.h"
#import "WRNavigationBar.h"
#import "UIColor+flat.h"


@interface HTBaseVC ()
@end

@implementation HTBaseVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view setBackgroundColor:[UIColor colorWithHexCode:@"#f0f0f0"]];
    [self setupNavBar];
}

- (void)setupNavBar
{
    [self.view addSubview:self.customNavBar];
    // 设置自定义导航栏背景图片
    
    NSInteger scale = [[UIScreen mainScreen] scale];
    
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSString *bgImgStr = [bundle pathForResource:@"ht_basecontrol_navbg@2x.png" ofType:nil  inDirectory:@"HTBaseControlKit.bundle"];
    
    self.customNavBar.barBackgroundImage = [UIImage imageWithContentsOfFile:bgImgStr];
    // 设置自定义导航栏标题颜色
    self.customNavBar.titleLabelColor = [UIColor whiteColor];
    [self.customNavBar wr_setBottomLineHidden:YES];
    if (self.navigationController.childViewControllers.count != 1) {
        // 设置初始导航栏透明度
        NSString *backImg = [NSString stringWithFormat:@"ht_basecontrol_navback@%zdx.png",scale];
        NSString *backImgStr = [bundle pathForResource:backImg ofType:nil  inDirectory:@"HTBaseControlKit.bundle"];
        [self.customNavBar wr_setLeftButtonWithImage:[UIImage imageWithContentsOfFile:backImgStr]];
    }
    
    [WRNavigationBar wr_setBlacklist:@[@"SpecialController",
                                       @"TZPhotoPickerController",
                                       @"TZGifPhotoPreviewController",
                                       @"TZAlbumPickerController",
                                       @"TZPhotoPreviewController",
                                       @"TZVideoPlayerController"]];
}

- (WRCustomNavigationBar *)customNavBar
{
    if (_customNavBar == nil) {
        _customNavBar = [WRCustomNavigationBar CustomNavigationBar];
    }
    return _customNavBar;
}

@end
