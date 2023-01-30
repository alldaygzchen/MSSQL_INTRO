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
19. setup up sqlserver installation =>  
20. windows firewall turn off two check buttons
21. feature sellection => Databse Engine Service(SQL server replication). client tools connectivity
22. Service acount: automatic
23. Databse Engine Configuration: Server Configuration: create mixed authentication password, Data directories and temp db change file path to note 18th , temp db initial size to 128
24. Install ssms
25. move adventure works backfiles to SQL_BACKUPS folder
26. Open ssms => right click restore database => add adventure file path to disk
27. run your first command 

    use AdventureWorks2016  
    go

    select * from [HumanResources][Employee]