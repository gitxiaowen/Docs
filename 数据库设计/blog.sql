/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2015/12/15 21:23:00                          */
/*==============================================================*/


/*==============================================================*/
/* Table: Admin                                                 */
/*==============================================================*/
create table Admin
(
   adminID              int not null comment '管理员ID',
   adminPwd             varchar(35) comment '管理员密码',
   adminName            varchar(20) comment '用户名'
);

alter table Admin comment '创建时间：

创建人：

表描述：管理员表

备';

alter table Admin
   add primary key (adminID);

/*==============================================================*/
/* Table: Article                                               */
/*==============================================================*/
create table Article
(
   aID                  int not null comment '文章ID',
   aTitle               varchar(40) comment '文章标题',
   aContent             mediumtext comment '文章内容',
   aPublishDate         date comment '发布日期',
   aAuthor              int(10) comment '作者',
   aType                int comment '类型ID',
   aView                int comment '阅读次数',
   aUpvotes             int comment '赞数',
   aDownVotes           int comment '踩数',
   aIP                  varchar(25) comment '作者IP'
);

alter table Article comment '创建日期：2015/10/22 

创建人：熊小文

表描述：文章表
                            ';

alter table Article
   add primary key (aID);

/*==============================================================*/
/* Table: AticleType                                            */
/*==============================================================*/
create table AticleType
(
   tID                  int not null comment '类型ID',
   tName                varchar(15) comment '类型名称',
   tfID                 int comment '父类ID'
);

alter table AticleType comment '创建时间: 2015年12月2日10:59:13

创建人:熊小文

表';

alter table AticleType
   add primary key (tID);

/*==============================================================*/
/* Table: Comment                                               */
/*==============================================================*/
create table Comment
(
   cID                  int not null comment '评论ID',
   cTime                datetime comment '评论时间',
   cArticleID           int comment '文章ID',
   cUserID              int comment '用户ID',
   cContet              mediumtext comment '回复内容'
);

alter table Comment comment '创建日期：2015/10/22 

创建人：熊小文

表描述：评论信息';

alter table Comment
   add primary key (cID);

/*==============================================================*/
/* Table: Feedback                                              */
/*==============================================================*/
create table Feedback
(
   fID                  int not null comment '反馈ID',
   fUser                int comment '反馈人',
   fDate                datetime comment '反馈时间',
   fContent             varchar(300) comment '反馈内容',
   fAttach              mediumblob comment '附件'
);

alter table Feedback comment '创建时间:2015年12月2日11:06:55

创建人:熊小文

表描';

alter table Feedback
   add primary key (fID);

/*==============================================================*/
/* Table: Message                                               */
/*==============================================================*/
create table Message
(
   mID                  int comment '私信ID',
   mReceiver            int(10) comment '收信人',
   mTitle               varchar(100) comment '标题',
   mContent             mediumtext comment '内容'
);

alter table Message comment '创建日期：2015/10/22 

创建人：熊小文

表描述：私信表';

/*==============================================================*/
/* Table: SystemLog                                             */
/*==============================================================*/
create table SystemLog
(
   LogId                int not null comment '日志Id',
   LogTime              datetime comment '日志时间',
   LogContent           varchar(500) comment '日志内容',
   LogDesc              varchar(400) comment '原因描述'
);

alter table SystemLog comment '创建时间：2015年12月2日11:02:44

创建人：熊小文

表描';

alter table SystemLog
   add primary key (LogId);

/*==============================================================*/
/* Table: User                                                  */
/*==============================================================*/
create table User
(
   uID                  int(10) not null comment '用户ID',
   uPassword            varchar(25) comment '密码',
   uName                char(13) comment '用户名',
   uEmail               varchar(30) comment '用户邮箱',
   uPhone               char(11) comment '手机号',
   uSex                 enum('保密','男','女') comment '性别',
   uBirth               date comment '生日',
   uWebsite             varchar(35) comment '个人网址',
   uCompany             varchar(50) comment '公司',
   uSignature           varchar(200) comment '个性签名',
   uPicture             mediumblob comment '头像',
   uDegree              int comment '等级',
   uAddr                varchar(200) comment '地址'
);

alter table User comment '创建日期：2015/10/22 

创建人：熊小文

表描述：用户信息表';

alter table User
   add primary key (uID);

alter table Article add constraint FK_Reference_7 foreign key (aType)
      references AticleType (tID) on delete restrict on update restrict;

alter table Article add constraint FK_article_ref_user foreign key (aAuthor)
      references User (uID) on delete restrict on update restrict;

alter table Comment add constraint FK_comment_ref_article foreign key (cArticleID)
      references Article (aID) on delete restrict on update restrict;

alter table Comment add constraint FK_comment_ref_user_ foreign key (cUserID)
      references User (uID) on delete restrict on update restrict;

alter table Feedback add constraint FK_Reference_6 foreign key (fUser)
      references User (uID) on delete restrict on update restrict;

alter table Message add constraint FK_msg_ref_user_receiver foreign key (mReceiver)
      references User (uID) on delete restrict on update restrict;

