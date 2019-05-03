select * from TBLPERSON;

ALTER FUNCTION ADDAGE
(@CITY VARCHAR(10))
RETURNS INT
AS
BEGIN
DECLARE @NUM INT;
SELECT @NUM = COUNT(ID) FROM TBLPERSON WHERE CITY = @CITY;
RETURN @NUM
END;


SELECT DBO.ADDAGE('DELHI')

SELECT * FROM TBLPERSON;   


CREATE FUNCTION SELECTOR

(
	@city varchar(255)
)
returns table
as 
return select * from tblperson where city = @city;

select * FROM DBO.selector('DELHI') E JOIN TBLGENDER G ON E.GENDERID=G.ID;


--- WITH SCHEMABINDING HELP IN DEPENDENCIES SO IT WILL NOT BE DROPPED
DROP TABLE TBLPERSON
alter function multilinefunc(@city varchar(255))
returns @table table(name varchar(255),email varchar(255))
WITH SCHEMABINDING
as 
begin
insert into @table 
select name ,email from DBO.[tblperson] where city= @city;
return
end;


create index IX_ID on tblperson (ID);
DROP index IX_ID on tblperson 
sp_helpindex tblperson;


--- composite index has two or more columns

CREATE UNIQUE NONCLUSTERED INDEX UQ_NAME_EMAIL ON TBLPERSON(NAME,EMAIL);

sp_helpindex TBLPERSON;

-- YOU CANNOT DIRECTLY UPDATE VALUES IN MULTI VALUE FUNCTION

select * from multilinefunc('DELHI')