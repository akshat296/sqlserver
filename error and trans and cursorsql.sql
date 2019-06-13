Declare @tableName nvarchar(100)
Declare @tableName_Cursor cursor 

BEGIN TRY
    
	BEGIN TRAN

	SET @tableName_Cursor = CURSOR FOR	
	SELECT  t.name
		FROM sys.columns c
			JOIN sys.tables t ON c.object_id = t.object_id
		WHERE c.name = 'BU' 
		and t.name not in ('TS_SummaryPL','TsBuListing','TsContractBilling','TsCostPlusMarkup','TsAAI','TsCosts','tsVendors','TsSlotJDE')		

	OPEN @tableName_Cursor 
	FETCH NEXT FROM @tableName_Cursor INTO @tableName
		WHILE (@@FETCH_STATUS = 0) 
		BEGIN	
		    
			----Select @tableName
			 EXEC('Delete  from ' + @tableName + ' where BU in (''3223000'',''7509000'',''6500010'',''2000605'',''2000410'')' )

			FETCH NEXT FROM @tableName_Cursor INTO @tableName
	   END 

	CLOSE @tableName_Cursor
    DEALLOCATE @tableName_Cursor
	
	COMMIT TRAN;
END TRY

	BEGIN CATCH
		ROLLBACK TRAN;
		SELECT  
         ERROR_NUMBER() AS ErrorNumber  
        ,ERROR_SEVERITY() AS ErrorSeverity  
        ,ERROR_STATE() AS ErrorState  
        ,ERROR_PROCEDURE() AS ErrorProcedure  
        ,ERROR_LINE() AS ErrorLine  
        ,ERROR_MESSAGE() AS ErrorMessage; 		
	END CATCH