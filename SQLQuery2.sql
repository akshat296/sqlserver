

CREATE FUNCTION GetBornBetween
 (
 @YearAfter AS DATETIME,
 @YearBefore AS DATETIME
 )
RETURNS @People TABLE
(
	Name VARCHAR (MAX),
	Gender VARCHAR(MAX),
	DOB DATETIME,
	Job VARCHAR(10)
)
AS
BEGIN
		INSERT INTO @People
			SELECT name, gender, DOB, 'student'
			FROM student
			WHERE DOB BETWEEN @YearAfter AND @YearBefore

		INSERT INTO @People
			SELECT name, gender, DOB, 'teacher'
			FROM teacher
			WHERE DOB BETWEEN @YearAfter AND @YearBefore
		RETURN;
END