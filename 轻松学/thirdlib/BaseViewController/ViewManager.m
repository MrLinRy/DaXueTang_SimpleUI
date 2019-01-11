//
//  ViewManager.m
//  projectBase
//
//  Created by linruyan on 15-11-14.
//  Copyright (c) 2015年 chenjianying. All rights reserved.
//

#import "ViewManager.h"
#import "SizeHeader.h"
#import "ViewController.h"
#import "LoginViewController.h"
#import "MainViewController.h"
#import "ResourcesLibViewController.h"
#import "MineViewController.h"

@implementation ViewManager

static ViewManager* mInstance;

@synthesize NavigationController = _navigationController;


+ (ViewManager*)shareInstance
{
    if (nil == mInstance)
    {
        mInstance = [[ViewManager alloc] init];
    }
    
    return mInstance;
}


-(id)init
{
    self = [super init];
    if(self != nil)
    {
        //1
        ResourcesLibViewController *resourcesVC = [ResourcesLibViewController new];
        resourcesVC.tabBarItem.title = @"资源库";//1
        //设置底部icon
        resourcesVC.tabBarItem.selectedImage = [UIImage imageNamed:@"icon_5"];
        
        resourcesVC.tabBarItem.image = [UIImage imageNamed:@"icon_1"];
        
        UINavigationController *nav1 = [[UINavigationController alloc]initWithRootViewController:resourcesVC];
        nav1.navigationBar.hidden = YES;//2
        //2
        MainViewController *mainVC2 = [MainViewController new];
        
        mainVC2.tabBarItem.title = @"首页";
        //设置底部icon
        mainVC2.tabBarItem.selectedImage = [UIImage imageNamed:@"icon_2"];
        mainVC2.tabBarItem.image = [UIImage imageNamed:@"icon_6"];
        
        UINavigationController *nav2 = [[UINavigationController alloc]initWithRootViewController:mainVC2];
        nav2.navigationBar.hidden = YES;
        //3
        MineViewController *mineVC3 = [MineViewController new];
        
        mineVC3.tabBarItem.title = @"个人中心";
        //设置底部icon
        mineVC3.tabBarItem.selectedImage = [UIImage imageNamed:@"icon_4"];
        mineVC3.tabBarItem.image = [UIImage imageNamed:@"icon_3"];
        
        UINavigationController *nav3 = [[UINavigationController alloc]initWithRootViewController:mineVC3];
        nav3.navigationBar.hidden = YES;
        
        //创建tabbar
        UITabBarController *tabbar = [[UITabBarController alloc]init];
        tabbar.viewControllers = [NSArray arrayWithObjects:nav1,nav2,nav3, nil];
        tabbar.selectedIndex = 1;
        //设置选中时字体的颜色(也可更改字体大小)
        [tabbar.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor redColor],NSFontAttributeName:[UIFont systemFontOfSize:17]} forState:UIControlStateSelected];
         //[tabbar.tabBar setTintColor:[UIColor redColor]];
  
       
        //设置初始化页面为第二个页面
//        MainViewController *vc = [MainViewController new];
        
        _navigationController = [[UINavigationController alloc] initWithRootViewController:tabbar];
        
//        _navigationController = [[UINavigationController alloc] initWithRootViewController:[self createYMTTabBarController]];
    }
    
    
    _navigationController.navigationBar.hidden = YES;
//    _navigationController.interactivePopGestureRecognizer.enabled = NO;
    
    
    return self;
}



-(void)toMainPlat
{
    
//    MainViewController *vc=[MainViewController new];
//    _navigationController =[[UINavigationController alloc]initWithRootViewController:vc];

}


@end
