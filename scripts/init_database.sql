----Creation of "database"

/* 
====================================================================
Create Database and Schemas
====================================================================
Script Purpose:
  this scripts creates a new database name 'DataWarehouse' after checking if it already exists.
if the database is already exist , it is dropped and recreate. Additionally, the script set up three schemas with in the database
:'bronze','silver', and 'gold'

WARNING
RUNNING THIS SCRIPT WILL DROP THE ENTIRE 'DataWarehouse' database if it exists.
All data in the database will be permanently deleted. Proceed with caution
and ensure you have proper backups before running this script.

*/


use master;
Go
  -- drop and recreate the 'datawarehouse'database
  IF EXISTS (SELECT 1 FROM SYS.DATABASE WHERE name= "DATAWAREHOUSE')
  BEGIN
  ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
  DROP DATABASE DataWarehouse;
END;
GO
CREATE DATABASE DataWarehouse;

USE DataWarehouse;

CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
GO
