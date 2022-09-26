CREATE PROCEDURE make_into_owner
	@EmployeeID DECIMAL(12)
AS
BEGIN
	DECLARE @OwnerID AS DECIMAL(12)
	SET @OwnerID = (ROUND(RAND(CHECKSUM(NEWID())) * (9999), 2))


	INSERT INTO SystemOwner(OwnerID, EmployeeID, DBPermissions)
	VALUES(@OwnerID, @EmployeeID, 2)
END;