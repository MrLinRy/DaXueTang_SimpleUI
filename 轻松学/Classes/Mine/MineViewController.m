//
//  MineViewController.m
//  轻松学
//
//  Created by 陈剑英 on 2018/5/19.
//  Copyright © 2018年 陈剑英. All rights reserved.
//

#import "MineViewController.h"
#import "ResourcesLibVC.h"
#import "ViewManager.h"
#import "MyNews.h"
#import "ResourcesTeachLibVC.h"
@interface MineViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTopBgColor:[UIColor clearColor]];
    [self setTopLineHide:YES];
    [self setTopTitleColor:[UIColor whiteColor]];
    
    
    
    self.view.backgroundColor = YWQColor(242, 242, 242);
#pragma mark--------------电源栏字体颜色
//    [self.navigationController.navigationBar setBarStyle:UIBarStyleDefault];

    UIView *headbgView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, LRYScreenpH(343))];
    [headbgView setBackgroundColor:MainColor];
    [self.view addSubview:headbgView];
    
    UIButton *headImageBtn=[self createBtn:CGRectMake(LRYScreenpW(300), LRYScreenpH(70), LRYScreenpW(150), LRYScreenpH(150)) title:nil iconImage:[UIImage imageNamed:@"wd_4"] backgroundImage:[UIImage imageNamed:@"wd_5"] tag:10000 textColor:nil];
    
    [headImageBtn addTarget:self action:@selector(headImageClick) forControlEvents:UIControlEventTouchUpInside];
    [headbgView addSubview:headImageBtn];
    
    UILabel *labName=[self createLabel:CGRectMake((double)(ScreenWidth-LRYScreenpW(150))/2, CGRectGetMaxY(headImageBtn.frame)+LRYScreenpH(20), LRYScreenpW(150), LRYScreenpH(30)) title:@"庄大灰" fontSize:19 textColor:[UIColor whiteColor]];
    [labName setTextAlignment:NSTextAlignmentCenter];
    [labName setBackgroundColor:[UIColor clearColor]];
    [headbgView addSubview:labName];
    
    
//    表
    UITableView *tableView =[[UITableView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(headbgView.frame), ScreenWidth, ScreenHeight-headbgView.frame.size.height) style:UITableViewStylePlain];
    [tableView setBackgroundColor:[UIColor clearColor]];
    tableView.delegate=self;
    tableView.dataSource=self;
    tableView.scrollEnabled=NO;
    tableView.separatorStyle =UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableView];

    
    
    
    
    
}

-(void)headImageClick{
    
}



#pragma mark--------tableview相关函数
//区数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
    
}

//行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==1) {
        return 2;
    }
    else{
        return 1;
    }
}
//区头高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
    
}
//行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return  LRYScreenpH(126);
    }
    else{
        return LRYScreenpH(100);
    }
    
}
//区尾高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    
    return LRYScreenpH(18);
}

//行视图
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        static NSString *CellID = @"CellID";
        UITableViewCell *CellView =[tableView dequeueReusableCellWithIdentifier:CellID];
        if (CellView == nil)
        {
            
            CellView =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellID];
            
            
            UIButton *Errobtn =[self createBtn:CGRectMake(0, 0, (double)(ScreenWidth/3)-LRYScreenpW(5), LRYScreenpH(126)) title:@"102" iconImage:nil backgroundImage:nil tag:10000 textColor:[UIColor blackColor]];
            [Errobtn setBackgroundColor:[UIColor clearColor]];
            [Errobtn.titleLabel setFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(21)]];
            
            UIButton *Resourcesbtn =[self createBtn:CGRectMake(CGRectGetMaxX(Errobtn.frame)+LRYScreenpW(5), 0, (double)(ScreenWidth/3)-LRYScreenpW(5), LRYScreenpH(126)) title:@"235" iconImage:nil backgroundImage:nil tag:10001 textColor:[UIColor blackColor]];
            [Resourcesbtn setBackgroundColor:[UIColor clearColor]];
            [Resourcesbtn.titleLabel setFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(21)]];
            
            UIButton *Attendancebtn =[self createBtn:CGRectMake(CGRectGetMaxX(Resourcesbtn.frame)+LRYScreenpW(5), 0, (double)(ScreenWidth/3), LRYScreenpH(126)) title:@"98%" iconImage:nil backgroundImage:nil tag:10002 textColor:[UIColor redColor]];
            [Attendancebtn setBackgroundColor:[UIColor clearColor]];
            [Attendancebtn.titleLabel setFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(21)]];
            
            [CellView addSubview:Errobtn];
            [CellView addSubview:Resourcesbtn];
            [CellView addSubview:Attendancebtn];
            
            
            
            UILabel *ErroLabe=[self createLabel:CGRectMake(0, Errobtn.frame.size.height-LRYScreenpH(30), (double)(ScreenWidth/3)-LRYScreenpW(5), LRYScreenpH(25)) title:@"错题" fontSize:13 textColor:YWQColor(143, 143, 143)];
            [ErroLabe setTextAlignment:NSTextAlignmentCenter];
           
            
            UILabel *ResourcesLabe=[self createLabel:CGRectMake(CGRectGetMaxX(Errobtn.frame)+LRYScreenpW(5), Errobtn.frame.size.height-LRYScreenpH(30), (double)(ScreenWidth/3)-LRYScreenpW(5), LRYScreenpH(25)) title:@"资源" fontSize:13 textColor:YWQColor(143, 143, 143)];
            [ResourcesLabe setTextAlignment:NSTextAlignmentCenter];
            [ResourcesLabe setFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(15)]];
            
            UILabel *AttendanceLabe=[self createLabel:CGRectMake(CGRectGetMaxX(Resourcesbtn.frame)+LRYScreenpW(5), Errobtn.frame.size.height-LRYScreenpH(30), (double)(ScreenWidth/3)-LRYScreenpW(5), LRYScreenpH(25)) title:@"出勤率" fontSize:13 textColor:YWQColor(143, 143, 143)];
            [AttendanceLabe setTextAlignment:NSTextAlignmentCenter];
           
            [CellView addSubview:ErroLabe];
            [CellView addSubview:ResourcesLabe];
            [CellView addSubview:AttendanceLabe];
            
            
            
            UILabel *line1=[self createLabel:CGRectMake(CGRectGetMaxX(Errobtn.frame)+LRYScreenpW(2), LRYScreenpH(10), LRYScreenpW(2), LRYScreenpH(106)) title:nil fontSize:nil textColor:nil];
            [line1 setBackgroundColor:YWQColor(242, 242, 242)];
            [CellView addSubview:line1];
            
            UILabel *line2=[self createLabel:CGRectMake(CGRectGetMaxX(Resourcesbtn.frame)+LRYScreenpW(2), LRYScreenpH(10), LRYScreenpW(2), LRYScreenpH(106)) title:nil fontSize:nil textColor:nil];
            [line2 setBackgroundColor:YWQColor(242, 242, 242)];
            [CellView addSubview:line2];
            
            
            
            
            [CellView setBackgroundColor:[UIColor whiteColor]];
        }
        CellView.selectionStyle=UITableViewCellSelectionStyleNone;
        
        return CellView;

    }
    else if(indexPath.section == 1)
    {
        static NSString *CellID0 = @"CellID0";
        UITableViewCell *CellView0 =[tableView dequeueReusableCellWithIdentifier:CellID0];
        if (CellView0 == nil)
        {
            
            CellView0 =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellID0];
            NSMutableArray *arry =[NSMutableArray arrayWithObjects:@"教学评价",@"疑难求助", nil];
            UILabel *evaluateLab = [self createLabel:CGRectMake(LRYScreenpW(40), 0, ScreenWidth-LRYScreenpW(80), LRYScreenpH(100)) title:arry[indexPath.row] fontSize:17 textColor:[UIColor blackColor]];
            [CellView0 addSubview:evaluateLab];
            
            if (indexPath.row == 0) {
                UILabel *line =[self createLabel:CGRectMake(LRYScreenpW(40), evaluateLab.frame.size.height-LRYScreenpH(3), ScreenWidth-LRYScreenpW(80), LRYScreenpH(1)) title:nil fontSize:0 textColor:YWQColor(242, 242, 242)];
                [line setBackgroundColor:YWQColor(242, 242, 242)];
                
                [CellView0 addSubview:line];
            }
            
            
            [CellView0 setBackgroundColor:[UIColor whiteColor]];
        }
        CellView0.selectionStyle=UITableViewCellSelectionStyleNone;
        
        return CellView0;

    }
    else{
        static NSString *CellID1 = @"CellID1";
        UITableViewCell *CellView1 =[tableView dequeueReusableCellWithIdentifier:CellID1];
        if (CellView1 == nil)
        {
            
            CellView1 =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellID1];
            
            UILabel *evaluateLab = [self createLabel:CGRectMake(LRYScreenpW(40), 0, ScreenWidth-LRYScreenpW(80), LRYScreenpH(100)) title:@"消息" fontSize:17 textColor:[UIColor blackColor]];
            [CellView1 addSubview:evaluateLab];
            
            [CellView1 setBackgroundColor:[UIColor whiteColor]];
        }
        CellView1.selectionStyle=UITableViewCellSelectionStyleNone;
        
        return CellView1;
    }
}
////区头视图
//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    UIView *headview =[[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, LRYScreenpH(100))];
//    [headview setBackgroundColor:[UIColor clearColor]];
//    UILabel *headLable = [[UILabel alloc]initWithFrame:CGRectMake(LRYScreenpW(40), LRYScreenpH(20), ScreenWidth, LRYScreenpH(80))];
//    [headLable setText:@"软件工程"];
//    [headLable setTextColor:MainColor];
//    [headLable setFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(21)]];
//    headLable.textAlignment = UITextAlignmentLeft;
//    [headLable setBackgroundColor:[UIColor whiteColor]];
//    
//    [headview addSubview:headLable];
//    
//    //    UILabel *line=[[UILabel alloc]initWithFrame:CGRectMake(0, headLable.frame.size.height, ScreenWidth, LRYScreenpH(1))];
//    //    [line setBackgroundColor:MainColor];
//    //    [headview addSubview:line];
//    return headview;
//    
//}
////区尾视图
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{


    UIView *footview =[[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, LRYScreenpH(18))];
    [footview setBackgroundColor:[UIColor clearColor]];

    return footview;
}


//#pragma mark--------被选中的row
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) {
        if (indexPath.row == 1) {
            ResourcesTeachLibVC *vc=[ResourcesTeachLibVC new];
            [[ViewManager shareInstance].NavigationController pushViewController:vc animated:YES];
        }
        else{
            ResourcesLibVC *vc =[ResourcesLibVC new];
            [[ViewManager shareInstance].NavigationController pushViewController:vc animated:YES];
            
        }
    }
    else  if(indexPath.section == 2){
        MyNews *vc =[MyNews new];
        [[ViewManager shareInstance].NavigationController pushViewController:vc animated:YES];
    }
    else{
        MyNews *vc =[MyNews new];
        [[ViewManager shareInstance].NavigationController pushViewController:vc animated:YES];
    }

}



@end
