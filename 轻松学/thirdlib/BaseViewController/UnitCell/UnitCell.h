//
//  UnitCell.h
//  轻松学学生端
//
//  Created by 游文琴 on 2017/12/8.
//  Copyright © 2017年 游文琴. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@interface UnitCell : NSObject

@end

@interface SuccessModel:JSONModel

@property (nonatomic,strong) NSString <Optional>*code;
@property (nonatomic,strong) NSDictionary <Optional>*data;



@end

@interface RegiseterSuccessModel:JSONModel


@property (nonatomic,strong) NSDictionary <Optional>*data;
@property (nonatomic,strong) NSString <Optional>*error_code;


@end




@interface DataModel:JSONModel

@property (nonatomic,strong) NSString <Optional>*IMGROOT;
@property (nonatomic,strong) NSDictionary <Optional>*classs;
@property (nonatomic,strong) NSDictionary <Optional>*school;
@property (nonatomic,strong) NSDictionary <Optional>*student;
@property (nonatomic,strong) NSDictionary <Optional>*user;
@property (nonatomic,strong) NSString <Optional>*token;


@end


@interface ClasssModel:JSONModel

@property (nonatomic,strong) NSString <Optional>*alias;
@property (nonatomic,strong) NSString <Optional>*attestation;
@property (nonatomic,strong) NSString <Optional>*blurb;
@property (nonatomic,strong) NSString <Optional>*class_type;
@property (nonatomic,strong) NSString <Optional>*code;
@property (nonatomic,strong) NSString <Optional>*create_date;
@property (nonatomic,strong) NSString <Optional>*grade;
@property (nonatomic,strong) NSString <Optional>*grade_name;
@property (nonatomic,strong) NSString <Optional>*head;
@property (nonatomic,strong) NSString <Optional>*Myid;
@property (nonatomic,strong) NSString <Optional>*invite_code;
@property (nonatomic,strong) NSString <Optional>*modify_date;
@property (nonatomic,strong) NSString <Optional>*name;
@property (nonatomic,strong) NSString <Optional>*school_id;
@property (nonatomic,strong) NSString <Optional>*status;
@property (nonatomic,strong) NSString <Optional>*year;




@end



@interface SchoolModel:JSONModel


@property (nonatomic,strong) NSString <Optional>*address;
@property (nonatomic,strong) NSString <Optional>*city;
@property (nonatomic,strong) NSString <Optional>*code;
@property (nonatomic,strong) NSString <Optional>*county;
@property (nonatomic,strong) NSString <Optional>*create_date;
@property (nonatomic,strong) NSString <Optional>*etension_code;
@property (nonatomic,strong) NSString <Optional>*fullname;
@property (nonatomic,strong) NSString <Optional>*SchooolId;
@property (nonatomic,strong) NSString <Optional>*is_etension;
@property (nonatomic,strong) NSString <Optional>*level;
@property (nonatomic,strong) NSString <Optional>*modify_date;
@property (nonatomic,strong) NSString <Optional>*name;
@property (nonatomic,strong) NSString <Optional>*phone;
@property (nonatomic,strong) NSString <Optional>*principal;
@property (nonatomic,strong) NSString <Optional>*region_code;
@property (nonatomic,strong) NSString <Optional>*status;
@property (nonatomic,strong) NSString <Optional>*trial_code;
@property (nonatomic,strong) NSString <Optional>*type;
@property (nonatomic,strong) NSString <Optional>*url;
@property (nonatomic,strong) NSString <Optional>*zone;


@end



@interface StudentModel:JSONModel


@property (nonatomic,strong) NSString <Optional>*account;
@property (nonatomic,strong) NSString <Optional>*address;
@property (nonatomic,strong) NSString <Optional>*birthday;
@property (nonatomic,strong) NSString <Optional>*code;
@property (nonatomic,strong) NSString <Optional>*create_date;
@property (nonatomic,strong) NSString <Optional>*email;
@property (nonatomic,strong) NSString <Optional>*head;
@property (nonatomic,strong) NSString <Optional>*StudentId;
@property (nonatomic,strong) NSString <Optional>*modify_date;
@property (nonatomic,strong) NSString <Optional>*name;
@property (nonatomic,strong) NSString <Optional>*password;
@property (nonatomic,strong) NSString <Optional>*phone;
@property (nonatomic,strong) NSString <Optional>*qq;
@property (nonatomic,strong) NSString <Optional>*remarks;
@property (nonatomic,strong) NSString <Optional>*sex;
@property (nonatomic,strong) NSString <Optional>*status;
@property (nonatomic,strong) NSString <Optional>*wechat;


@end


@interface UserModel:JSONModel


@property (nonatomic,strong) NSString <Optional>*account;
@property (nonatomic,strong) NSString <Optional>*address;
@property (nonatomic,strong) NSString <Optional>*birthday;
@property (nonatomic,strong) NSString <Optional>*classs_id;
@property (nonatomic,strong) NSString <Optional>*create_date;
@property (nonatomic,strong) NSString <Optional>*email;
@property (nonatomic,strong) NSString <Optional>*head;
@property (nonatomic,strong) NSString <Optional>*UserId;
@property (nonatomic,strong) NSString <Optional>*modify_date;
@property (nonatomic,strong) NSString <Optional>*name;
@property (nonatomic,strong) NSString <Optional>*nexus;
@property (nonatomic,strong) NSString <Optional>*password;
@property (nonatomic,strong) NSString <Optional>*phone;
@property (nonatomic,strong) NSString <Optional>*qq;
@property (nonatomic,strong) NSString <Optional>*remarks;
@property (nonatomic,strong) NSString <Optional>*sex;
@property (nonatomic,strong) NSString <Optional>*status;
@property (nonatomic,strong) NSString <Optional>*student_id;
@property (nonatomic,strong) NSString <Optional>*wechat;


@end

@interface YanZhengUserModel:JSONModel

@property (nonatomic,strong) NSString <Optional>*MyId;
@property (nonatomic,strong) NSString <Optional>*phone;
@property (nonatomic,strong) NSString <Optional>*account;
@property (nonatomic,strong) NSString <Optional>*code;
@property (nonatomic,strong) NSString <Optional>*password;

@end

@interface FinishRegisterModel:JSONModel

@property (nonatomic,strong) NSString <Optional>*uid;
@property (nonatomic,strong) NSString <Optional>*username;
@property (nonatomic,strong) NSString <Optional>*name;
@property (nonatomic,strong) NSString <Optional>*groupid;
@property (nonatomic,strong) NSString <Optional>*reg_time;
@property (nonatomic,strong) NSString <Optional>*last_login_time;


@end


