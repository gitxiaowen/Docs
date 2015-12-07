/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2015/12/03 19:48:43                          */
/*==============================================================*/




/*==============================================================*/
/* Table: Admin                                                 */
/*==============================================================*/
create table Admin
(
   adminID              int not null,
   adminPwd             varchar(35),
   adminName            varchar(20)
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
   aID                  int not null,
   aTitle               varchar(40),
   aContent             mediumtext,
   aPublishDate         date,
   aAuthor              int(10),
   aType                int,
   aView                int,
   aUpvotes             int,
   aDownVotes           int
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
   tID                  int not null,
   tName                varchar(15),
   tfID                 int
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
   cID                  int not null,
   cTime                datetime,
   cArticleID           int,
   cUserID              int,
   cContet              mediumtext
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
   fID                  int not null,
   fUser                int,
   fDate                datetime,
   fContent             varchar(300),
   fAttach              mediumblob
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
   mID                  int,
   mReceiver            int(10),
   mTitle               varchar(100),
   mContent             mediumtext
);

alter table Message comment '创建日期：2015/10/22 

创建人：熊小文

表描述：私信表';

/*==============================================================*/
/* Table: SystemLog                                             */
/*==============================================================*/
create table SystemLog
(
   LogId                int not null,
   LogTime              datetime,
   LogContent           varchar(500),
   LogDesc              varchar(400)
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
   uID                  int(10) not null,
   uPassword            varchar(25),
   uName                char(13),
   uEmail               varchar(30),
   uPhone               char(11),
   uSex                 enum('保密','男','女'),
   uBirth               date,
   uWebsite             varchar(35),
   uCompany             varchar(50),
   uSignature           varchar(200),
   uPicture             mediumblob,
   uDegree              int,
   uAddr                varchar(200)
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

