/*
=============================================================
  Modern Data Warehouse - Database Setup Script
=============================================================

  WARNING:
  This script will DROP the database if it already exists.
  All existing data inside the database will be permanently deleted.
  Use with caution in production environments.

=============================================================
*/

-- Switch to the master database to perform administrative tasks
USE master;
GO

-- Check if the DataWarehouse database already exists
IF EXISTS (SELECT name FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    PRINT 'Database exists. Dropping existing database...';
    
    -- Force close existing connections before dropping
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    
    DROP DATABASE DataWarehouse;
END
GO

-- Create a fresh DataWarehouse database
CREATE DATABASE DataWarehouse;
GO

-- Switch context to the newly created database
USE DataWarehouse;
GO

/*
-------------------------------------------------------------
 Create Schema Layers for Medallion Architecture
-------------------------------------------------------------
 bronze  : Raw ingested data (unprocessed source data)
 silver  : Cleaned and transformed data
 gold    : Business-ready, aggregated analytical data
-------------------------------------------------------------
*/

CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
