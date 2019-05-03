CREATE FUNCTION DBO.charat()
RETURNS varchar(20)
AS
BEGIN 
	declare @a VARCHAR(20);
	set @a= 'afd';
	RETURN @a;
END;


