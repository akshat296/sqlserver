
--- TRANSACTION DOES NOT LOAD ALL THE RECORDS ONLY LOCKS ROW AND SNAPSHOT CAN VIEW AS IT IS STORED IN TEMP TABLE AND LOCKS
ALTER PROC spUpdateTblPersons
as 
begin 
BEGIN TRANSACTION 
	BEGIN TRY
		SELECT * FROM TBLPERSON;
		UPDATE TBLPERSON SET NAME = 'BOOST' WHERE NAME = 'Pikachu';
		UPDATE TBLPERSON SET genderid = 2 WHERE NAME = 'Pikachu';
		PRINT 'SUCCESS';
	COMMIT TRANSACTION
	END TRY 
	BEGIN CATCH
		PRINT 'ERROR';
		ROLLBACK TRANSACTION;
	END CATCH;
END;