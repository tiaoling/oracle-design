# oracle-design
oracle规范
===================================
###  数据库中对象：表、视图、索引、序列、同义词等。
		表：基本的数据存储的集合,由行与列组成
		视图：从表中抽出的逻辑上相关的数据集合。
		序列: 提供有规律的数值
		索引：提高查询效率
		同义词：给对象起的别名。

###  Schema（无论什么语句需在表名前加上相应的Schema）
		chema为数据库对象的集合，为了区分各个集合，我们需要给这个集合起个名字，
		这些名字就是我们在企业管理器的方案下看到的许多类似用户名的节点，
		这些类似用户名的节点其实就是一个schema，schema里面包含了各种对象如tables,
		views, sequences, stored procedures, synonyms, indexes, clusters, 
		and database links。
		一个用户一般对应一个schema,该用户的schema名等于用户名，并作为该用户缺省schema。
		这也就是我们在企业管理器的方案下看到schema名都为数据库用户名的原因。
		最简单的理解：以你计算机的用户为例，如果你的计算机有3个用户，
		             那么每个用户登录系统看到的（使用的）功能是可以不相同的！

###  Oracle表名和列名的命名规范。
		1.必须以字母开头
		2.必须在 1–30 个字符之间
		3.必须只能包含 A–Z, a–z, 0–9, _, $, 和 #
		4.必须不能和用户定义的其他对象重名 
		5.必须不能是Oracle 的保留字
		注：如多个单词组成以(_)下划线分隔。

###  常用数据类型。
		VARCHAR2(长度)	可变长字符数据
		CHAR(长度)  	定长字符数据
		NUMBER(长度,精度)可变长数值数据
		DATE 	        日期型数据
		LONG 	        可变长字符数据，最大可达到2G
		CLOB	        字符数据，最大可达到4G
		RAW (LONG RAW) 	原始的二进制数据
		BLOB	        二进制数据，最大可达到4G 
		BFILE	        存储外部文件的二进制数据，最大可达到4G 
		ROWID	        行地址

###  创建表的语法
		create table 表名
		( 
		字段名1 字段类型(长度)  是否为空,
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

###  序列操作
		--创建自增的序列
		create sequence 序列名 increment by 1 start with 1 MAXVALUE 999999 
		NOCYCLE NOCACHE; 

		--查询 当前序列
		select 序列名.currval from dual 

		--查询下一个序列
		select 序列名.nextval from dual 

###  操作语句
		--插入数据
		INSERT INTO 表名 (列1, 列2,...) VALUES (值1, 值2,....);
		commit; 

		--更新数据
		update 表名 set 列名='修改的值' where 条件; 
		commit; 
		
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
		
		--行锁：在新打开的对话中不能对此行进行操作
		select * from 表名  where 条件 for update; --行锁




		
	

