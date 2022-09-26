CREATE TABLE Action_log (
	ActionName VARCHAR(50) NOT NULL,
	TimeRequested DATETIME NOT NULL
);

GO
CREATE TRIGGER EmployeeAddedOrChanged
ON Employee AFTER INSERT, UPDATE 
AS
BEGIN
	INSERT INTO Action_log(ActionName, TimeRequested)
	VALUES('An employee was added or changed', GETDATE());
END;

GO
CREATE TRIGGER EmployeeRemoved
ON Employee AFTER DELETE 
AS
BEGIN
	INSERT INTO Action_log(ActionName, TimeRequested)
	VALUES('An employee was removed.', GETDATE());
END;

GO
CREATE TRIGGER DepartmentCreated
ON Department AFTER INSERT 
AS
BEGIN
	INSERT INTO Action_log(ActionName, TimeRequested)
	VALUES('A department was created.', GETDATE());
END;

GO
CREATE TRIGGER DepartmentRemoved
ON Department AFTER DELETE 
AS
BEGIN
	INSERT INTO Action_log(ActionName, TimeRequested)
	VALUES('A department was removed.', GETDATE());
END;


GO
CREATE TRIGGER SystemOwnerAddedOrModified
ON SystemOwner AFTER INSERT, UPDATE 
AS
BEGIN
	INSERT INTO Action_log(ActionName, TimeRequested)
	VALUES('A system owner has been added or modified.', GETDATE());
END;

GO
CREATE TRIGGER SystemOwnerRemoved
ON SystemOwner AFTER DELETE 
AS
BEGIN
	INSERT INTO Action_log(ActionName, TimeRequested)
	VALUES('A system owner has been removed.', GETDATE());
END;

GO
CREATE TRIGGER AssetModifiedOrAdded
ON Asset AFTER INSERT, UPDATE
AS
BEGIN
	INSERT INTO Action_log(ActionName, TimeRequested)
	VALUES('An asset was created or modified.', GETDATE());
END;

GO
CREATE TRIGGER AssetRemoved
ON Asset AFTER DELETE
AS
BEGIN
	INSERT INTO Action_log(ActionName, TimeRequested)
	VALUES('An asset was removed or no longer exists.', GETDATE());
END;

