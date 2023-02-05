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
    what is a snapshot. Difference between temporary table

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
        
        Select * INTO <destination table> FROM <source table>

        
        
        

    

























