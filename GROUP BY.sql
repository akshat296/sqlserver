SELECT CITY, GENDERID, SUM(AGE) AS [TOTAL AGE], COUNT(ID) AS [TOTAL PERSON] 
FROM TBLPERSON 
GROUP BY GENDERID ,CITY 
HAVING GENDERID =2
ORDER BY GENDERID DESC;


-- AGGRIGATE FUNCTION ARE NOT USED IN WHERE CLAUSE, THEY ARE USED IN HAVING CLAUSE
SELECT * FROM TBLPERSON;


ALTER TABLE TBLPERSON ADD CITY VARCHAR(255);

UPDATE TBLPERSON SET CITY = 'DELHI' WHERE ID IN (4);