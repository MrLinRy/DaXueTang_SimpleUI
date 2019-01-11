//
//  MyNewsView.h
//  公议
//
//  Created by Mr.Lin on 18/1/2.
//  Copyright © 2018年 Mr.Lin. All rights reserved.
//

#import <UIKit/UIKit.h>

//声明
@class MyNewsView;

//声明代理协议
@protocol BaseCellButtonDelegete <NSObject>

//可选执行方法
@optional
//代理按钮行为
- (void)LeaveWordClick:(MyNewsView *)cell button:(UIButton *)sender;

@end







@interface MyNewsView : UITableViewCell
-(void)setHeadimageText:(NSString *)strHeadimage  DateText:(NSString *)strDate  TimeText:(NSString *)strTime nameText:(NSString *)strname;
-(void)setbtntitle:(NSString *)str;
//委托回调接口
@property (nonatomic, strong) id <BaseCellButtonDelegete> delegate;
@end

