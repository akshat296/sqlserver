create table Comp(
	id int primary key identity(1,1), name varchar(20), gamecode int,schoolcode int, branchcode int
);


create table gameComp( 
id int, name varchar(30)
);

create table schoolCode(
id int , name varchar(20)
); 

create table branchCode(
id int , name varchar(20)
); 




drop table comp;
drop table gamecomp;
drop table schoolcode;
drop table branchCode;

insert into Comp Values ('Thinksys',2,1,2),('TEst',3,5,5),('tcs',6,2,2),('dxc',2,3,9);
insert into GameComp values (1,'Chess'),(2,'Football'),(3,'Cricket');
insert into schoolCode values (1,'CMS'),(2,'DPS');
insert into branchcode values (1,'kanpur road'),(2,'gomti nagar');

select * from Comp;
select * from GameComp;
select * from  SchoolCode
select * from  branchcode;


select c.id, c.name, c.gamecode, c.schoolcode, c.branchcode, g.id,g.name as gameName,s.id,s.name as Schoolname, b.id,b.name as branchName from comp c 
left join gamecomp g on c.gamecode = g.id 
right join schoolcode s on s.id = c.schoolcode 
right join branchcode b on b.id = c.branchcode
where c.id is not null;

select DBO.charat();