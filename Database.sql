select * from sys.databases;

CREATE DATABASE SOMETHING;

-- IF THE DATABASE IS IN USE (MULTIPLE USERS ARE CONNECTED) IT CANNOT BE DELETED. WE HAVE TO SET IT SINGLE_USER TO DELETE IT.

ALTER DATABASE SOMETHING SET SINGLE_USER WITH ROLLBACK IMMEDIATE;

-- ON CREATION OF THE DATABASE IT CREATE MDF AND LDF FILE. MDF FILE WILL CONTAIN THE DATA WHILE LDF FILE WILL CONTAIN THE LOGS.

DROP DATABASE SOMETHING;

exec sp_renameDB 'something','School';

alter database School modify name = Employee;




