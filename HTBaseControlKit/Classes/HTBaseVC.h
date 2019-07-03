//
//  HTBaseVC.h
//
//
//  Created by zlj on 2019/07/03.
//  Copyright © 2017年 hoteamsoft. All rights reserved.
//
//
//  Github地址：https://github.com/wangrui460/WRNavigationBar

#import <UIKit/UIKit.h>
#import "WRCustomNavigationBar.h"

@interface HTBaseVC : UIViewController

@property (nonatomic, strong) WRCustomNavigationBar *customNavBar;

//传递的参数字典（pageID title objectID 等）根据需求而定
@property(nonatomic,copy)NSDictionary *paramDict;

- (void)setupNavBar;


@end
