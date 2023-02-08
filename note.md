######################  Section 1
1. RDBMS stands for relational database management system, it is a type of database  
2. Data in a relational database is stored as table  
3. Sql is not a database; it is a languange to access data from the table  
4. MSSQL includes a related database engine(stores data in table,col.rows)   
    SSIS (Integration Service): tool for exporting, importing, transforming data  
    SSRS (Reporting Service): Create report and serve report to end user  
    SSAS (Anaylsis Service): A mutidimensional database to query data from main database engine (used for BI)  
5.  SSMS(SQL Server management studio): An additional software to maintain and manage database: run Sql queries,  
    perform backup and analyze performance chart   
6. Editions for mssql: Enterprise > Standard > WEB > Developer(Same functionality as Enterprise free but for development  
    use) > Express (exists limitations but can be used in production)  

######################  Section 2
1. pre-requisite: Administrative right, hard disk:6GB (adding VM total 20GB not including data), memory: 4GB, processor: 64bit  
2. For PC normally download SQL Server Express (lot of features not avaliable), thus we need to use vm for using SQL server enterprise  
3. Why Virtualization: Resource are under utilized (Physical Server >> Operating system + Application)
4. Download:　https://customerconnect.vmware.com/en/downloads/details?downloadGroup=WKST-PLAYER-1625&productId=1039&rPId=98562
5. Download OS later, HardDisk:50GB, Memory:4GB, Network Adapter: Bridged: connected directly to the physical network
6. Download os: https://www.microsoft.com/en-us/evalcenter/download-windows-server-2016
7. Open VMware Workstation 16 player and edit virtual machine settings => CD/DVD=> click connect at power on and import downloaded os ios 
8. If error try this :https://jingyan.baidu.com/article/fea4511a7bb521b6ba91257e.html
9. Click windows Server 2016 Datacenter Evaluation (Desktop Experience)
10. Custom 
11. ctrl+alt+insert to login
12. Install tools right below (Do not restart)
13.  PC => properties => change computer name (LABMSSQL)
14. CD/DVD: change back to physical drive again. You can change the settings here if the machine running slow
15. IE => internet properties => security change to the lowest and enable file download in custom => download chrome
16. Download adventure works backfiles (oltp 2016 version) 
17. Download sql server 2016, sql server management studio v16.5.3
18. create SQL_DATA_FILES,SQL_LOG_FILES,SQL_TEMPDB,SQL_BACKUPS folder as seperate disk
19. setup up sqlserver installation 
20. windows firewall turn off two check buttons
21. feature sellection => Databse Engine Service(SQL server replication). client tools connectivity
22. Service acount: automatic
23. Databse Engine Configuration: Server Configuration: create mixed authentication password, Data directories and temp db change file path to note 18th , temp db initial size to 128
24. Install ssms
25. move adventure works backfiles to SQL_BACKUPS folder
26. Open ssms => right click restore database => add adventure file path to disk
27. run your first command 

    use AdventureWorks2016  
    go # consider as a semicolom

    select * from [HumanResources][Employee]

######################  Section 4
1. database is like folder and tables are like file
2. you cannot have same record in the table since there is a primary key
3. key: primary key, secondary key, unique key,foreign key, composite key
4. table naming: studentInfo
5. we cannot have more than one primary key in the table, but it can consist one or more than one column
6. unique is just like primary key but may contain null value
7. composite key may be a primary key
8. foreign key can be null or duplicated
9. primary keys contain clustered index while unique key contain non clusted index
https://medium.com/@jinghua.shih/rails-%E7%B6%B2%E7%AB%99%E6%95%88%E8%83%BD%E5%84%AA%E5%8C%96-%E4%BA%8C-%E8%B3%87%E6%96%99%E5%BA%AB%E7%B4%A2%E5%BC%95-database-index-bd89fa3757a#:~:text=%E5%8F%A2%E9%9B%86%E7%B4%A2%E5%BC%95%EF%BC%88Clustered%20Index%EF%BC%89%E7%9B%B4%E6%8E%A5,%E7%AF%84%E5%9C%8D%E9%80%A3%E7%BA%8C%E8%B3%87%E6%96%99%E7%9A%84%E6%99%82%E5%80%99%E3%80%82
10. transaction is a unit of work whoch access and modifies the content of a database
11. transaction groups are either all commited or all rollback (based on ACID)
12. ACID is a conceot that refers to the four properties of a transaction in a database: atomicity, consistency, Isolation and Durability
13. Atomicity: If one part of transaction fails, all will failed
14. Consistency: If you have a column that must be postive. if using a value lower than zero on this column, the transaction will fail
15. Isolation: transaction will wait until transaction end
16. Durability: the changes are persisted permanently in the database (recorded on hard drive), the transaction will only be finished when the data is saved in a hard disk
17. Why normalization: Data redundacy, maintenance problem => action: decomposing table
18. 1NF: only atomic value and no repeating group
19. 2NF: satisty 1NF and remove partial primary key dependencies(field depend on part of the primary key)
https://www.ithome.com.tw/tech/47440  
20. 3NF: satisty 2NF and remove transitively dependent(the stepping stone)
21. Create a database in mssql => two database files (including log file) => output string =>execute
22. full recovery vs simple recovery: full recovery can rollback to specific time
23. Create table and insert data by gui
24. parsing vs execute: parsing only check the suntax of the query

[additional]
1. attribute is a piece of data that describes an entity. For example, in a customer database, the attributes might be name, address, and phone number.
2. attribute can be named field.

######################  Section 5
1. types of sql statement
    DML(Manipulation): select,insert,update,delete...  
    DDL(Definition [Deals with database schemas and description]): create(database,procedure,function), alter(add,modify,drop,rename column,rename table,procedure,function), drop(remove data,indexes,triggers), truncate(removes all rows from table without logging [truncate the whole table]) 
    DCL(Control): grant, revoke  
    TCL(Transaction [Used to group an manage DML statement]): transaction
2.  DML:
    1. Select * from table where col1>5  
    2. Insert Into table (col1,col2) Values (val1,val2)  
    3. Update table set col1=val where col1>5  
    4. Delete from table where col=val1  
3.  DDL:
    1. Create Table table (col1 type1,col2 type2)
    2. ALter Table table Add(col1 type1)
    3. Drop Table table
    4. Drop Database database
    5. Truncate Table table
4.  DCL:
    1. Grant Update ON Table to user with grant option (this user can grant the power to someone else in this table)
    2. Grant Select ON Table table to Public (any member can select but can not grant the power)
    3. REVOKE DELETE ON table FROM user
    4. REVOKE ALL ON table FROM user
5. 
    1.  commit
    
        begin tran d
        UPDATE table set col1=val1 where col1>5
        commit tran d  

    2. rollback [undo the changes before a commit is done]


            DECLARE @BookCount int
            BEGIN TRANSACTION AddBook
            INSERT INTO Books VALUES (20, 'Book15', 'Cat5', 2000)
            SELECT @BookCount = COUNT(*) FROM Books WHERE name = 'Book15'
            IF @BookCount > 1
            BEGIN
            ROLLBACK TRANSACTION AddBook
            PRINT 'A book with the same name already exists‘
            END
            ELSE
            BEGIN
            COMMIT TRANSACTION AddStudent
            PRINT 'New book added successfully‘
            END

    3. Savepoint (roolback to a point whenever nessesary)


            UPDATE employees SET salary = 7000 WHERE last_name = 'Banda';
            SAVEPOINT banda_sal;
            UPDATE employees SET salary = 12000 WHERE last_name = 'Greene';
            SAVEPOINT greene_sal;
            SELECT SUM(salary) FROM employees;
            ROLLBACK TO SAVEPOINT banda_sal;
            UPDATE employees SET salary = 11000 WHERE last_name = 'Greene';
            COMMIT;

######################  Section 6
1. Schema: A logical collection of related database objects such as table, indexes, functions...
2. 

        <!-- CREATE TABLE Persons (
        ID int NOT NULL,
        LastName varchar(255) NOT NULL,
        FirstName varchar(255),
        Age int,
        CONSTRAINT PK_Person PRIMARY KEY (ID,LastName)
        ); -->

        create table [AdventureWorks2016].[sales].[storesnew] (
        store_id INT  PRIMARY KEY not null,
        sales INT
        )


        create table [AdventureWorks2016].[sales].[visists] (
        visit_ID INT PRIMARY KEY identity (1,1),
        first_name VARCHAR (50) not null,
        last_name VARCHAR (50) not null,
        visited_at datetime,
        phone VARCHAR (20) not null,
        store_id INT not null,
        foreign key (store_id) References sales.storesnew (store_id)	
        )

        SELECT * FROM [AdventureWorks2016].[sales].[visists]

3. Temporary table: Stores a subset of data for a certain period [Useful for prevent the subquery again and again]
        temporary table must start with #

        [method 1]
        select BusinessEntityID,FirstName,MiddleName,Title
        into #TempPersonTable
        from [person].[person]
        where title = 'mr.' 

        [method 2]
        create table #TempPersonTable (
        BusinessEntityID INT,
        FirstName NVARCHAR(50),
        MiddleName NVARCHAR(50),
        Title NVARCHAR(50)
        )

        -- minsert into for temp table

        Insert into #TempPersonTable
        select [BusinessEntityID],[FirstName],[MiddleName],[Title]
        from [person].[person]
        where title = 'mr.' 
        
        [Last]
        SELECT * FROM #TempPersonTable
        DROP TABLE #TempPersonTable

4.  View can be formed from a single table or multiple tables or from multiple database
    https://www.quora.com/What-is-the-difference-between-a-view-and-a-temporary-table
    https://www.quora.com/What-are-the-pros-and-cons-of-temporary-tables-vs-views-in-mysql
5.  Suggest creating view using gui 
6.  

    SELECT TOP (1000) [Expr1],[Expr2],[LastName],[PhoneNumber],[PhoneType]
    FROM [AdventureWorks2016].[dbo].[EmployeePhoneDetail] #view

    [additional]
    what is a snapshot. Difference between temporary table??

    1. A snapshot in SQL Server provides a read-only, static view of a database that is taken at a specific point in time
    2. Even if the original table is modified, snapshot remains the same
    3. temp table is not read-only changed.






7. SELECT FROM WHERE GROUP BY HAVING ORDER BY
8. sql is not case sensitive 
9. SQL operators: Arithmetic operators(+,-,*,/), Relational Operators(>,<,=), Logical Operators(AND,OR)
10. SQL EXPRESSION: usem them to query the specific dataset

    SELECT * FROM dataflair_employee WHERE age = 26 ; (boolean expression)
    SELECT * FROM dataflair_employee WHERE age*2 > 50 ; (numerical expression)
    SELECT * FROM dataflair_employee WHERE DoB > DATE(‘1995/01/01’) ;  (date expression)

11. SQL CONDITION: multiple sql expression

    SELECT *  FROM suppliers WHERE (state = 'California' AND supplier_id <> 900) OR (supplier_id = 100);

12. group by class will use the column which are in the select column, the having class will be use the column in the grouping class
13. add two dashes for comment or /* */
14. examples

    select * from Person.address where postalcode = '98011'  -- single quote
    select * from Person.address where ModifiedDate >= '2013-11-08 00:00:00'
    select * from Person.Person where FirstName like 'mat%' -- case sensitive
    select max(rate) AS MaxPayrate from [HumanResources].[EmployeePayHistory]
    
    select * from [Production].[ProductCostHistory] where ProductID in (802,803,820,900)
    select * from [Production].[ProductCostHistory] where EndDate is not null
    
    select * from [HumanResources].[EmployeePayHistory] where  year(ModifiedDate) >= '2014' order by ModifiedDate desc
    
    select count(*) from Person.address # one value
    select count(*),postalcode from Person.address group by PostalCode
    select count(*),City,PostalCode from Person.address group by City,PostalCode # should not miss City,PostalCode


    select count(*) countofproduct,Color from Production.product where color = 'yellow' group by Color
    select count(*) countofproduct,Color from Production.product group by Color having Color = 'yellow' # same result as previous

    select count(*) countofproduct,Color,Size from Production.product where color = 'yellow' group by Color,size having Size >= '44' #where and having can pu together
    
15. Join Introduction

    1. foreign id should not be in list format in column field
    2. foreign id should be unique in another table to prevent duplicated combinations

    
        SELECT e.EmpID,e.EmpName,s.SalesNumber,s.ItemSold FROM [dbo].[Employee] e
        join [dbo].[Sales] s 
        on e.EmpID = s.[EmpID]
        order by e.EmpID

        SELECT count(s.SalesNumber),e.EmpID,e.EmpName FROM [dbo].[Employee] e
        join [dbo].[Sales] s 
        on e.EmpID = s.[EmpID]
        group by e.EmpID,e.EmpName
        
    3. Default join is inner join  
    4. inner join,left join,right join,outer join  
    5. full join = inner join + (left join -inner join) + (right join - inner join)  
    6. left join (join the left table) vs right join (join the right table)
    
        select s.RollNo,s.StudentName,c.CourseID from [dbo].[Student] s
        left join [dbo].[Course] c 
        on s.RollNo = c.RollNO
        
        
        select s.RollNo,s.StudentName,c.CourseID from [dbo].[Student] s
        right join [dbo].[Course] c 
        on s.RollNo = c.RollNO
        
16. Subquery (a sql embedded query within the where clause)
     1. Subquery is not limitted to select statement such as insert ...
     2. Subquery can be used to return a single value or row set [a column]; whereas join are used to return multiple rows [multiple columns]
     3. Subquery can only have one column in the select clause, unless mulitple columns are in the main query for subquery to compare its mulitple columns http://www.baskent.edu.tr/~tkaracay/etudio/ders/dbase/sql/htmSQL/OracleDers12.htm
     4. Subquery cannot use order by
     5. Subquery that return more than one row can use multiple value operators such as in operator
     6. Subquery cannot use between operator 

17. Insert:
    1. there are tow ways to insert: Insert manually or retrieve from other columns

        INSERT INTO [dbo].[salesstaffNew] (STAFFID,FNAME,LNAME) VALUES (300,'Imran','Afzal'),(325,'John','Vick'),(314,'James','Dino')  
        
        insert into nameOnlyTable (fname,lname)
        select fname,lname from salesstaffNew where id >= 3
        
        Select * INTO <destination table> FROM <source table> (* is not must)

18. Update (without where all the rows will be updated):

    examples:

        update salesstaff set [SalesQuota] = SalesQuota + 1550000 , SalesYTD =  SalesYTD - 500,SalesLastYear = SalesLastYear * 1.5
        update salesstaff set [TerritoryName] = 'UK', TerritoryGroup = 'Europe' [TerritoryGroup] is null and fullname = 'syed Abbas'
        update salesstaff set [TerritoryName] = 'UK' where [TerritoryName] = 'United Kingdom'


        [update data with data from other table]
        update salesstaff set SalesQuota = sp.salesquota
        from salesstaff ss
        inner join sales.vSalesPerson sp
        on ss.Fullname = (sp.firstname + ' ' + sp.lastname)

19. Delete (without where all the rows will be deleted):

    delete from table == delete table

    examples:

    delete from salesstaff where countryregion =  'united states'
    
    [For production]
    begin tran
    delete from salesstaff where countryregion =  'united states'
    rollback tran -- deleted in memory but not in disk
    commit

    delete from salesstaff
    where staffid in
    (select [BusinessEntityID] from [Sales].[vSalesPerson] where SalesLastYear = 0)

    delete salesstaff 
    from  [Sales].[vSalesPerson] sp
    inner join salesstaff ss
    on sp.[BusinessEntityID] = ss.staffid
    where sp.saleslastyear = 0

20. Truncate vs Delete

    1. Truncate: delete all data  and some db can not be rolled back
    2. Truncate: It will reseed the identity column which is id
    3. Truncate : DDL statement

    example:

        TRUNCATE TABLE table;

21. Stored Procedure[14:47]

    1. the place we save the query
    2. it accepts parameters
    3. it is compiled and saved in the cache
    4. In the application level, only the procedure named is passed
    5. reusable
    6. Eliminating direct access to db
    7. It can be easily modified without redeploying application


    what is the difference between view and stored procedure?
        
        Stored procedures can be used to enforce business rules and to improve security, as they can be used to validate input and enforce data constraints.  

        Views are used to simplify queries by providing a pre-defined set of columns and/or rows, based on a SELECT statement. 
        SQL view cannot insert, update, or delete records. 
        A temporary table is a separate and independent copy of the data from the original table

        
        [without parameter]
        CREATE PROCEDURE [dbo].[SelectAllPersonAddress]
        AS
        SELECT * FROM  Person.Address
        go;
        -----------------------

        exec [dbo].[SelectAllPersonAddress] 

        -----------------------

        [with parameter]
        CREATE PROCEDURE [dbo].[SelectAllPersonAddressWithParamswithEncryption] (@City NVARCHAR(30) = 'New York',@stateProvinceid int)
        AS

        BEGIN --start
        SET NOCOUNT ON --no count message

        SELECT * FROM  Person.Address where City = @city;

        END --end
        GO

22. Function

    1. Function can return a single value or table
    2. We can't use a function to insert,update,delete records but store procedure can (only allows select statement)
    3. Store procedure vs functions:
        1. Stored procedure cannot be called within sql statements. Function can be
        2. procedure can have output parameters
        3. try- catch block cannot be used in a function
        4. we can use transaction in procedure
    4. Built in function 
        1. Scalar function: operate a single value and return a single value
        2. Aggregate function: max(), min()
        3. Date and Time function: getdate(), Year() ....
    
    5. sql server does not have nvl2 function 

        SELECT column1,olumn2,
        CASE
            WHEN column3 IS NOT NULL THEN column3
            ELSE column4
        END AS new_column
        FROM table;
    
    6. User defined function: scalar function, Inline table-valued function and multi-statement table-valued function
    7. ITVF vs MSTVF
        
        1. inline table-valued function: returns a table and is defined using a single SELECT statement.
        2. multi-statement table-valued function:  returns a table and is defined using a series of T-SQL statements

        examples:
            
            CREATE FUNCTION dbo.GetInlineData (@start_date DATE, @end_date DATE)
            RETURNS TABLE
            AS
            RETURN
            (
                SELECT column1, column2, column3
                FROM table
                WHERE date_column BETWEEN @start_date AND @end_date
            )

            SELECT * FROM dbo.GetInlineData ('2022-01-01', '2022-12-31')


            CREATE FUNCTION dbo.GetMultiStatementData (@start_date DATE, @end_date DATE)
            RETURNS @result TABLE (column1 INT, column2 VARCHAR(20), column3 DECIMAL(10,2))
            AS
            BEGIN
                INSERT INTO @result
                SELECT column1, column2, column3
                FROM table
                WHERE date_column BETWEEN @start_date AND @end_date

                RETURN
            END
    8.  Built in function examples:

        print upper('hehetgtAA')

    9.  User defined function examples:
                
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
 
    10. If you want to output a result from a SQL function, you need to either declare a variable outside of the function to store the  result, or use a stored procedure with output parameters.

23. Triggers:
        1. special stored procedure that are automatically executed in response to table,objects,server event
        2. three trigger: DML, DDL , Logon triggers

        3. Example

            CREATE TRIGGER AfterInsertTrigger ON TriggerDemo_Parent
            AFTER INSERT
            AS INSERT INTO TriggerDemo_History VALUES ((SELECT TOP 1 ID FROM TriggerDemo_Parent), 'Insert')
            GO
            • CREATE TRIGGER AfterDeleteTrigger ON TriggerDemo_Parent
            AFTER DELETE
            AS INSERT INTO TriggerDemo_History VALUES ((SELECT TOP 1 ID FROM TriggerDemo_Parent), 'Delete')
            GO
            • CREATE TRIGGER AfterUPDATETrigger ON TriggerDemo_Parent
            AFTER UPDATE
            AS INSERT INTO TriggerDemo_History VALUES ((SELECT TOP 1 ID FROM TriggerDemo_Parent), 'UPDATE')
            GO
24. Index:
        1. if table don't have a index, it will table scan and the table is called heap
        2. Indexes are created on columns in tables or view
        3. Index is made up by index nodes (pages) that are organize in b tree structure
        4. Index can be set in primary key too 

25. Clustered Index and Non Clusted Index

        1. clustered index: stores actual data rows at the leaf level of the index
        2. one clustered index on a table or view
        3. Non clustered index: contains only the value from the indexed column (like a pointer)
        4. multiple non clustered index is allow on table or view
        5. clustered / non clustered can be composite index 
        6. unique clustered index is automatically created when define primary key
        7. unique non clustered index is automatically created when define unique key

26. Index design consideration
        1. Index are automatically updated when the rows are updated
        2. Creating too much indexes will affect performance and storage
        3.  non-clustered indexes are used to optimize performance for queries that search for specific values in columns other than the primary key.
        
        4. Example
            • -- Create a nonclustered index on a table or view
            • CREATE INDEX index1 ON schema1.table1 (column1);
            • -- Create a clustered index on a table and use a 3-part name for the table
            • CREATE CLUSTERED INDEX index1 ON database1.schema1.table1 (column1);
            • -- Create a nonclustered index with a unique constraint
            • -- on 3 columns and specify the sort order for each column
            • CREATE UNIQUE INDEX index1 ON schema1.table1 (column1 DESC, column2 ASC, column3 DESC);

27. Index fragmentation
    
        1. Is the index performance value in percentage
        2. Every index has its pages 
        3. Internal Index Fragmentation: occur when data pages have too much free spaces
        4. External Index Fragmentation: result of data pages out of order
        5. formula: condense page / total page
        6. https://sqlhints.com/wp-content/uploads/2018/05/Structure-of-Clustered-Index.jpg

            SELECT S.name as 'Schema',
            T.name as 'Table',
            I.name as 'Index',
            DDIPS.avg_fragmentation_in_percent,
            DDIPS.page_count
            FROM sys.dm_db_index_physical_stats (DB_ID(), NULL, NULL, NULL, NULL) AS DDIPS
            INNER JOIN sys.tables T on T.object_id = DDIPS.object_id
            INNER JOIN sys.schemas S on T.schema_id = S.schema_id
            INNER JOIN sys.indexes I ON I.object_id = DDIPS.object_id
            AND DDIPS.index_id = I.index_id
            WHERE DDIPS.database_id = DB_ID()
            and I.name is not null
            AND DDIPS.avg_fragmentation_in_percent > 0
            ORDER BY DDIPS.avg_fragmentation_in_percent desc




        Rebuild: when fragmentation reaches greater than 30 percent
        Reorganize: when fragmentation is between 11-30 percent
        Ignore: 10 percent or less



######################  Section 7

1. SSMS: provide management platform for all kind of sql related work
2. SQL Server Coniguration Manager:  basic confiuration management including servers,protocols
3. SQL Server Profiler: monitor databse engine or analysis service [debugging the query]
4. Databse Engine Tuning Advisor: create optimal sets of indexes,
5. SQL server Tools: Building solutions for the business intelligence components
6. Data Quality client: An ide to monitor data cleansing operation and it connect to DQS server
7. Connectivity Components: Install components for communication between clients and server

8. sql sever import and export wizard => create input and output like csv file for further appliation
9. how to copy the table => right click on the table
10. tools => options => tSQL =>line row
11. right click on labmssql => reports 
12. right click on query table =>results to
13. right click on labmssql => properties
14. navbar execution plan
15. navbar intellisence enable
16. right click table => objects explorer (table informations)
17. right click on labmssql => activity monitors 
18. sp_who2 active
19. right click on labmssql => restart 
20. database name => right click tasks => backup
21. management => maintainace plan (backup and recovert)
22. management => sql server agnet (job)
23. https://blog.sqlauthority.com/2019/05/21/sql-server-difference-between-login-vs-user-security-concepts/
24. Exporing sql server configuration manager
    1. sql server services => right click and properties
25. type of databases => user databases and system database (For SQL to operate)
26. System database => Master (the core db, nost data are store in resource db now but we cannot directly access), temp db,  msdb(manage sql server agent configurations), model (all user defined database)
    Distribution(SQL server replication)
27. object creating, changing not recommend in system database
28. Each SQL server instance has its own SQL server system database
29. only full backup can be performed in master database
30. error log : find recovery is complete when restarting 
31. temdb: available to all users connected to the instance (save all temporary objects)
32. temporary table are saved in tempdb
33. how to move temp db








