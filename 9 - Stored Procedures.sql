-- creating a new database organisation
create database organisation;

use organisation;

-- creating table Worker
create table Worker (
Worker_Id int PRIMARY KEY,
FirstName char(25), 
LastName char(25), 
Salary int, 
JoiningDate DATETIME, 
Department char(25));

-- Questions ----------------------------
-- 1. Create a stored procedure that takes in IN parameters for all the columns in the Worker table and adds a new record to the table and then invokes the procedure call. 
delimiter $$
create procedure add_new_record
(IN p_workerid int, IN p_firstname char(25), IN p_lastname char(25), IN p_salary int, IN p_joiningdate char(25), IN p_department char(25))
begin
	insert into Worker( Worker_Id, FirstName, LastName, Salary, JoiningDate, Department ) 
    values 
    (p_workerid, p_firstname, p_lastname, p_salary, p_joiningdate, p_department);
end $$
delimiter ;

call add_new_record(1, 'Aravind', 'Sivan', 25000, '2020-05-19 09:00:00', 'Finance');

select * from Worker;

-- 2. Write stored procedure takes in an IN parameter for WORKER_ID and an OUT parameter for SALARY. It should retrieve the salary of the worker with the given ID and returns it in the p_salary parameter. Then make the procedure call.
Delimiter $$
create procedure retrieve_salary( IN p_WorkerId int, OUT p_Salary int )
begin
    select Salary into p_Salary
    from Worker
    where Worker_Id = p_WorkerId;
end $$
Delimiter ;

call retrieve_salary(1,@p_Salary);
select @p_Salary as 'Worker Salary';

-- 3. Create a stored procedure that takes in IN parameters for WORKER_ID and DEPARTMENT. It should update the department of the worker with the given ID. Then make a procedure call.
Delimiter $$
create procedure update_department ( IN p_Worker_Id int, IN p_Department char(25) )
begin
	update Worker set Department = p_Department where Worker_Id = p_Worker_Id;
end $$
Delimiter ;

call update_department(1, "Sales");
select * from Worker;
 
-- 4. Write a stored procedure that takes in an IN parameter for DEPARTMENT and an OUT parameter for p_workerCount. It should retrieve the number of workers in the given department and returns it in the p_workerCount parameter. Make procedure call. 
-- inputting new workers to the table
insert into Worker ( Worker_Id, FirstName , LastName, Salary, JoiningDate, Department )
values 
(2, "Swathi", "Padmanabhan", 45000, "2023-02-03", "Finance"),
(3, "Divya", "Rajasekharan", 68000, "2000-05-08", "IT"),
(4, "Arun", "Prathapan", 30000, "1998-08-13", "Finance"),
(5, "Aditya", "S", 70000, "2003-09-12", "IT"),
(6, "Mahesh", "Thapur", 28000, "2004-05-20", "Sales");

select * from Worker;

Delimiter $$
create procedure number_of_workers ( IN p_Department char(25), OUT p_workerCount int )
begin
	select count(*) into p_workerCount from Worker where Department = p_Department; 
end $$
Delimiter ;

call number_of_workers('Finance', @p_workerCount);
select @p_workerCount as 'Count of Workers';

-- 5. Write a stored procedure that takes in an IN parameter for DEPARTMENT and an OUT parameter for p_avgSalary. It should retrieve the average salary of all workers in the given department and returns it in the p_avgSalary parameter and call the procedure.
Delimiter $$
create procedure average_salary ( IN p_Department char(25), OUT p_avgSalary int )
begin
	select avg(Salary) into p_avgSalary from Worker where Department = p_Department ;
end $$
Delimiter ;

call average_salary( 'Sales', @p_avgSalary );
select @p_avgSalary as 'Average Salary';








