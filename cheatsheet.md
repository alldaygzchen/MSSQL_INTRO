

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