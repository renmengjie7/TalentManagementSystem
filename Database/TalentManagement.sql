/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2021/1/11 9:40:37                            */
/*==============================================================*/


drop table if exists ��ҵ;

drop table if exists ��ҵ��Ƹ;

drop table if exists ��Ƹ���;

drop table if exists ��Ƹ��¼;

drop table if exists ����;

drop table if exists �û�;

drop table if exists ����;

drop table if exists ����;

drop table if exists ְλ;

drop table if exists ����;

drop table if exists ��Ӷ;

/*==============================================================*/
/* Table: ��ҵ                                                    */
/*==============================================================*/
create table ��ҵ
(
   ��ҵID                 varchar(20) not null,
   ��ҵlogo               longblob,
   ��ҵ����                 VBIN50 not null,
   ��ҵ���                 varchar(20),
   ��ҵ�绰                 char(20) not null,
   ��ҵ����                 char(10) not null,
   ������ҵ                 char(10) not null,
   ���ڵ���                 char(10) not null,
   ��ϸ��ַ                 char(50) not null,
   ��������                 varchar(6),
   ����                   char(10),
   ��ַ                   char(256),
   ����ʱ��                 date not null,
   ����֤��                 longblob not null,
   ͨ����֤                 bool,
   ��ϵ��                  varchar(20),
   primary key (��ҵID)
);

/*==============================================================*/
/* Table: ��ҵ��Ƹ                                                  */
/*==============================================================*/
create table ��ҵ��Ƹ
(
   ��ƸID                 varchar(20) not null,
   ��ҵID                 varchar(20),
   ��λ����                 varchar(20) not null,
   ��λ����                 char(100),
   ��λҪ��                 char(1024) not null,
   ����                   numeric(8,0),
   ����                   char(10) not null,
   ��Ƹ����                 numeric(8,0) not null,
   ��Ƹ��ʼ����               date,
   ��Ƹ��������               date,
   primary key (��ƸID)
);

/*==============================================================*/
/* Table: ��Ƹ���                                                  */
/*==============================================================*/
create table ��Ƹ���
(
   ��ƸID                 varchar(20) not null,
   �û�ID                 varchar(20) not null,
   ����ID                 varchar(20),
   Ͷ������                 date,
   ����                   varchar(1024),
   ���                   bool,
   primary key (��ƸID, �û�ID)
);

/*==============================================================*/
/* Table: ��Ƹ��¼                                                  */
/*==============================================================*/
create table ��Ƹ��¼
(
   ְ��ID                 varchar(20) not null,
   ��ƸID                 varchar(20) not null,
   primary key (ְ��ID, ��ƸID)
);

/*==============================================================*/
/* Table: ����                                                    */
/*==============================================================*/
create table ����
(
   ְ��ID                 varchar(20) not null,
   ��Ч                   char(1),
   �����ش�ΪΥ��              bool,
   �ش�Υ������               varchar(500),
   ����                   varchar(1024),
   primary key (ְ��ID)
);

/*==============================================================*/
/* Table: �û�                                                    */
/*==============================================================*/
create table �û�
(
   �û�ID                 varchar(20) not null,
   �û���                  char(10) not null,
   ����                   char(50) not null,
   ע��ʱ��                 date not null,
   ���֤��                 char(18),
   �Ա�                   char(1),
   ����                   varchar(10),
   ��������                 date,
   �绰����                 char(11) not null,
   ����                   varchar(50),
   ��ְ״̬                 bool,
   primary key (�û�ID)
);

/*==============================================================*/
/* Table: ����                                                    */
/*==============================================================*/
create table ����
(
   ����ID                 varchar(20) not null,
   �û�ID                 varchar(20),
   ���˳���                 varchar(200),
   ӦƸ����                 varchar(200),
   ������ַ                 varchar(1024),
   primary key (����ID)
);

/*==============================================================*/
/* Table: ����                                                    */
/*==============================================================*/
create table ����
(
   ʱ��                   datetime not null,
   ְ��ID                 varchar(20) not null,
   ���ڽ��                 bool,
   primary key (ʱ��)
);

/*==============================================================*/
/* Table: ְλ                                                    */
/*==============================================================*/
create table ְλ
(
   ְλID                 varchar(20) not null,
   ����ID                 varchar(20),
   ְλ����                 varchar(20),
   ְλȨ��                 numeric(1,0),
   primary key (ְλID)
);

/*==============================================================*/
/* Table: ����                                                    */
/*==============================================================*/
create table ����
(
   ����ID                 varchar(20) not null,
   ��ҵID                 varchar(20),
   ��������                 varchar(20) not null,
   ��������                 varchar(100),
   primary key (����ID)
);

/*==============================================================*/
/* Table: ��Ӷ                                                    */
/*==============================================================*/
create table ��Ӷ
(
   ְλID                 varchar(20) not null,
   �û�ID                 varchar(20) not null,
   ��Ӷ��ʼʱ��               date not null,
   ��Ӷ����ʱ��               date,
   ��������                 varchar(200),
   ����                   numeric(8,0),
   ְλȨ��                 numeric(1,0),
   ְ��ID                 varchar(20),
   primary key (ְλID, �û�ID)
);

alter table ��ҵ��Ƹ add constraint FK_���� foreign key (��ҵID)
      references ��ҵ (��ҵID) on delete restrict on update restrict;

alter table ��Ƹ��� add constraint FK_��Ƹ��� foreign key (��ƸID)
      references ��ҵ��Ƹ (��ƸID) on delete restrict on update restrict;

alter table ��Ƹ��� add constraint FK_��Ƹ��� foreign key (�û�ID)
      references �û� (�û�ID) on delete restrict on update restrict;

alter table ���� add constraint FK_���� foreign key (�û�ID)
      references �û� (�û�ID) on delete restrict on update restrict;

alter table ְλ add constraint FK_ӵ�� foreign key (����ID)
      references ���� (����ID) on delete restrict on update restrict;

alter table ���� add constraint FK_ӵ�� foreign key (��ҵID)
      references ��ҵ (��ҵID) on delete restrict on update restrict;

alter table ��Ӷ add constraint FK_��Ӷ foreign key (�û�ID)
      references �û� (�û�ID) on delete restrict on update restrict;

alter table ��Ӷ add constraint FK_��Ӷ foreign key (ְλID)
      references ְλ (ְλID) on delete restrict on update restrict;

