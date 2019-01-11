//
//  ViewManager.h
//  projectBase
//
//  Created by linruyan on 15-11-14.
//  Copyright (c) 2015年 linruyan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface ViewManager : NSObject
{
@private
    UINavigationController *_navigationController;
}

@property (nonatomic, readonly) UINavigationController *NavigationController;

+ (ViewManager*)shareInstance;

-(void)toMainPlat;

@end
