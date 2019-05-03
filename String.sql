SELECT * FROM TBLPERSON;

EXEC spGetTblPerson;

sp_help spGetTblPersonbyPattern;
sp_helptext spGetTblPersonbyPattern;
sp_depends spGetTblPersonbyPattern;
declare @b int, @c int;
exec spGetTblPersonbyPattern '_@%', @b out, @c out
print concat(cast(@b as varchar(255)), @c);
print @c; 



ALTER PROC spGetPersonsSalary
@AGE int
as 
begin
RETURN (SELECT SUM(AGE) FROM TBLPERSON WHERE AGE > @AGE);
END

DECLARE @SUMOFAGE INT;
EXEC @SUMOFAGE = spGetPersonsSalary 20;
PRINT @SUMOFAGE;


ALTER PROC spAllAlphabets
as
begin
DECLARE @NUM INT;
SET @NUM = 65;
WHILE (@NUM < 91)
BEGIN 
	SELECT CHAR(@NUM);
	SET @NUM = @NUM + 1;
END
END

EXEC spAllAlphabetS

SELECT LTRIM(' A');
SELECT RTRIM('A  ');

SELECT LEN('AKSHAT');
SELECT REVERSE('ASKAHT');
SELECT LOWER('AKSHAT');
SELECT UPPER('skah')

SELECT LEFT('AKSHAT',2)
SELECT RIGHT('AKSHAT', 2);

-- 1 IS STARTING POSTITION TO SEARCH FROM
SELECT CHARINDEX('S', 'AKSHAT',1)

-- 2 FROM INDEX AND FROM HOW MANY CHARACTERS
SELECT SUBSTRING('AKSHAT', 2,3)


--- SEARCH FROM @ AND NEXT;


DECLARE @STR VARCHAR(20);
SET @STR = 'ABCD@GMAIL.COM'
SELECT SUBSTRING(EMAIL ,CHARINDEX('@',EMAIL ,1),LEN(EMAIL)) AS DOMAIN FROM TBLPERSON GROUP BY  SUBSTRING(EMAIL ,CHARINDEX('@',EMAIL ,1),LEN(EMAIL))
INSERT INTO TBLPERSON VALUES ('RAJ','AA@AAA.COM',2,20,'LUCKNOW')

sp_depends TBLPERSON
alter table TBLPERSON add hiddenEmail varchar(255);

ALTER PROC dbo.spHideEmail
@addHideEmail bit
as 
begin 
if(@addHideEmail = 1)

update TBLPERSON set hiddenEmail = SUBSTRING(EMAIL,1,2) + REPLICATE('*',LEN(EMAIL) - LEN(SUBSTRING(EMAIL ,CHARINDEX('@',EMAIL ,1),LEN(EMAIL)))) + (SUBSTRING(EMAIL ,CHARINDEX('@',EMAIL ,1),LEN(EMAIL)))
WHERE LEN(SUBSTRING(EMAIL,1,(CHARINDEX('@',EMAIL,1))))> 2

update TBLPERSON set hiddenEmail = EMAIL
WHERE LEN(SUBSTRING(EMAIL,1,(CHARINDEX('@',EMAIL,1))))<= 2
END
SELECT LEN(SUBSTRING(EMAIL,1,(CHARINDEX('@',1,LEN(EMAIL))))) FROM TBLPERSON
update TBLPERSON set hiddenEmail = NULL
EXEC dbo.spHideEmail 1

select replace('akshat','a','b')
--- SEE ALSO 
--- PATIINDEX(EMAIL, '%@gmail.com,1), SPACE(5) ,stuff, replace(email, 'a','b')

SELECT * FROM TBLPERSON ;
/*
time 
date 
smalldatetime
datetime
datetime2
datetimeoffset
*/


