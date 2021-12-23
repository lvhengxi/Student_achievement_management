/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2021/12/23 11:42:07                          */
/*==============================================================*/


drop table if exists class;

drop table if exists college;

drop table if exists crouse;

drop table if exists departments;

drop table if exists take;

drop table if exists user;

/*==============================================================*/
/* Table: class                                                 */
/*==============================================================*/
create table class
(
   class_id             char(20) not null,
   departments_id       char(20),
   name                 varchar(20),
   primary key (class_id)
);

/*==============================================================*/
/* Table: college                                               */
/*==============================================================*/
create table college
(
   college_id           char(20) not null,
   name                 varchar(20),
   primary key (college_id)
);

/*==============================================================*/
/* Table: crouse                                                */
/*==============================================================*/
create table crouse
(
   croue_id             char(20) not null,
   name                 varchar(20),
   primary key (croue_id)
);

/*==============================================================*/
/* Table: departments                                           */
/*==============================================================*/
create table departments
(
   departments_id       char(20) not null,
   college_id           char(20),
   name                 varchar(20),
   primary key (departments_id)
);

/*==============================================================*/
/* Table: take                                                  */
/*==============================================================*/
create table take
(
   student_id           char(20),
   croue_id             char(20),
   results              int
);

/*==============================================================*/
/* Table: user                                                  */
/*==============================================================*/
create table user
(
   student_id           char(20) not null,
   class_id             char(20),
   name                 varchar(5),
   sex                  char(20),
   password             char(20),
   admin                bool,
   primary key (student_id)
);

alter table class add constraint FK_Reference_2 foreign key (departments_id)
      references departments (departments_id) on delete restrict on update restrict;

alter table departments add constraint FK_Reference_3 foreign key (college_id)
      references college (college_id) on delete restrict on update restrict;

alter table take add constraint FK_Reference_4 foreign key (student_id)
      references user (student_id) on delete restrict on update restrict;

alter table take add constraint FK_Reference_5 foreign key (croue_id)
      references crouse (croue_id) on delete restrict on update restrict;

alter table user add constraint FK_Reference_1 foreign key (class_id)
      references class (class_id) on delete restrict on update restrict;

