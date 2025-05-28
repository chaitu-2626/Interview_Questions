-- DDL (Data Definition Language) Commands

-- -------------------------------------------------------------------
-- 1. Database Operations
-- -------------------------------------------------------------------

-- Create a new database
-- Syntax: CREATE DATABASE your_database_name;
CREATE DATABASE your_database_name;

-- Delete a database and all its data
-- Syntax: DROP DATABASE your_database_name;
DROP DATABASE your_database_name;

-- Backup a database (Example for SQL Server - syntax varies by DBMS)
-- Syntax: BACKUP DATABASE your_database_name TO DISK = 'path/to/backup/file.bak';
BACKUP DATABASE your_database_name
TO DISK = 'D:/databases/your_database.bak';

-- -------------------------------------------------------------------
-- 2. Table Operations
-- -------------------------------------------------------------------

-- Create a new table
-- Syntax: CREATE TABLE your_table_name (column_name data_type [constraints], ...);
CREATE TABLE your_table_name (
    column1_name data_type PRIMARY KEY,
    column2_name data_type NOT NULL,
    column3_name data_type UNIQUE,
    column4_name data_type DEFAULT 'default_value'
);

-- Delete a table and all its data and structure
-- Syntax: DROP TABLE your_table_name;
DROP TABLE your_table_name;

-- Delete all data from a table, but keep the table structure
-- Resets AUTO_INCREMENT counters (behavior may vary by DBMS)
-- Syntax: TRUNCATE TABLE your_table_name;
TRUNCATE TABLE your_table_name;

-- -------------------------------------------------------------------
-- 3. Column Operations (ALTER TABLE)
-- -------------------------------------------------------------------

-- Add a new column to an existing table
-- Syntax: ALTER TABLE your_table_name ADD column_name data_type [constraints];
ALTER TABLE your_table_name
ADD new_column_name VARCHAR(255) DEFAULT 'N/A';

-- Drop an existing column from a table
-- Syntax: ALTER TABLE your_table_name DROP COLUMN column_name;
ALTER TABLE your_table_name
DROP COLUMN old_column_name;

-- Rename an existing column in a table (Syntax varies by DBMS: RENAME COLUMN, CHANGE COLUMN)
-- MySQL/PostgreSQL: ALTER TABLE your_table_name RENAME COLUMN old_column_name TO new_column_name;
-- SQL Server: EXEC sp_rename 'your_table_name.old_column_name', 'new_column_name', 'COLUMN';
ALTER TABLE your_table_name
RENAME COLUMN old_column_name TO new_column_name;

-- Change the data type or properties of an existing column
-- Syntax: ALTER TABLE your_table_name MODIFY COLUMN column_name new_data_type [new_constraints];
ALTER TABLE your_table_name
MODIFY COLUMN column_name INT NOT NULL;

-- -------------------------------------------------------------------
-- 4. Constraint Definitions
-- -------------------------------------------------------------------

-- Constraints defined during table creation (Inline Constraints)
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT, -- PRIMARY KEY: Unique and NOT NULL, often auto-indexed
    username VARCHAR(100) NOT NULL,         -- NOT NULL: Ensures column always has a value
    email VARCHAR(255) UNIQUE,              -- UNIQUE: Ensures all values in column are distinct
    age INT CHECK (age >= 18),              -- CHECK: Enforces a condition for values in a column
    status VARCHAR(50) DEFAULT 'active',    -- DEFAULT: Sets a default value if none is provided
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(dept_id) -- FOREIGN KEY: Links to a primary/unique key in another table
);

-- Altering Constraints (Adding/Dropping after table creation)

-- Add a UNIQUE constraint to an existing column
-- Syntax: ALTER TABLE your_table_name ADD UNIQUE (column_name);
ALTER TABLE your_table_name
ADD UNIQUE (email);

-- Add a PRIMARY KEY constraint to an existing column
-- Syntax: ALTER TABLE your_table_name ADD PRIMARY KEY (column_name);
ALTER TABLE your_table_name
ADD PRIMARY KEY (user_id);

-- Add a composite (multiple column) constraint (e.g., composite primary key or unique key)
-- Syntax: ALTER TABLE your_table_name ADD CONSTRAINT constraint_name (column1, column2);
ALTER TABLE order_items
ADD CONSTRAINT pk_order_item PRIMARY KEY (order_id, product_id);

-- Drop an existing constraint
-- Syntax: ALTER TABLE your_table_name DROP CONSTRAINT constraint_name; (SQL Server, Oracle)
-- MySQL: ALTER TABLE your_table_name DROP INDEX constraint_name; (for UNIQUE/PRIMARY KEY)
-- MySQL: ALTER TABLE your_table_name DROP FOREIGN KEY constraint_name; (for FOREIGN KEY)
ALTER TABLE your_table_name
DROP CONSTRAINT your_constraint_name;

-- -------------------------------------------------------------------
-- 5. Index Operations
-- -------------------------------------------------------------------

-- Create an index on one or more columns to improve query performance
-- Syntax: CREATE INDEX index_name ON your_table_name (column1, column2, ...);
CREATE INDEX idx_employee_name
ON employees (last_name, first_name);

-- Drop an index
-- Syntax: DROP INDEX index_name ON your_table_name; (SQL Server, Oracle)
-- MySQL: ALTER TABLE your_table_name DROP INDEX index_name;
DROP INDEX idx_employee_name
ON employees;
