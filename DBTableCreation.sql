/* 
 * Creating the tables for the iteration project.
 * Tables are: Email, Job, Employee, Department, SystemOwner, Asset, Location.
 */

CREATE TABLE Job (
	JobID DECIMAL(12) NOT NULL PRIMARY KEY,
	JobName VARCHAR(50) NOT NULL,
	JobDescription VARCHAR(500) NOT NULL
);

CREATE TABLE Email (
	EmailID DECIMAL(12) NOT NULL PRIMARY KEY,
	EmailAddress VARCHAR(500) NOT NULL,
	EmailEncrypted INT NOT NULL --Had to change encrypted to EmailEncrypted to prevent an error
);

CREATE TABLE Location (
	LocationID DECIMAL(12) NOT NULL PRIMARY KEY,
	LocationName VARCHAR(50) NOT NULL,
	LocationRow BIGINT NOT NULL, --These have to be renamed because it will cause an error
	LocationColumn INT NOT NULL
);

CREATE TABLE Department (
	DepartmentID DECIMAL(12) NOT NULL PRIMARY KEY,
	DepartmentName VARCHAR(50) NOT NULL,
	LocationID DECIMAL(12) NOT NULL FOREIGN KEY REFERENCES Location(LocationID)
);

CREATE TABLE Employee (
	EmployeeID DECIMAL(12) NOT NULL PRIMARY KEY,
	FirstName VARCHAR(50) NOT NULL,
	LastName VARCHAR(50) NOT NULL,
	EmailID DECIMAL(12) NOT NULL FOREIGN KEY REFERENCES Email(EmailID),
	PhoneNumber BIGINT NOT NULL,
	JobID DECIMAL(12) NOT NULL,
	DepartmentID DECIMAL(12) FOREIGN KEY REFERENCES Department(DepartmentID) --Department not required,
);

CREATE TABLE SystemOwner (
	OwnerID DECIMAL(12) NOT NULL PRIMARY KEY,
	EmployeeID DECIMAL(12) NOT NULL FOREIGN KEY REFERENCES Employee(EmployeeID),
	DBPermissions INT NOT NULL
);

CREATE TABLE Asset (
	AssetID DECIMAL(12) NOT NULL PRIMARY KEY,
	AssetName VARCHAR(50) NOT NULL,
	OwnerID DECIMAL(12) NOT NULL FOREIGN KEY REFERENCES SystemOwner(OwnerID),
	LocationID DECIMAL(12) NOT NULL FOREIGN KEY REFERENCES Location(LocationID)
);
