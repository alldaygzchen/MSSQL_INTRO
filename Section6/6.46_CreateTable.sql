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

select BusinessEntityID,FirstName,MiddleName,Title
into #TempPersonTable
from [person].[person]
where title = 'mr.' 


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




SELECT * FROM #TempPersonTable

DROP TABLE #TempPersonTable