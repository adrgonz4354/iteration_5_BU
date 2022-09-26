/*
 * This procedure will make it easier to add employees to the database.
 */

CREATE PROCEDURE create_employee
	@FirstName VARCHAR(50),
	@LastName VARCHAR(50),
	@EmailAddress VARCHAR(500),
	@PhoneNumber BIGINT,
	@JobID DECIMAL(12)
AS
BEGIN

	DECLARE @EmployeeID AS DECIMAL(12)
	SET @EmployeeID = (ROUND(RAND(CHECKSUM(NEWID())) * (9999), 2))
	

	EXECUTE create_email @EmailAddress, 1
	
	DECLARE @EmailID AS DECIMAL(12)

	SET @EmailID = (SELECT EmailID from Email WHERE EmailAddress = @EmailAddress)


	INSERT INTO Employee(EmployeeID, FirstName, LastName, EmailID, PhoneNumber, JobID)
	VALUES(@EmployeeID, @FirstName, @LastName, @EmailID, @PhoneNumber, @JobID)

END;