CREATE PROCEDURE create_email
	@EmailAddress VARCHAR(500),
	@EncryptionLevel INT
AS
BEGIN

	DECLARE @EmailID AS DECIMAL(12)
	SET @EmailID = (ROUND(RAND(CHECKSUM(NEWID())) * (9999), 2))

	INSERT INTO Email(EmailID, EmailAddress, EmailEncrypted)
	VALUES (@EmailID, @EmailAddress, @EncryptionLevel)

END;