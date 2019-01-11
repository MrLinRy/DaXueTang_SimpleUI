//
//  ViewController.m
//  QQ自动回复
//
//  Created by MrLin on 15/12/7.
//  Copyright © 2015年 gdd. All rights reserved.
//

#import "ChatVController.h"
#import "messModel.h"
#import "modelFrame.h"
#import "CustomTableViewCell.h"
@interface ChatVController ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
@property (strong, nonatomic) UITableView *customTableView;
@property (strong, nonatomic) UITextField *inputMess;
@property (strong, nonatomic) UIView *bgView;


@property (nonatomic,strong)NSMutableArray *arrModelData;
@end
@implementation ChatVController


-(NSMutableArray *)arrModelData{
    if (_arrModelData==nil) {
        _arrModelData=[NSMutableArray array];
    }
    return _arrModelData;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTopTitle:@"课程"];
    [self setTopTitleColor:[UIColor whiteColor]];

    [self.view setBackgroundColor:MainColor];
    
    
    
    
//    
//    [self someSet];
    
    UIView *BgView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [BgView setBackgroundColor:[UIColor colorWithRed:222.0/255.0f green:222.0/255.0f blue:221.0/255.0f alpha:1.0f]];
    self.customTableView =[[UITableView alloc]initWithFrame:CGRectMake(0, TopAndSystemHeight, ScreenWidth,ScreenHeight- LRYScreenpH(80)-TopAndSystemHeight)];
    self.customTableView.delegate=self;
    self.customTableView.dataSource=self;
    [self.customTableView setBackgroundView:BgView];
    [self.customTableView setTableFooterView:[[UIView alloc]initWithFrame:CGRectZero]];
    [self.customTableView setShowsVerticalScrollIndicator:NO];
    self.customTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.customTableView];
    
    
    
   
    
    
    
    
    self.inputMess =[[UITextField alloc]initWithFrame:CGRectMake(LRYScreenpW(20), ScreenHeight-LRYScreenpH(70), ScreenWidth-LRYScreenpW(100), LRYScreenpH(50))];
    [self.inputMess setBackgroundColor:[UIColor whiteColor]];
    [self.inputMess.layer setMasksToBounds:YES];
    [self.inputMess.layer setCornerRadius:10];
    self.inputMess.delegate=self;//设置UITextField的代理
    self.inputMess.returnKeyType=UIReturnKeySend;//更改返回键的文字 (或者在sroryBoard中的,选中UITextField,对return key更改)
    self.inputMess.clearButtonMode=UITextFieldViewModeWhileEditing;
    [self.view addSubview:self.inputMess];
    
    UIButton *sendBtn=[self createBtn:CGRectMake(CGRectGetMaxX(self.inputMess.frame)+LRYScreenpW(15), CGRectGetMinY(self.inputMess.frame), LRYScreenpW(50), LRYScreenpH(50)) title:nil iconImage:[UIImage imageNamed:@"sy_34"] backgroundImage:nil tag:10000 textColor:nil];
    [sendBtn setBackgroundColor:[UIColor clearColor]];
    [sendBtn addTarget:self action:@selector(sendAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sendBtn];

    
    
    // 监听键盘出现的出现和消失
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    [self messModelArr];
}

#pragma mark 得到Cell上面的Frame的模型
-(void)messModelArr{
    NSString *strPath=[[NSBundle mainBundle]pathForResource:@"dataPlist.plist" ofType:nil];//得到Plist文件里面的数据
    NSArray *arrData=[NSArray arrayWithContentsOfFile:strPath];
    for (NSDictionary *dicData in arrData) {
        messModel *model=[[messModel alloc]initWithModel:dicData]; //将数据转为模型
        
        BOOL isEquel;
        if(self.arrModelData){
            isEquel=[self timeIsEqual:model.time];//判断上一个模型数据里面的时间是否和现在的时间相等
        }
        modelFrame *frameModel=[[modelFrame alloc]initWithFrameModel:model timeIsEqual:isEquel];//将模型里面的数据转为Frame,并且判断时间是否相等
        [self.arrModelData addObject:frameModel];//添加Frame的模型到数组里面
    }
}
#pragma mark  -TableView的DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrModelData.count;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    modelFrame *frameModel=self.arrModelData[indexPath.row];
    return frameModel.cellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *strId=@"cellId";
    CustomTableViewCell *customCell=[tableView dequeueReusableCellWithIdentifier:strId];
    if (customCell==nil) {
        customCell=[[CustomTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strId];
    }
    [customCell setBackgroundColor:[UIColor colorWithRed:222.0/255.0f green:222.0/255.0f blue:221.0/255.0f alpha:1.0f]];
    customCell.selectionStyle=UITableViewCellSelectionStyleNone;
    customCell.frameModel=self.arrModelData[indexPath.row];
    return customCell;    
}

#pragma mark 键盘将要出现
-(void)keyboardWillShow:(NSNotification *)notifa{
    [self dealKeyboardFrame:notifa];
}
#pragma mark 键盘消失完毕
-(void)keyboardWillHide:(NSNotification *)notifa{
    [self dealKeyboardFrame:notifa];
}
#pragma mark 处理键盘的位置
-(void)dealKeyboardFrame:(NSNotification *)changeMess{
    NSDictionary *dicMess=changeMess.userInfo;//键盘改变的所有信息
    CGFloat changeTime=[dicMess[@"UIKeyboardAnimationDurationUserInfoKey"] floatValue];//通过userInfo 这个字典得到对得到相应的信息//0.25秒后消失键盘
    CGFloat keyboardMoveY=[dicMess[UIKeyboardFrameEndUserInfoKey]CGRectValue].origin.y-[UIScreen mainScreen].bounds.size.height;//键盘Y值的改变(字典里面的键UIKeyboardFrameEndUserInfoKey对应的值-屏幕自己的高度)
    [UIView animateWithDuration:changeTime animations:^{ //0.25秒之后改变tableView和bgView的Y轴
        self.customTableView.transform=CGAffineTransformMakeTranslation(0, keyboardMoveY);
        self.bgView.transform=CGAffineTransformMakeTranslation(0, keyboardMoveY);
        
    }];
    NSIndexPath *path=[NSIndexPath indexPathForItem:self.arrModelData.count-1 inSection:0];
    [self.customTableView scrollToRowAtIndexPath:path atScrollPosition:UITableViewScrollPositionNone animated:YES];//将tableView的行滚到最下面的一行
}
#pragma mark 滚动TableView去除键盘
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self.inputMess resignFirstResponder];
}
#pragma mark TextField的Delegate send后的操作
- (BOOL)textFieldShouldReturn:(UITextField *)textField{  //
    [self sendMess:textField.text]; //发送信息
    return YES;
}
- (void)sendAction:(UIButton *)sender {
    [self sendMess:self.inputMess.text]; //发送信息
}
#pragma mark 发送消息,刷新数据
-(void)sendMess:(NSString *)messValues{
    //添加一个数据模型(并且刷新表)
    //获取当前的时间
    NSDate *nowdate=[NSDate date];
    NSDateFormatter *forMatter=[[NSDateFormatter alloc]init];
    forMatter.dateFormat=@"HH:mm"; //小时和分钟
    NSString *nowTime=[forMatter stringFromDate:nowdate];
    
    NSMutableDictionary *dicValues=[NSMutableDictionary dictionary];
    dicValues[@"imageName"]=@"wd_4";
    dicValues[@"desc"]=messValues;
    dicValues[@"time"]=nowTime; //当前的时间
    dicValues[@"person"]=[NSNumber numberWithBool:0]; //转为Bool类型
    messModel *mess=[[messModel alloc]initWithModel:dicValues];
    modelFrame *frameModel=[modelFrame modelFrame:mess timeIsEqual:[self timeIsEqual:nowTime]]; //判断前后时候是否一致
    [self.arrModelData addObject:frameModel];
    [self.customTableView reloadData];
    
    self.inputMess.text=nil;
    
    //自动回复就是再次添加一个frame模型
    NSArray *arrayAutoData=@[@"软件工具时用来辅助软件开发，运行，维护，管理，支持等过程中的活动的软件。",@"是指再逆向工程所获信息的基础上修改或重构已有的系统，产生系统的一个新版本。",@"因为难以跟踪软件版本的进化过程和创建过程，以及难以读懂他人的程序和软件人员流动性大等因素。",@"包括制定计划，建立组织，配备人员，协调和追踪与指导，控制和检验，总结这六个方面。",@"软件需求说明书，数据要求说明书，概要设计说明书，详细设计说明说，可行性研究报告。",@"包括时间复杂度和空间复杂度。"];
    //添加自动回复的
    int num= arc4random() %(arrayAutoData.count); //获取数组中的随机数(数组的下标)
    
    
    //    NSLog(@"得到的时间是:%@",nowdate);
    NSMutableDictionary *dicAuto=[NSMutableDictionary dictionary];
    dicAuto[@"imageName"]=@"wd_man";
    dicAuto[@"desc"]=[arrayAutoData objectAtIndex:num];
    dicAuto[@"time"]=nowTime;
    dicAuto[@"person"]=[NSNumber numberWithBool:1]; //转为Bool类型
    messModel *messAuto=[[messModel alloc]initWithModel:dicAuto];
    modelFrame *frameModelAuto=[modelFrame modelFrame:messAuto timeIsEqual:[self timeIsEqual:nowTime]];//判断前后时候是否一致
    [self.arrModelData addObject:frameModelAuto];
    [self.customTableView reloadData];
    
    NSIndexPath *path=[NSIndexPath indexPathForItem:self.arrModelData.count-1 inSection:0];
    [self.customTableView scrollToRowAtIndexPath:path atScrollPosition:UITableViewScrollPositionNone animated:YES];
}

#pragma mark 判断前后时间是否一致
-(BOOL)timeIsEqual:(NSString *)comStrTime{
    modelFrame *frame=[self.arrModelData lastObject];
    NSString *strTime=frame.dataModel.time; //frame模型里面的NSString时间
    if ([strTime isEqualToString:comStrTime]) { //比较2个时间是否相等
        return YES;
    }
    return NO;
}
@end
