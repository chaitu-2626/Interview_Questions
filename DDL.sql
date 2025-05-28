-- DDL (Data Definition Language)

-- this will create a new database
CREATE DATABASE <database name>

-- this will delete the database and all of its data
DROP DATABASE <database name> database

-- this will backup the database
BACKUP DATABASE <database name>
TO DISK = 'D:/databases/database.bak'

--creating an new table
CREATE TABLE <table name>(
    <column name> <data type> <constraints>,
    <column name> <data type>,
    <column name> <data type>
);

-- this will drop the table and all of its data
DROP TABLE <table name>


--this is used to delete all of the data in a table but keeps the table
TRUNCATE TABLE <table name>

-- this is used to add a column with the constrains to a table
ALTER TABLE <table name>
ADD <column name> <data type> <constraints>

--this is used to drop a column
ALTER TABLE  <table name>
DROP <column name>

-- this is used to rename a column
ALTER TABLE <table name>
RENAME COLUMN <old column name> TO <new column name>

-- this is used to change the data type of a column
ALTER TABLE <table name>
MODIFY COLUMN <column name> <data type>

-- constraints
CREATE TABLE <table name>(
    id INT PRIMARY KEY, --This cannot be null and it's and clustered index
    name VARCHAR(200) NOT NULL, --This cannot be null
    user_name VARCHAR(300) UNIQUE, --This column should be unique in the each row
    FOREIGN KEY (id) REFERENCES <table name>(id)
    CHECK (<condition> AND  <condition> OR <condition>)
    active BOOLEAN DEFAULT true
    user_id INT AUTO_INCREMENT
);

-- altering the constraints
ALTER TABLE <table name> 
ADD UNIQUE (<column name>) -- this will add a unique constraint to a column


ALTER TABLE <table name>
ADD PRIMARY KEY (<column name>) -- this will add a primary key constraint to a column

--Adding constraint for the multiple column at once only
ALTER TABLE <table name>
ADD CONSTRAINT <constraint name> (<column name>, <column name>)

--dropping a constraint
ALTER TABLE <table name>
DROP CONSTRAINT <constraint name>


CREATE INDEX <index name>
ON <table name> (<column name>, <column name>);

DROP INDEX <index name>
ON <table name>

ALTER TABLE <table name>
DROP INDEX <index name>




