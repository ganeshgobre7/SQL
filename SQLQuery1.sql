Create Database Payroll_Service
Use PayRoll_Service

Create table tbl_Employee_Payroll
(
	Id int primary key identity(100,1),
	Name varchar(100),
	Salary int,
	Start_Date date
)

Insert into tbl_Employee_Payroll values('Ram',25000.00,'2020/10/18')
Insert into tbl_Employee_Payroll values('Shaym',35000.00,'2020/10/18')
Insert into tbl_Employee_Payroll values('Jay',15000.00,'2018/05/18')
Insert into tbl_Employee_Payroll values('Vijay',55000.00,'2021/10/18')
Insert into tbl_Employee_Payroll values('Pooja',45000.00,'2018/02/15','F')
Insert into tbl_Employee_Payroll values('Seema',85000.00,'2017/10/21','F')

Select * from tbl_Employee_Payroll

Select * from tbl_Employee_Payroll where Name='Jay'

Select * from tbl_Employee_Payroll where Start_Date between CAST('2018/05/18' As date) and GETDATE()

ALTER table tbl_Employee_Payroll ADD Gender VARCHAR(2) 

update tbl_Employee_Payroll set Gender = 'M' where Id = '100'
update tbl_Employee_Payroll set Gender = 'M' where Id = '101'
update tbl_Employee_Payroll set Gender = 'M' where Id = '102'
update tbl_Employee_Payroll set Gender = 'M' where Id = '103'

Select COUNT(Gender) from tbl_Employee_Payroll where Gender='M'
Select COUNT(Gender) from tbl_Employee_Payroll where Gender='F'
Select Sum(Salary) from tbl_Employee_Payroll where Gender='M' group by Gender;
Select Sum(Salary) from tbl_Employee_Payroll where Gender='F' group by Gender;
Select Sum(Salary) from tbl_Employee_Payroll  group by Gender;
Select Sum(Salary) from tbl_Employee_Payroll 
Select AVG(Salary) from tbl_Employee_Payroll
Select AVG(Salary) from tbl_Employee_Payroll where Gender ='M'
Select AVG(Salary) from tbl_Employee_Payroll where Gender ='F'
Select MIN(Salary) from tbl_Employee_Payroll
Select MIN(Salary) from tbl_Employee_Payroll where Gender ='M'
Select MIN(Salary) from tbl_Employee_Payroll where Gender='F'

Alter table tbl_Employee_Payroll Add PhoneNo varchar(100)
Alter table tbl_Employee_Payroll Add Address varchar(100) Default 'Mumbai'
Alter table tbl_Employee_Payroll Add Department varchar(100) Not Null Default  'Testing'

Select * from tbl_Employee_Payroll

Alter table tbl_Employee_Payroll Add BasicPay float, Deduction float, TaxablePay float, IncomeTax float, NetPay float

Insert into tbl_Employee_Payroll 
values ('Terisa',3000000, '2018-01-03' , 'F','New York',9922003699,'Marketting',  3000000.00, 1000000.00, 2000000.00, 500000.00, 1500000.00),
('Terisa',3000000, '2018-01-03' , 'F','New York',9034001654,'Sales',  3000000.00, 1000000.00, 2000000.00, 500000.00, 1500000.00)

Select * from tbl_Employee_Payroll where Name='Terisa'

Create table tbl_Company
(
	CmpId int primary key identity(1,1),
	CmpName varchar(100) Not Null
)

Create table tbl_Department
(
	DepId int primary key  identity(1,1),
	DepName varchar(100) Not Null
)

Create table tbl_Employee
(
	EmpId int Primary key identity(1,1),
	EmpName varchar(100) Not Null,
	EmpPhoneNo int Not Null,
	EmpAddress varchar(100),
	EmpGender char(2),
	CompanyId int,
	Foreign key(CompanyId)REFERENCES tbl_Employee(EmpId) 
)

Create table tbl_Payment
(
	PaymentId int Primary Key identity(1,1),
	EmpId int,
	BasicPay float,
	Deduction float,
	TaxablePay float,
	IncomeTax float,
	NetPay float,
	Foreign key(EmpId)REFERENCES tbl_Employee(EmpId) 
)

Create table tbl_Emp_Department
(
	EmpId int,
	DepId int,
	Foreign key(EmpId) REFERENCES tbl_Employee(EmpId),
	Foreign key(DepId) REFERENCES tbl_Department(DepId)
)

Select * from tbl_Payment,tbl_Company,tbl_Department,tbl_Employee,tbl_Emp_Department
