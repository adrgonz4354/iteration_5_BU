/*
 * This procedure will make it easier to add jobs to the database
 */
CREATE PROCEDURE create_job
	@JobName VARCHAR(50),
	@JobDescription VARCHAR(500)
AS
BEGIN

	DECLARE @JobID AS DECIMAL(12)
	SET @JobID = (ROUND(RAND(CHECKSUM(NEWID())) * (1000), 2))
	
	INSERT INTO Job(JobID, JobName, JobDescription)
	VALUES(@JobID, @JobName, @JobDescription)

END;