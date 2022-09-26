CREATE PROCEDURE create_location
	@LocationName VARCHAR(50),
	@Row BIGINT,
	@Column INT
AS
BEGIN

	DECLARE @LocationID AS DECIMAL(12)
	SET @LocationID = (ROUND(RAND(CHECKSUM(NEWID())) * (9999), 2))

	INSERT INTO Location(LocationID, LocationName, LocationRow, LocationColumn)
	VALUES (@LocationID, @LocationName, @Row, @Column)

END;