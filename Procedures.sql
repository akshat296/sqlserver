CREATE PROC spGetTblPerson
as 
begin 
select * from tblPerson;
end;

exec spGetTblPerson;

exec sp_depends spGetTblPersonbyCityandAge;


exec sp_help spGetTblPersonbyCityandAge;
exec sp_helptext spGetTblPersonbyCityandAge;
ALTER PROC spGetTblPersonbyCityandAge
@City varchar(255),
@age int
WITH ENCRYPTION
as 
begin
select * from tblPerson where city = @City and age > @age;
end;


ALTER PROC spGetTblPersonbyPattern 
@pattern varchar(255),
@persons int output,
@sum int output
as 
begin
select @persons = count(id) from tblPerson where email like @pattern;
select @sum = sum(age) from tblperson;
end;

declare @ab int
exec @ab =  spGetTblPersonbyCityandAge 'DELHI',3;
print @ab;


declare @personWithPattern varchar(255), @sumer int;

	 exec spGetTblPersonbyPattern '_@%', @personWithPattern out,@sumer out;
print @personWithPattern;
 print  @sumer;


sp_helptext spGetTblPersonbyCityandAge