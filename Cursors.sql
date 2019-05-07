
declare @id int;
declare @name varchar(255);
declare @genderid int;
declare @email varchar(255);
declare @age int;
declare @city varchar(255);
declare @hiddenEmail varchar(255);
declare emp cursor
static for
select * from [Employee].[dbo].[TBLPERSON]
open emp
if @@CURSOR_ROWS > 0
fetch next from emp into @id, @name,@email,@genderid,@age,@city,@hiddenEmail;
	begin
		while @@FETCH_STATUS = 0
		begin
		if @name = 'Shubham'
		print cast(@id+1 as varchar(255)) + ' ' + @name;
		fetch next from emp into @id, @name,@email,@genderid,@age,@city,@hiddenEmail;
		end
end
close emp;
DEALLOCATE emp
