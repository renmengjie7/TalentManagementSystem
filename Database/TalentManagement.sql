/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2021/1/11 9:40:37                            */
/*==============================================================*/


drop table if exists 企业;

drop table if exists 企业招聘;

drop table if exists 招聘结果;

drop table if exists 招聘记录;

drop table if exists 档案;

drop table if exists 用户;

drop table if exists 简历;

drop table if exists 考勤;

drop table if exists 职位;

drop table if exists 部门;

drop table if exists 雇佣;

/*==============================================================*/
/* Table: 企业                                                    */
/*==============================================================*/
create table 企业
(
   企业ID                 varchar(20) not null,
   企业logo               longblob,
   企业名称                 VBIN50 not null,
   企业简称                 varchar(20),
   企业电话                 char(20) not null,
   企业类型                 char(10) not null,
   所属行业                 char(10) not null,
   所在地区                 char(10) not null,
   详细地址                 char(50) not null,
   邮政编码                 varchar(6),
   传真                   char(10),
   网址                   char(256),
   成立时间                 date not null,
   资质证明                 longblob not null,
   通过验证                 bool,
   联系人                  varchar(20),
   primary key (企业ID)
);

/*==============================================================*/
/* Table: 企业招聘                                                  */
/*==============================================================*/
create table 企业招聘
(
   招聘ID                 varchar(20) not null,
   企业ID                 varchar(20),
   岗位方向                 varchar(20) not null,
   岗位描述                 char(100),
   岗位要求                 char(1024) not null,
   工资                   numeric(8,0),
   地区                   char(10) not null,
   招聘人数                 numeric(8,0) not null,
   招聘开始日期               date,
   招聘结束日期               date,
   primary key (招聘ID)
);

/*==============================================================*/
/* Table: 招聘结果                                                  */
/*==============================================================*/
create table 招聘结果
(
   招聘ID                 varchar(20) not null,
   用户ID                 varchar(20) not null,
   简历ID                 varchar(20),
   投递日期                 date,
   评语                   varchar(1024),
   结果                   bool,
   primary key (招聘ID, 用户ID)
);

/*==============================================================*/
/* Table: 招聘记录                                                  */
/*==============================================================*/
create table 招聘记录
(
   职工ID                 varchar(20) not null,
   招聘ID                 varchar(20) not null,
   primary key (职工ID, 招聘ID)
);

/*==============================================================*/
/* Table: 档案                                                    */
/*==============================================================*/
create table 档案
(
   职工ID                 varchar(20) not null,
   绩效                   char(1),
   有无重大为违纪              bool,
   重大违纪内容               varchar(500),
   评价                   varchar(1024),
   primary key (职工ID)
);

/*==============================================================*/
/* Table: 用户                                                    */
/*==============================================================*/
create table 用户
(
   用户ID                 varchar(20) not null,
   用户名                  char(10) not null,
   密码                   char(50) not null,
   注册时间                 date not null,
   身份证号                 char(18),
   性别                   char(1),
   姓名                   varchar(10),
   出生日期                 date,
   电话号码                 char(11) not null,
   邮箱                   varchar(50),
   就职状态                 bool,
   primary key (用户ID)
);

/*==============================================================*/
/* Table: 简历                                                    */
/*==============================================================*/
create table 简历
(
   简历ID                 varchar(20) not null,
   用户ID                 varchar(20),
   个人陈述                 varchar(200),
   应聘理由                 varchar(200),
   简历网址                 varchar(1024),
   primary key (简历ID)
);

/*==============================================================*/
/* Table: 考勤                                                    */
/*==============================================================*/
create table 考勤
(
   时间                   datetime not null,
   职工ID                 varchar(20) not null,
   考勤结果                 bool,
   primary key (时间)
);

/*==============================================================*/
/* Table: 职位                                                    */
/*==============================================================*/
create table 职位
(
   职位ID                 varchar(20) not null,
   部门ID                 varchar(20),
   职位名称                 varchar(20),
   职位权限                 numeric(1,0),
   primary key (职位ID)
);

/*==============================================================*/
/* Table: 部门                                                    */
/*==============================================================*/
create table 部门
(
   部门ID                 varchar(20) not null,
   企业ID                 varchar(20),
   部门名称                 varchar(20) not null,
   部门描述                 varchar(100),
   primary key (部门ID)
);

/*==============================================================*/
/* Table: 雇佣                                                    */
/*==============================================================*/
create table 雇佣
(
   职位ID                 varchar(20) not null,
   用户ID                 varchar(20) not null,
   雇佣开始时间               date not null,
   雇佣结束时间               date,
   结束理由                 varchar(200),
   工资                   numeric(8,0),
   职位权限                 numeric(1,0),
   职工ID                 varchar(20),
   primary key (职位ID, 用户ID)
);

alter table 企业招聘 add constraint FK_发布 foreign key (企业ID)
      references 企业 (企业ID) on delete restrict on update restrict;

alter table 招聘结果 add constraint FK_招聘结果 foreign key (招聘ID)
      references 企业招聘 (招聘ID) on delete restrict on update restrict;

alter table 招聘结果 add constraint FK_招聘结果 foreign key (用户ID)
      references 用户 (用户ID) on delete restrict on update restrict;

alter table 简历 add constraint FK_创建 foreign key (用户ID)
      references 用户 (用户ID) on delete restrict on update restrict;

alter table 职位 add constraint FK_拥有 foreign key (部门ID)
      references 部门 (部门ID) on delete restrict on update restrict;

alter table 部门 add constraint FK_拥有 foreign key (企业ID)
      references 企业 (企业ID) on delete restrict on update restrict;

alter table 雇佣 add constraint FK_雇佣 foreign key (用户ID)
      references 用户 (用户ID) on delete restrict on update restrict;

alter table 雇佣 add constraint FK_雇佣 foreign key (职位ID)
      references 职位 (职位ID) on delete restrict on update restrict;

