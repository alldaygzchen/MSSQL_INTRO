

Create Table and Insert values 

        CREATE TABLE [dbo].[salesstaffNew](
            ID [int] not null IDENTITY PRIMARY KEY,
            [staffid] [int] NOT NULL,
            [fName] [nvarchar](30),
            [lName] [nvarchar](30)
            )

        INSERT INTO [dbo].[salesstaffNew] (STAFFID,FNAME,LNAME) VALUES (300,'Imran','Afzal'),(325,'John','Vick'),(314,'James','Dino')
        
        ---------------------------------------------------------

        CREATE TABLE [dbo].[nameOnlyTable](
            
            [fName] [nvarchar](30),
            [lName] [nvarchar](30)
            )

        GO
        
        insert into nameOnlyTable (fname,lname)
        select fname,lname from salesstaffNew where id >= 3

        ---------------------------------------------------------

        [backup purpose]

        select * into salesstaffNew_bkp from salesstaffNew

Update value

        update salesstaff set [SalesQuota] = SalesQuota + 1550000 , SalesYTD =  SalesYTD - 500,SalesLastYear = SalesLastYear * 1.5

        update salesstaff set [TerritoryName] = 'UK', TerritoryGroup = 'Europe' [TerritoryGroup] is null and fullname = 'syed Abbas'

        update salesstaff set [TerritoryName] = 'UK' where [TerritoryName] = 'United Kingdom'

        ---------------------------------------------------------
        
        update salesstaff set SalesQuota = sp.salesquota
        from salesstaff ss
        inner join sales.vSalesPerson sp
        on ss.Fullname = (sp.firstname + ' ' + sp.lastname)

Delete value 

        delete from salesstaff where countryregion =  'united states'

        -----------------------------
        begin tran
        delete from salesstaff where countryregion =  'united states'

        rollback tran

        ------------------------------

        begin tran
        delete from salesstaff where countryregion =  'united states'

        commit

        ------------------------

        delete from salesstaff where staffid in (select [BusinessEntityID] from [Sales].[vSalesPerson] where SalesLastYear = 0)

        -------------------------------------

        delete salesstaff 
        from  [Sales].[vSalesPerson] sp
        inner join salesstaff ss
        on sp.[BusinessEntityID] = ss.staffid
        where sp.saleslastyear = 0

Truncate Table

        truncate table  employeenew

        -------------------------------------

Stored Procedure

        [without parameter]
        CREATE PROCEDURE [dbo].[SelectAllPersonAddress]
        AS
        SELECT * FROM  Person.Address
        go;
        -------------------------------------
        exec [dbo].[SelectAllPersonAddress] 
        -------------------------------------

        drop procedure [dbo].[SelectAllPersonAddressWithParams]
        
        -------------------------------------

        [with parameter]

        CREATE PROCEDURE [dbo].[SelectAllPersonAddressWithParamswithEncryption] (@City NVARCHAR(30) = 'New York',@stateProvinceid int)
        AS

        BEGIN --start
        SET NOCOUNT ON --no count message

        SELECT * FROM  Person.Address where City = @city;

        END --end
        GO


        -------------------------------------

Function

        1. Built in function examples:
                print upper('hehetgtAA')

        2. User defined function examples:
                
                [return single value]

                Create function [dbo].[fnGetEmpFullName]
                ( @FirstName varchar(50), @LastName varchar(50))
                returns varchar(101)
                As
                begin
                return (select @FirstName + ' '+@LastName);
                end
                GO

                select dbo.fnGetEmpFullName (firstname,lastname) as Fullname , salary from FunctionEmployee

                [return table]

                create function [dbo].[fnGetEmployee]()
                returns Table
                As
                return (select * from FunctionEmployee)
                GO


                create function [dbo].[fnGetMulEmployee]()
                returns @Emp Table
                (
                Empid int,
                FirstName varchar(50),
                Salary int
                )
                As
                Begin
                Insert into @Emp Select e.EmpID,e.FirstName,e.Salary from FuntionEmployee e;
                --Now update salary of first employee
                update @Emp set Salary=25000 where EmpID=1;
                --It will update only in @Emp table not in Original Employee table
                return
                end 
                GO


                select * from dbo.fnGetMulEmployee vs  select * from dbo.fnGetEmployee
                 will not change the orignal table
 


Triggers:

        CREATE TABLE [dbo].[EmployeeTriggerHistory](
	[ID] [int] NULL,
	[Statement] [nchar](10) NULL
        ) ON [PRIMARY]

        GO

        -------------------------------------
        
        CREATE TRIGGER [dbo].[EmployeeInsert] 
        ON  [dbo].[Employee] 
        AFTER INSERT
        AS 
        BEGIN
                -- SET NOCOUNT ON added to prevent extra result sets from
                -- interfering with SELECT statements.
                SET NOCOUNT ON;

        -- Insert statements for trigger here
                Insert into EmployeeTriggerHistory values ((select max(EmpID) from employee),'Insert')


        END

        GO
