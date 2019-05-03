create view vwGetNameandEmail
as 
select Name, Email from tblPerson;

 update vwGetNameandEmail set name ='Pikachu' where email ='a@gmail.com';
 select * from vwGetNameandEmail;

 select * from TBLPERSON;

 select case when name='Pikachu' then email else null end from vwGetNameandEmail;
 


 CREATE VIEW veGetGenderandName
 as 
 Select TblPerson.Name as [Person Name], TBLGENDER.Name as [Gender] from tblperson join TBLGENDER on TBLPERSON.GENDERID = TBLGENDER.ID;

 select * from veGetGenderandName ;

 select * from tblperson;
 select * from TBLGENDER;


 update veGetGenderandName set Gender = 'Idk' where [Person Name] = 'Badri'


 insert into tblperson values ('Badri','bb@gmail.com', 3,35,'DELHI','b*@gmail.com')


 CREATE TABLE TBLPRODUCT (
 ID INT IDENTITY(1,1) PRIMARY KEY,
 NAME VARCHAR(255),
 PRICE INT
 );

 CREATE TABLE TBLSALES (
 ID INT IDENTITY(1,1) PRIMARY KEY,
 QUANTIYSOLD VARCHAR(255),
 PRODUCTID INT
 );

 ALTER TABLE TBLSALES
 ADD CONSTRAINT FK_TBLPRODUCT_TBLSALES
 FOREIGN KEY (PRODUCTID)
REFERENCES TBLPRODUCT(ID);

INSERT INTO TBLPRODUCT VALUES('BOOST', 200), ('MALTOVA', 300), ('COMPLAIN', 250), ('HORLICKS' , 400);
INSERT INTO TBLSALES VALUES (4,1), (10, 2), (2,2), (8 ,1),(4,1), (10, 2), (2,3), (8 ,4),(4,1), (10, 3), (2,2), (8 ,1);

SELECT * FROM TBLPRODUCT;
SELECT * FROM TBLSALES;

ALTER VIEW GETNAMEANDTOTALQUANTITY
WITH SCHEMABINDING
AS
SELECT DBO.TBLPRODUCT.NAME, SUM(ISNULL(CAST(DBO.TBLSALES.QUANTIYSOLD AS INT)* TBLPRODUCT.PRICE,0)) AS TOTALAMOUNT, COUNT_BIG(*) AS TOTAL
FROM DBO.TBLPRODUCT JOIN DBO.TBLSALES
ON DBO.TBLPRODUCT.ID = DBO.TBLSALES.PRODUCTID
GROUP BY DBO.TBLPRODUCT.NAME;
;

SELECT * FROM GETNAMEANDTOTALQUANTITY;

CREATE UNIQUE CLUSTERED INDEX IUX_NAMEANDTOTALQUANTITY ON GETNAMEANDTOTALQUANTITY(NAME) 


DROP INDEX IUX_NAMEANDTOTALQUANTITY_NAME ON GETNAMEANDTOTALQUANTITY