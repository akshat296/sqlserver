ALTER PROCEDURE Copier
AS
BEGIN TRY
BEGIN TRANSACTION;
DECLARE @Temp table (id int, name varchar(20), magic varchar(30), school varchar(50));
INSERT INTO [dbo].[Emp] VALUES ('Akshat', 'CMS');
-- SELECT * FROM [DBO].[EMP];

INSERT INTO @Temp (id ,name ,magic,school)
SELECT id,name,concat('magic',id), school from dbo.emp;  
END TRY
begin CATCH
rollback;
end catch;

select  * FROM [dbo].MAGIC();


 EXEC COPIER;