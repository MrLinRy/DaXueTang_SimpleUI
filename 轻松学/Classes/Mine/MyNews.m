//
//  MyNews.m
//  公议
//
//  Created by Mr.Lin on 18/1/1.
//  Copyright © 2018年 Mr.Lin. All rights reserved.
//

#import "MyNews.h"
#import "ViewManager.h"
#import "SizeHeader.h"
#import "NewsMode.h"
#import "MyNewsView.h"
#import "ChatVController.h"
#define LEFTSIZE LRYScreenpH(40)
@interface MyNews ()<UITableViewDelegate,UITableViewDataSource,BaseCellButtonDelegete>
{
    NSMutableArray *ArryNews;
    int a;
}
@property (nonatomic,strong) UITableView *tableView;

@end



@implementation MyNews



-(UITableView *)tableView
{
    if (_tableView == nil)
    {
        _tableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth,LRYScreenpH(740)) style:UITableViewStylePlain];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
        _tableView.estimatedRowHeight =LRYScreenpH(100);
        _tableView.rowHeight=UITableViewAutomaticDimension;
        
    }
    return _tableView;
}

-(instancetype)init
{
    self=[super init];
    if (self)
    {
        
    }
    return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    a=7;
    [self.view setBackgroundColor:YWQColor(245, 245, 245)];
    [self setTopTitle:@"我的消息"];
    [self setTopTitleColor:[UIColor whiteColor]];
    [self setTopBgColor:MainColor];
    
#pragma mark--------------电源栏字体颜色
//    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlack];
    
    UIView *bgview =[[UIView alloc]initWithFrame:CGRectMake(0, TopAndSystemHeight+LRYScreenpH(10), ScreenWidth, ScreenHeight-TopAndSystemHeight-LRYScreenpH(10))];
    [bgview setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:bgview];
    
    UILabel *Labnonthing=[[UILabel alloc]initWithFrame:CGRectMake(ScreenWidth/4, LRYScreenpH(50), ScreenWidth/2, LRYScreenpH(30))];
    Labnonthing.text =@"暂无消息~";
    [Labnonthing setTextAlignment:NSTextAlignmentCenter];
    [Labnonthing setTextColor:[UIColor blackColor]];
    [Labnonthing setFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(19)]];
    [bgview addSubview:Labnonthing];
    [bgview addSubview:self.tableView];
    
   
    UILabel *LabNotice =[[UILabel alloc]initWithFrame:CGRectMake(7*LEFTSIZE, CGRectGetMaxY(self.tableView.frame)+LRYScreenpH(30), ScreenWidth-14*LEFTSIZE, LRYScreenpH(50))];
    [LabNotice setText:@"公告"];
    [LabNotice setFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(17)]];
    
    [LabNotice setTextAlignment:NSTextAlignmentCenter];
    [LabNotice setTextColor:MainColor];
    [LabNotice setBackgroundColor:[UIColor whiteColor]];
    [LabNotice.layer setMasksToBounds:YES];
    [LabNotice.layer setBorderWidth:1];
    [LabNotice.layer setBorderColor:MainColor.CGColor];
    [LabNotice.layer setCornerRadius:4];
    
    
    UILabel *Line =[[UILabel alloc]initWithFrame:CGRectMake(4*LEFTSIZE, CGRectGetMaxY(self.tableView.frame)+LRYScreenpH(55), ScreenWidth-LEFTSIZE*8, LRYScreenpH(2))];
    [Line setBackgroundColor:MainColor];
    [bgview addSubview:Line];
    [bgview addSubview:LabNotice];
    
    //消息
    NewsMode *New_0=[[NewsMode alloc]init];
    New_0.StrHead =@"sy_17";
    New_0.Name =@"陈老师";
    New_0.Date =@"2016-8-10";
    New_0.Time=@"07:00~10:00";
    
    NewsMode *New_1=[[NewsMode alloc]init];
    New_1.StrHead =@"sy_24";
    New_1.Name =@"王老师";
    New_1.Date =@"2016-8-10";
    New_1.Time=@"10:00~11:00";
    
    NewsMode *New_2=[[NewsMode alloc]init];
    New_2.StrHead =@"sy_26";
    New_2.Name =@"张老师";
    New_2.Date =@"2016-8-10";
    New_2.Time=@"11:00~12:00";

    NewsMode *New_3=[[NewsMode alloc]init];
    New_3.StrHead =@"sy_25";
    New_3.Name =@"许老师";
    New_3.Date =@"2016-8-10";
    New_3.Time=@"13:00~15:00";

    NewsMode *New_4=[[NewsMode alloc]init];
    New_4.StrHead =@"sy_33";
    New_4.Name =@"周老师";
    New_4.Date =@"2016-8-10";
    New_4.Time=@"16:00~17:00";

    
    ArryNews =[NSMutableArray arrayWithObjects: New_0,New_1,New_2,New_3,New_4, nil];

    
}

#pragma mark-------区数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return  1;
}
#pragma mark-------行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
#pragma mark-------区头视图
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return 0;
}
#pragma mark-------区头高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}
#pragma mark-------区尾视图
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *footView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, LRYScreenpH(20))];
    [footView setBackgroundColor:YWQColor(247, 247, 247)];
    return footView;
}
#pragma mark-------区尾高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    
    return LRYScreenpH(20);
}
#pragma mark-------行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  
    return LRYScreenpH(141);
}
#pragma mark-------行视图
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellID = @"CellID";
    MyNewsView *CellView =[tableView dequeueReusableCellWithIdentifier:CellID];
    if (CellView == nil)
    {
        CellView =[[MyNewsView alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellID];
        [CellView setBackgroundColor:[UIColor clearColor]];
        
    }
    CellView.selectionStyle=UITableViewCellSelectionStyleNone;
    NewsMode *New_0=ArryNews[indexPath.row];
    [CellView setHeadimageText:New_0.StrHead DateText:New_0.Date TimeText:New_0.Time nameText:New_0.Name];
    
    return CellView;
}


-(void)LeaveWordClick:(MyNewsView *)cell button:(UIButton *)sender
{
    ChatVController *vc=[ChatVController new];
    [[ViewManager shareInstance].NavigationController pushViewController:vc animated:YES];
}

@end
