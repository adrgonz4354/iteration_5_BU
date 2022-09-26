--Indexing Employees by Occuptation
CREATE UNIQUE INDEX cxl_jobID on Employee(JobID);

--Indexing Department by Name
CREATE UNIQUE INDEX clx_departmentNames ON Department(DepartmentName);