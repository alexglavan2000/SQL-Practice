--The insert for this table doesn't work as an example
create table T1(
ID integer identity(1,1) primary key, 
Name varchar(15)
)

Insert into T1(ID,Name) Values(1,'Alex')

--First working table insert
create table T2(
ID integer primary key, 
Name varchar(15)
)

Insert into T2(ID,Name) Values(1,'Alex')

Select * from T2


--now T1 insert works
SET IDENTITY_INSERT T1 ON

Insert into T1(ID,Name) Values(1,'Alex')

Select * from T1

SET IDENTITY_INSERT T1 OFF

--figuring out how the truncate commnd works
Truncate table T1

--finding how to insert values without managing the primary key
Insert into T1(Name) Values('Virgil')

--working with sequences
create sequence SQ_T3 as int start with 1 increment by 1
drop sequence SQ_T3

create table T3(
ID integer primary key, 
Name varchar(15)
)

Insert into T3(ID,Name) Values(Next Value For SQ_T3,'Karina')

SELECT * FROM T3;   

--declaration experimentation
declare @var1 integer
set @var1=next value for SQ_T3

print @var1

delete from T3 where ID=-2147483648

--foreign key
create table T4(
ID integer primary key,
ID_T3 integer not null,
Age integer,
foreign key(ID_T3) references T3(ID)
)

drop table if exists T4

insert into T4 (ID,ID_T3,Age)
Values (1,1,10)

select * from T4

--joining
select * from T3,T4 where T3.ID = T4.ID_T3