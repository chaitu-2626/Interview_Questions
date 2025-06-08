CREATE TABLE USERS(
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    user_name VARCHAR(200),

    --SQL won't allow strict enforcement for the integers so using char
    --UNSIGNED means value inserted into that column will always non-negative
    mobile_number char(10) UNSIGNED, 
    email_id VARCHAR(200),
    age INT UNSIGNED,
    created_at DATETIME
)

SELECT * FROM USERS;

SELECT * FROM USERS 
WHERE email_id = "vinay@email.com"; 

--used to get the unique user names from the users table
SELECT DISTINCT user_name FROM USERS;

--get the unique username and email id from the users table
SELECT DISTINCT user_name, email_id FROM USERS;

--return count of the unique usernames
SELECT COUNT(DISTINCT user_name) FROM USERS;

/* 
    Operators
    1) =
    2) >
    3) >
    4) <=
    5) >= 
    6) <> (not equal)
    7) BETWEEN (eg. WHERE Price BETWEEN 50 AND 60;)
    8) LIKE (eg. WHERE City LIKE 's%')
    9) IN (eg. WHERE City IN ('Paris','London'))
    10) AND
    11) OR
    12) NOT
*/
--Multiple where clauses can be combined with the AND, OR, NOT

SELECT * FROM Customers
WHERE City = 'Berlin' OR City = 'Stuttgart';

SELECT * FROM Customers
WHERE City IN('Berlin', 'Stuttgart');


/* 
ORDERBY - used to sort the result in the ascending or descending order
@default - ascending order
@keywords - ASC | DESC 
*/
SELECT * FROM USERS
ORDER BY created_at DESC;

SELECT * FROM USERS
ORDER BY created_at DESC, user_name ASC; --we cannot use and clause between Multiple SQL's


INSERT INTO USERS
VALUES(NULL, ); --if the first column is primary key give it null


--NULL VALUES
SELECT * FROM USERS 
WHERE user_name IS NULL;

SELECT * FROM USERS 
WHERE user_name IS NOT NULL;


--UPDATE VALUES
UPDATE USERS
SET user_name = "chaitu", email_id = "chaitu@email.com";
WHERE user_name = "bob"; --when where clause is omitted all the records will be updated


--DELETE (delete data from the existing table)
DELETE FROM USERS; -- deletes all the data in the users table

DELETE FROM USERS
WHERE user_name = "chaitu"; --delete only the records only whose user name is chaitu


--LIMIT (specify the no of records to return)
SELECT * FROM USERS 
LIMIT 10; --returns only 10 record

SELECT * FROM USERS 
LIMIT 10 OFFSET 5; --RETURN 10 records start from 6.

--IMP** you cannot use offset without using limit in mysql viceversa in postgresql


/* 
--MIN AND MAX
    MIN (returns the smallest value in the selected column)
    MAX (returns the largest value in the selected column)

    @string (Lexicographical Order)
    MIN() will return the smallest string based on alphabetical order.
    MAX() will return the largest string based on alphabetical order.

    @datetime
    MIN() will return the earliest date or time.
    MAX() will return the latest date or time.

--COUNT
    count of the rows which matches the specific condition

        Works With	                                | Does Not Work With
AVG()	Numeric types: INT, FLOAT, DECIMAL, BIGINT	| Non-numeric types: VARCHAR, DATE
SUM()	Numeric types: INT, FLOAT, DECIMAL, BIGINT	| Non-numeric types: VARCHAR, DATE
*/

SELECT MIN(price) AS 'Smallest Price'
FROM Products;


/*
--LIKE

--WILDCARD characters
    % - zero or more characters
    _ - must be one character

a%	Starts with 'a'.

%a	Ends with 'a'.

%a%	Contains 'a' anywhere.

_a%	'a' in the second position. length can be any

a_%	Starts with 'a' and has at least 2 characters. 

a__%	Starts with 'a' and has at least 3 characters.

a%o	Starts with 'a' and ends with 'o'.

a___b	Starts with 'a', has exactly 3 characters in between, and ends with 'b'.

____	Exactly 4 characters.

a%_b%	Starts with 'a', has any number of characters in between, and has 'b' in the second-to-last position.

%abc%	Contains 'abc' anywhere.

\%%	Search for a literal percent sign (%) in the string.
*/


--IN, NOT IN
SELECT * FROM Customers
WHERE Country IN (SELECT Country FROM Suppliers); --used to specify multiple values in the where clause

--BETWEEN (selects the value with in a given range)

SELECT * FROM USERS
WHERE age BETWEEN 10 AND 20;


SELECT * FROM USERS
WHERE age BETWEEN 10 OR 20; --will raise error because OR is not suppose to use in this context


/* 
--Aliases 
    1) Used to give a temporary name for the table or the column
    2) Only exists for the duration of the query
    3) created with the AS keyword
*/

SELECT user_name AS 'user name'
FROM USERS;

SELECT user_name FROM USERS AS 'users table';

SELECT user_name AS 'user name', email_id AS 'email id' 
FROM USERS;

SELECT CONCAT_WS(', ', user_name, email_id) AS 'user details'
FROM USERS;


--Inner Join (Used to combine rows from two or more tables)
SELECT O.OrderDate, C.CustomerName
FROM ORDER AS O
INNER JOIN CUSTOMER ON O.CustomerId = C.CustomerId
ORDER BY O.OrderDate DESC;

SELECT C.CustomerName, COUNT(O.OrderId) AS `No of orders`
FROM CUSTOMER AS C
INNER JOIN `ORDER` AS O ON C.CustomerId = O.CustomerId
GROUP BY C.CustomerName
ORDER BY O.OrderDate DESC;

/*
--Joins 
    Inner Join
    Left Join
    Right Join
    Cross Join
    Self Join
*/

-- user, product, cart
/* 
    User table
        user_id
        user_name
        email_id

    Product table
        product_id
        product_name
    
    Cart table
        product_id (FK)
        user_id (FK)
        quantity
*/


--- user_name, product name, quantity
SELECT U.user_name AS `user name`, P.product_name AS `product name`, C.quantity
FROM USERS AS U
INNER JOIN CART AS C ON U.user_id = C.user_id
INNER JOIN PRODUCT AS P ON C.product_id = P.product_id;

SELECT U.user_name AS `user name`, P.product_name AS `product name`, C.quantity
FROM CART AS C  
INNER JOIN USERS AS U ON U.user_id = C.user_id
INNER JOIN PRODUCT AS P ON C.product_id = P.product_id
WHERE C.quantity > 0;


/*
Execution order: (FJW GH SOL) (SFJ WG HOL)

FROM table1, table2 (FROM and JOIN)

WHERE column1 = 'value' (Filter rows)

GROUP BY column1 (Group the results)

HAVING COUNT(column2) > 1 (Filter groups)

SELECT column1, column2 (Select the columns)

ORDER BY column1 DESC (Sort the results)

LIMIT 10 (Limit the number of results)
*/
SELECT column1, column2
FROM table1
JOIN table2 ON table1.id = table2.id
WHERE column1 = 'value'
GROUP BY column1
HAVING COUNT(column2) > 1
ORDER BY column1 DESC
LIMIT 10;


--HAVING (Having clause is used for the aggregate functions)

--EXISTS (is used to test the existence of any record in subquery)
--Exists return true if subquery returns one or more records

SELECT SupplierName --Outer Query
FROM Suppliers
WHERE EXISTS ( --While reading each record in the supplier table sql execute the inner query too
    SELECT ProductName FROM Products ---Inner Query 
    WHERE Products.SupplierID = Suppliers.supplierID 
    AND Price = 22
);


/*
--ANY
    returns true if any of the subquery value meets the condition
--ALL
    returns true if all of the subquery value meets the condition
    used with SELECT, WHERE, HAVING
*/


SELECT ProductName --outer query will show the product names which product id given by sub query
FROM Products
WHERE ProductID = ANY
  (SELECT ProductID --Subquery will return the list of product ids whose quantity is 10
  FROM OrderDetails
  WHERE Quantity = 10);



SELECT ProductName --only display the product names if all the records in the order details table has quantity = 0;
FROM Products
WHERE ProductID = ALL
  (SELECT ProductID 
  FROM OrderDetails
  WHERE Quantity = 10);


--INSERT INTO (copies data from one table and insert it into another table)
--data types in the source and target should be same

INSERT INTO SUPPLIERS 
SELECT * FROM CUSTOMERS;

INSERT INTO SUPPLIERS (SupplierName, SupplierId, Area)
SELECT (CustomerName, CustomerId, Area) FROM CUSTOMER;

--CASE STATEMENT (goes through each statement and return the value when the first condition met)
--if there is no else part and no conditions are true, it returns NULL
SELECT OrderId, Quantity,
CASE 
    WHEN 
        (Quantity > 30) 
        THEN "The quantity is greater then 30"
    WHEN 
        (Quantity = 30)
        THEN "The quantity is 30"
    ELSE 
        "The quantity is less then 30"
END AS QuantityText
FROM OrderDetails;

SELECT CustomerName, City, Country
FROM Customers
ORDER BY
(CASE
    WHEN City IS NULL THEN Country
    ELSE City
END);

--IFNULL and COALESCE (both let's you return the alternate value if an expression is NULL)
SELECT ProductName, UnitPrice * (UnitsInStock + IFNULL(UnitsOnOrder, 0)) --if the unitsOnOrder is null it will give 0;
FROM Products;

SELECT ProductName, UnitPrice * (UnitsInStock + COALESCE(UnitsOnOrder, 0))
FROM Products;


--SOME
--find employees whose salary is greater than the salary of at least one employee in the IT department.
SELECT name, salary 
FROM employees
--checks if the salary of each employee is greater than at least one of the salaries returned by the subquery.
WHERE salary > SOME (SELECT salary --returns the salaries of all employees in the IT department.
                      FROM employees
                      WHERE department_id = 2);


SELECT MIN(salary) AS salary, employeeName FROM employee;


SELECT salary, employeeName
FROM employee 
ORDER BY salary DESC
LIMIT 1; 


--DATABASE 

CREATE DATABASE testDB; --should have admin privileges
SHOW DATABASE;
DROP DATABASE testDB --will delete the database and all it's data


CREATE TABLE users(
    column1 INT AUTO_INCREMENT PRIMARY KEY,
    column2 VARCHAR(100)
)

--SQL creates a new table called "TestTables" (which is a copy of the "Customers" table): 
CREATE TABLE TestTable AS
SELECT customername, contactname
FROM customers;

--DROP TABLE

DROP TABLE TestTable; -- will deletes the table and all it's data

TRUNCATE TABLE TestTable --will only deletes the data inside the table but not the table.

--ALTER TABLE (add, delete or modify the columns in the existing table)

--adding new column into table
ALTER TABLE USERS 
ADD user_type VARCHAR(100)

--deleting column from a table
ALTER TABLE USERS 
DROP COLUMN user_type

--modifying the column data type in a table
ALTER TABLE USERS
MODIFY COLUMN user_type INT;

ALTER TABLE USERS 
CHANGE COLUMN user_type userType VARCHAR(100); --we need to specify the data type even if you are renaming the column

/*
--Constraints
NOT NULL - Ensures that a column cannot have a NULL value

UNIQUE - Ensures that all values in a column are different

PRIMARY KEY - A combination of a NOT NULL and UNIQUE. Uniquely identifies each row in a table

FOREIGN KEY - Prevents actions that would destroy links between tables

CHECK - Ensures that the values in a column satisfies a specific condition
DEFAULT - Sets a default value for a column if no value is specified
CREATE INDEX - Used to create and retrieve data from the database very quickly
*/

--Named constraints
CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    CONSTRAINT UC_Person UNIQUE (ID,LastName) --Easy to alter the named constraints
);

--UNIQUE - Ensures that all values in a column are different

/*
--Primary key (Clustered Index)
    * It implicitly create a clustered index
    * The data is sorted based on the index
    * When any CRUD operation is performed on the record fragmentation wil occur 

--UNIQUE (Non clustered Index)
    * cluster index will be created when there is no existing cluster index
    * or else non Cluster index is will get created.
    * When any CRUD operation is performed on the record fragmentation will occur 
    
--Fragmentation 
    * The data will not be contiguous when any row is deleted from middle of table so fragmentation occurs.

--Clustered Index
    * It won't create a separate table but instead it will re arrange the existing table data order based on the indexed column
    * A table can have only one clustered index
    * By default clustered index form on primary index if we define manually for other columns then those columns will be..
    * 
--Non Clustered Index
    * A non-clustered index is an index structure that is separate from the table data itself
    * The key point is that while it is an index, it is not a separate table. It's still part of the same database,
      but it is logically separate from the actual data in the table.
    * An index tree is usually an B-tree (Balanced Tree)
    *  B-tree aren't necessarily required to store keys in exact lexicographical order, but rather to guide the search process.

--B TREE (Balanced Tree)
The root node doesn’t necessarily have to contain the lexicographically smallest key in the tree, but rather the key that makes the tree balanced and efficient for searches.

bob@example.com might appear in the root node because, during the process of building the tree, this key helped in splitting the nodes and maintaining the balance of the tree.

The internal nodes and root node contain keys for guiding the search, and they don't necessarily need to follow strict lexicographical ordering across the entire tree.

The leaf nodes are where the actual data pointers to the rows are stored.

Key Takeaways:
Yes, when a row is deleted from the table, the corresponding key in the B-tree is also deleted.

After deletion, the B-tree might require rebalancing (splitting or merging nodes) to maintain its efficiency.

B-trees are designed to remain balanced, so even after multiple deletions or insertions, the structure of the tree ensures that search operations continue to be efficient.

-- Logical and physical fragmentation
Logical fragmentation is handled automatically by the B-tree to ensure efficiency in searching.
The B-tree doesn't automatically handle this kind of fragmentation. It’s not concerned with how the data is stored on disk, just that the tree structure itself is balanced and search-efficient.

Physical fragmentation, however, requires manual intervention to optimize disk space and improve I/O performance.
* Admin need to do the fragmentation manually Re Ordering of the record 
*/

-- Rebuild the clustered index
ALTER INDEX PK_employees ON employees REBUILD; --Physically rearrange the rows in table (Expensive)

-- Reorganize the clustered index
ALTER INDEX PK_employees ON employees REORGANIZE; -- de fragment the index structure without rebuilding (Efficient)

--Creating an clustered index for a column
CREATE CLUSTERED INDEX idx_employee_id ON employees(employee_id);

--Creating an non clustered index for a column  
CREATE NONCLUSTERED INDEX idx_email ON employees(email);



CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    CONSTRAINT PK_Person PRIMARY KEY (ID,LastName) --Given an alternate name for the primary keys it will help to alter easily
);


-- Create a temporary table to cache intermediate results
CREATE TEMPORARY TABLE temp_sales_cache AS
SELECT product_id, SUM(amount) AS total_sales
FROM sales
GROUP BY product_id;

-- Use the cached data in subsequent queries
SELECT * FROM temp_sales_cache WHERE total_sales > 1000;

-- Later use the same cached data without recomputation
SELECT product_id FROM temp_sales_cache WHERE total_sales < 500;

-- Drop the temporary table when done
DROP TEMPORARY TABLE temp_sales_cache;


/*
Execution Order:

FROM and JOIN

ON (to define join condition)

WHERE (filtering)

GROUP BY (group rows)

HAVING (filtering groups)

SELECT (define the columns to return)

DISTINCT (remove duplicates)

ORDER BY (sort results)

LIMIT (restrict number of rows returned)

*/


/*
Example of ACID in Practice
Consider a scenario where you are transferring money from one bank account to another:

Atomicity: The operation involves two steps: withdrawing from Account A and depositing into Account B. If the system crashes after the withdrawal but before the deposit, the transaction should be rolled back, ensuring no money is lost.

Consistency: The transaction should follow the bank's rules, like no account going below a certain balance, and both accounts should be in a valid state after the transaction.

Isolation: If another person is simultaneously trying to transfer money from Account B, they should not be able to see or interfere with the uncommitted changes made by your transaction.

Durability: After the transaction is committed, the changes to the accounts (the withdrawal and deposit) will be saved permanently, even if the database crashes immediately afterward.

By adhering to these principles, databases maintain the integrity and reliability needed for crucial business and transactional applications.
*/