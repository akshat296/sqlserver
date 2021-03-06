SELECT NAME,EMAIL,CITY, 
RANK() OVER (PARTITION BY GENDERID ORDER BY CITY) AS [RANK], 
DENSE_RANK() OVER (PARTITION BY GENDERID  ORDER BY CITY) AS [DENSE RANK] FROM TBLPERSON;



SELECT * from TBLPERSON;

WITH RESULT AS (
	SELECT GENDERID, DENSE_RANK() OVER (PARTITION BY GENDERID ORDER BY CITY) AS CITYRANKBYNAME FROM TBLPERSON
)
SELECT TOP 1 * FROM RESULT WHERE CITYRANKBYNAME =2
SELECT * FROM TBLPERSON;

INSERT INTO TBLPERSON VALUES('TALENT',  NULL, NULL, 4);


SELECT NAME, [ASL],EMAI FROM TBLPERSON 
UNPIVOT
(
	[ASL] FOR EMAI IN (TBLPERSON.AGE,TBLPERSON.CITY )

) AS TEET