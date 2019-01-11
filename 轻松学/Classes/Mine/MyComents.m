//
//  MyComents.m
//  公议
//
//  Created by Mr.Lin on 17/12/23.
//  Copyright © 2017年 Mr.Lin. All rights reserved.
//

#import "MyComents.h"
#import "SizeHeader.h"

@interface MyComents ()<UITableViewDelegate,UITableViewDataSource>
{

    int leftSize;
    int rightSize;
}
@property (nonatomic,strong) UITableView *tableview;
@end

@implementation MyComents

//_tableview只能在懒加载（）中实现  其他地方会出现死循环
//表格懒加载
-(UITableView *)tableview
{
    if (_tableview == nil)
    {
        _tableview =[[UITableView alloc]initWithFrame:CGRectMake(0, TopAndSystemHeight+LRYScreenpH(10), ScreenWidth, ScreenHeight-TopAndSystemHeight-LRYScreenpH(10)) style:UITableViewStylePlain];
        _tableview.backgroundColor=[UIColor whiteColor];
        _tableview.delegate =self;
        _tableview.dataSource=self;
        _tableview.estimatedRowHeight =100;//估计的高度
        _tableview.rowHeight = UITableViewAutomaticDimension;
        _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableview;
}


-(instancetype)init
{
    self =[super init];
    if (self)
    {
        
        
    }
    return self;
}



-(void)viewDidLoad
{
    [super viewDidLoad];
    
#pragma mark--------------电源栏字体颜色
//    [self.navigationController.navigationBar setBarStyle:UIBarStyleDefault];
    
    [self.view setBackgroundColor:YWQColor(242, 242, 242)];
    [self setTopTitle:@"疑难求助"];
    [self setTopBgColor:MainColor];
    [self setTopLineHide:YES];
    [self setTopTitleColor:[UIColor whiteColor]];

    [self.view addSubview:self.tableview];
    
}


#pragma mark--------tableview相关函数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(indexPath.row == 0)
    {
//
        static NSString *CellID = @"CellID";
        UITableViewCell *CellView =[tableView dequeueReusableCellWithIdentifier:CellID];
        if (CellView == nil)
        {
            CellView =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellID];
            CellView.backgroundColor = [UIColor whiteColor];
            //头像
            UIImageView *head = [[UIImageView alloc]initWithFrame:CGRectMake(17, 20, 50, 50)];
            head.tag = 1000;
            head.image = [UIImage imageNamed:@"wd_4"];
            head.layer.cornerRadius = CGRectGetWidth(head.frame)/2;
            head.layer.masksToBounds = YES;
            [CellView addSubview:head];
            
            leftSize = CGRectGetMaxX(head.frame)+20;
            
            //两个文本
            
            UILabel *name=[self createLabel:CGRectMake(CGRectGetMaxX(head.frame)+LRYScreenpW(20), CGRectGetMinY(head.frame)+LRYScreenpH(3), LRYScreenpW(200), LRYScreenpH(30)) title:@"庄大灰" fontSize:17 textColor:[UIColor blackColor]];
            name.tag = 1001;
            [CellView addSubview:name];
            
            
            
            UILabel *time =[self createLabel:CGRectMake(CGRectGetMaxX(head.frame)+LRYScreenpW(20), CGRectGetMaxY(name.frame)+LRYScreenpH(10),LRYScreenpW(200), LRYScreenpH(20)) title:@"2018年6月7日" fontSize:13 textColor:YWQColor(143, 143, 143)];
            time.tag = 1002;
            [CellView addSubview:time];
            
            
            
            UILabel *text=[self createLabel:CGRectMake(CGRectGetMaxX(head.frame)+LRYScreenpW(20), CGRectGetMaxY(time.frame)+LRYScreenpH(20), LRYScreenpW(500), LRYScreenpH(100)) title:@"老师，我觉得您上课可以多走动，多提问题，让我们在思考中学习" fontSize:15 textColor:[UIColor blackColor]];
            name.tag = 1004;
            text.lineBreakMode = UILineBreakModeWordWrap;
            text.numberOfLines = 0;
            [CellView addSubview:text];
            
            UIButton *commentBtn =[self createBtn:CGRectMake(CGRectGetMaxX(name.frame)+LRYScreenpW(320), CGRectGetMinY(head.frame), LRYScreenpW(20), LRYScreenpH(20)) title:nil iconImage:[UIImage imageNamed:@"wd-2"] backgroundImage:nil tag:10000 textColor:nil];
            commentBtn.tag = 1003;
            [CellView addSubview:commentBtn];
            
            rightSize = ScreenWidth-CGRectGetMinX(commentBtn.frame);
            
            
            
        }
        UIImageView *head = [CellView viewWithTag:1000];
        UIImageView *name = [CellView viewWithTag:1001];
        UIImageView *time = [CellView viewWithTag:1002];
        UIImageView *content = [CellView viewWithTag:1004];
        CellView.selectionStyle=UITableViewCellSelectionStyleNone;
        /*
         计算高度：
         拿到当前sention对应的数据内容：数组[indexpath.row]
         计算高度height
         content.frame = cgrectmake(x不变,y不变,width不变,height)
         */
        return CellView;
        
    }
   
    
    else
    {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell_two"];
        if (cell == nil)
        {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell_two"];
            cell.backgroundColor = [UIColor whiteColor];
            
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(leftSize, 0, ScreenWidth-leftSize-rightSize, 40)];
            label.textColor = YWQColor(181,181,181);
            NSMutableAttributedString *string = [[NSMutableAttributedString alloc]initWithString:@"陈老师:谢谢同学的意见"];
            [string addAttribute:NSForegroundColorAttributeName value:YWQColor(253, 122, 88) range:NSMakeRange(0, 3+1)];
            [label setFont:[UIFont systemFontOfSize:LRYsystemFontOfSize(13)]];
            label.attributedText = string;
            label.backgroundColor = YWQColor(245,245,245);
            [cell addSubview:label];
            
        }
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        //计算高度
        
        /*
         计算高度：
         拿到当前sention对应的数据内容：数组[indexpath.row]
         计算高度height
         content.frame = cgrectmake(x不变,y不变,width不变,height)
         */
        return cell;

    }
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row == 0)
    {
        /*
         先判断section：第几条数据的意思
         计算数据里面的内容高度height
         return height
         
         */
        return 120;
    }
    /*
     先判断section：第几条数据的意思
     计算数据里面的内容高度height
     return height
     
     */
    return 40;
}



-(void)btnAction:(UIButton *)btn
{
    
}



@end
