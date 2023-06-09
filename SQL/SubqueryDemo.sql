USE [SQLTutorial]
GO
/****** Object:  StoredProcedure [dbo].[Temp_Employee_Procedure1]    Script Date: 2023-05-25 8:13:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[Temp_Employee_Procedure1]
(@Gender1 varchar(50))
as 
create table #Temp_Employee2(
	EmployeeID int, 
	FirstName varchar(50),
	LastName varchar(50),
	Gender varchar(50),
	TotalGender int,
	AverageSalary int
)

insert into #Temp_Employee2
select Demo.EmployeeID,Demo.FirstName, Demo.LastName, Demo.gender, COUNT(Demo.Gender) over (partition by Demo.Gender) as TotalGender, AVG(Salary) over (partition by Salary) as AVGSalary
from SQLTutorial..EmployeeDemographics Demo
join SQLTutorial..EmployeeSalary Sal
on Demo.EmployeeID = Sal.EmployeeId
where Demo.Gender = @Gender1

select * from #Temp_Employee2

