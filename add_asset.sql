/*
 * This procedure will make it easier to add jobs to the database
 */
CREATE PROCEDURE add_asset
	@AssetName VARCHAR(50),
	@OwnerID DECIMAL(12),
	@LocationID DECIMAL (12)
AS
BEGIN

	DECLARE @AssetID AS DECIMAL(12)
	SET @AssetID = (ROUND(RAND(CHECKSUM(NEWID())) * (9999), 2))
	
	INSERT INTO Asset(AssetID, AssetName, OwnerID, LocationID)
	VALUES(@AssetID, @AssetName, @OwnerID, @LocationID)

END;