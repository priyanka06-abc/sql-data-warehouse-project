/*
=======================================================================
Create Database and Schemas
=======================================================================
Script Purpose:
   This script creates a new database name 'MysqlProject' after checking if it already exists.
   If the database exists, it is dropped and recreated. Additionally the script sets up three schemas
   within the database: 'bronze', 'silver', and 'gold'.

WARNING:
   Running this script drops the entire database 'MysqlProject' if it exists.
   All the data in the database will be permanently deleted. Proceed with caution
   and ensure you have proper backups before running this script.
*/

USE master;
GO

--Drop and recreate the MysqlProject database
IF EXISTS (SELECT 1 FROM sys.database WHERE name = 'MysqlProject')
BEGIN
  ALTER DATABASE MysqlProject SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
  DROP DATABASE MysqlProject;
END;
GO

  --Create the MysqlProject database

CREATE DATABASE MysqlProject;

USE MysqlProject;

-- Create Schemas

CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
GO
