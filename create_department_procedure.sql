CREATE PROCEDURE make_department
	@DepartmentName VARCHAR(50),
	@LocationID DECIMAL(12)
AS 
BEGIN
	DECLARE @DepartmentID AS DECIMAL(12)
	SET @DepartmentID = (ROUND(RAND(CHECKSUM(NEWID())) * (9999), 2))

	INSERT INTO Department(DepartmentID, DepartmentName, LocationID)
	VALUES (@DepartmentID, @DepartmentName, @LocationID)
END;