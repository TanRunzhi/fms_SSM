create database ffms default character set utf8;

use ffms;

drop table users;
drop table items;
drop table accounts;


create table users (
  id int primary key auto_increment,
  flag int default 1,
  name varchar(20),
  realname varchar(20),
  pwd varchar(10)
);

create table items (
  id int primary key auto_increment,
  flag int default 1,
  type int,
  name varchar(60),
  pid  int  references items(id)
);


create table accounts (
  id int  primary key auto_increment,
  flag int default 1,
  adate  date,
  amount decimal(10,2),
  remark varchar(100),
  user_id int references users(id),
  item_id int references items(id)
);
 
-- 插入数据

insert users(name,realname,pwd) values('zhang3','张山','123');
insert users(name,realname,pwd) values('li4','李世','123');
insert users(name,realname,pwd) values('wang5','王伍','123');

-- 插入父项目
insert into items(id,type,name) values(1,1,'薪水');
insert into items(id,type,name) values(2,1,'投资');
insert into items(id,type,name) values(3,1,'其它');

insert into items(id,type,name) values(4,2,'交通');
insert into items(id,type,name) values(5,2,'伙食');
insert into items(id,type,name) values(6,2,'其它');
--  薪水
--  工资
--  奖金
  insert into items(type,name,pid) values(1,'工资',1);
  insert into items(type,name,pid) values(1,'奖金',1);
-- 投资
  -- 利息
  -- 股息
  -- 基金
  insert into items(type,name,pid) values(1,'利息',2);
  insert into items(type,name,pid) values(1,'股息',2);
  insert into items(type,name,pid) values(1,'基金',2);
-- 其它
  -- 中奖
  insert into items(type,name,pid) values(1,'中奖',3);  




-- 交通
  -- 公共交通
  -- 油费
  -- 维护费
  insert into items(type,name,pid) values(2,'公共交通',4);
  insert into items(type,name,pid) values(2,'油费',4);
  insert into items(type,name,pid) values(2,'维护费',4);

-- 伙食
  -- 早餐
  -- 中餐
  -- 晚餐
  -- 水果
  -- 其它
  insert into items(type,name,pid) values(2,'早餐',5);
  insert into items(type,name,pid) values(2,'中餐',5);
  insert into items(type,name,pid) values(2,'晚餐',5);
  insert into items(type,name,pid) values(2,'水果',5);
  insert into items(type,name,pid) values(2,'其它',5);
-- 其它
  -- 物业费
  -- 房货
  -- 其它
  -- 礼品

  insert into items(type,name,pid) values(2,'物业费',6);
  insert into items(type,name,pid) values(2,'房货',6);
  insert into items(type,name,pid) values(2,'其它',6);
  insert into items(type,name,pid) values(2,'礼品',6);

  
  
  




-- 收入：
  -- 工资:
       insert into accounts(adate,amount,remark,user_id,item_id)
                       values('2016-1-10',10000,'',1,7);
       insert into accounts(adate,amount,remark,user_id,item_id)
                       values('2016-2-10',10000,'',1,7);
       insert into accounts(adate,amount,remark,user_id,item_id)
                       values('2016-3-10',10000,'',1,7);
       insert into accounts(adate,amount,remark,user_id,item_id)
                       values('2016-4-10',10000,'',1,7);
       insert into accounts(adate,amount,remark,user_id,item_id)
                       values('2016-5-10',10000,'',1,7);
       insert into accounts(adate,amount,remark,user_id,item_id)
                       values('2016-6-10',10000,'',1,7);
       insert into accounts(adate,amount,remark,user_id,item_id)
                       values('2016-1-10',8000,'',2,7);
       insert into accounts(adate,amount,remark,user_id,item_id)
                       values('2016-2-10',8000,'',2,7);
       insert into accounts(adate,amount,remark,user_id,item_id)
                       values('2016-3-10',8000,'',2,7);
       insert into accounts(adate,amount,remark,user_id,item_id)
                       values('2016-4-10',8000,'',2,7);
       insert into accounts(adate,amount,remark,user_id,item_id)
                       values('2016-5-10',8000,'',2,7);
       insert into accounts(adate,amount,remark,user_id,item_id)
                       values('2016-6-10',8000,'',2,7);
 -- 奖金:
       insert into accounts(adate,amount,remark,user_id,item_id)
                       values('2016-2-20',10000,'',1,8);
       insert into accounts(adate,amount,remark,user_id,item_id)
                       values('2016-2-26',8000,'',2,8);
  -- 中奖：
       insert into accounts(adate,amount,remark,user_id,item_id)
                       values('2016-3-2',10,'',2,12);
-- 支出：
   -- 油费，
    insert into accounts(adate,amount,remark,user_id,item_id)
                values('2016-1-31',800,'',1,14);
    insert into accounts(adate,amount,remark,user_id,item_id)
                values('2016-2-28',800,'',1,14);
    insert into accounts(adate,amount,remark,user_id,item_id)
                values('2016-3-31',800,'',1,14);
    insert into accounts(adate,amount,remark,user_id,item_id)
                values('2016-4-30',800,'',1,14);
    insert into accounts(adate,amount,remark,user_id,item_id)
                values('2016-5-31',800,'',1,14);
    insert into accounts(adate,amount,remark,user_id,item_id)
                values('2016-6-30',800,'',1,14);
-- 房货，

    insert into accounts(adate,amount,remark,user_id,item_id)
                values('2016-1-25',2800,'',1,20);
    insert into accounts(adate,amount,remark,user_id,item_id)
                values('2016-2-25',2800,'',1,20);
    insert into accounts(adate,amount,remark,user_id,item_id)
                values('2016-3-25',2800,'',1,20);
    insert into accounts(adate,amount,remark,user_id,item_id)
                values('2016-4-25',2800,'',1,20);
    insert into accounts(adate,amount,remark,user_id,item_id)
                values('2016-5-25',2800,'',1,20);
    insert into accounts(adate,amount,remark,user_id,item_id)
                values('2016-6-5',2800,'',1,20);
-- 礼品：
    insert into accounts(adate,amount,remark,user_id,item_id)
                values('2016-6-2',1000,'同学结婚',1,21);

