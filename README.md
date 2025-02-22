# Stored-Procedures---SQL

This document describes a set of stored procedures for managing and querying data in a Worker table. The table has the following structure:

Table: Worker
Field	Type	             Description
------------------------------------------------------------------
Worker_Id	INT	           Unique identifier for the worker
FirstName	CHAR(25)	     Worker’s first name
LastName	CHAR(25)	     Worker’s last name
Salary	INT(15)	         Worker’s salary
JoiningDate	DATETIME	   Date and time when the worker joined
Department	CHAR(25)	   Department the worker belongs to


Operations Performed :
1. Create a stored procedure that takes in IN parameters for all the columns in the Worker table and adds a new record to the table and then invokes the procedure call. 
2. Write stored procedure takes in an IN parameter for WORKER_ID and an OUT parameter for SALARY. It should retrieve the salary of the worker with the given ID and returns it in the p_salary parameter. Then make the procedure call.
3. Create a stored procedure that takes in IN parameters for WORKER_ID and DEPARTMENT. It should update the department of the worker with the given ID. Then make a procedure call. 
4. Write a stored procedure that takes in an IN parameter for DEPARTMENT and an OUT parameter for p_workerCount. It should retrieve the number of workers in the given department and returns it in the p_workerCount parameter. Make procedure call. 
5. Write a stored procedure that takes in an IN parameter for DEPARTMENT and an OUT parameter for p_avgSalary. It should retrieve the average salary of all workers in the given department and returns it in the p_avgSalary parameter and call the procedure.

The screenshots of outputs has been attached for reference.
