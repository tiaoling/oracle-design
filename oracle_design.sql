--创建表格语法: 

     create table 表名

( 

字段名1 字段类型(长度) 是否为空,
字段名2 字段类型        是否为空

);  

--增加主键
alter table 表名add constraint 主键名 primary key (字段名1); 

--增加外键: 
alter table 表名add constraint 外键名foreign key (字段名1) references 关联表(字段名2); 

--创建唯一索引
create unique index 列名 on 表名(列名);   
--唯一索引：不能插入相同的数据

--在建立表格时就指定主键和外键

 create table T_STU ( 

      STU_ID               char(5)                         not null, 

       STU_NAME             varchar2(8)                     not null, 

      constraint PK_T_STU primary key (STU_ID) 

); 

 

--主键和外键一起建立：
 
create table T_SCORE ( 

       EXAM_SCORE           number(5,2), 

       EXAM_DATE            date, 

        AUTOID               number(10)                      not null,

 

       STU_ID               char(5), 

       SUB_ID               char(3), 

       constraint PK_T_SCORE primary key (AUTOID), 

       constraint FK_T_SCORE_REFE foreign key (STU_ID) 

        references T_STU (STU_ID) 

) 

--创建表
 
create table classes( 

       id number(9) not null primary key, 

       classname varchar2(40) not null 

)       

--查询表，* 代表全部列，也可指定表内的某一列或多列[多列时以逗号分隔]
select * from 表名; 

--删除表
drop table 表名; 

--修改表的名称
rename 表名 to 新的表名; 

--显示表结构
describe 表名 

--增加列
alter table test add address varchar2(40); 

--删除列
alter table test drop column address; 

--修改列的名称
alter table test modify address addresses varchar(40; 

--修改列的属性
alter table 表名 modify 列名 类型(长度);


--给表添加注释
COMMENT ON TABLE 表名 IS '注释'; 

--给字段加注释
COMMENT ON COLUMN 列名 IS '注释'; 



--创建自增的序列

create sequence 序列名 increment by 1 start with 1 MAXVALUE 999999 

NOCYCLE NOCACHE; 

--查询 当前序列
select 序列名.currval from dual 

--查询下一个序列
select 序列名.nextval from dual 

--插入数据
INSERT INTO 表名 (列1, 列2,...) VALUES (值1, 值2,....);
commit; 

--更新数据
update 表名 set 列名='修改的值' where 条件; 
commit; 


--行锁：在新打开的对话中不能对此行进行操作
select * from 表名  where 条件 for update; --行锁



 

 

