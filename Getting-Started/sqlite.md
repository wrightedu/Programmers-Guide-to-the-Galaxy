# WSU CSE's SQL Crash Course: Especially the 'lite' version

## What is SQL?

SQL stands for Structured Query Language, and it's a standard language used to interact with databases. Think of it as a way to talk and manipulate databases, which are collections of organize data.

## What is a database?

A database is liuke a digital filing system that stores and organizes data. This data is often kept in tables, which are somewhat similar to spreadsheets. Each table contains rows and columns. Rows are the individual records, and columns are the attributes of those records.

## Basic components of SQL

SQL is used to perform various operations on the data stored in these databases. Here are some fundamental operations you can do with SQL:

### 1. Select data (Read):

- **SELECT**: Retrieves data from one or more tables.
  ```
  SELECT column1, column2 FROM table_name;
  ```
  This command fetches specific columns from a table.

### 2. Insert data (Create):

- **INSERT INTO**: Adds new data to a table.
  ```
  INSERT INTO table_name (column1, column2) VALUES (value1, value2);
  ```
  This command inserts new rows into a table.

### 3. Update data (Update):

- **UPDATE**: Modifies existing data in a table.
  ```
  UPDATE table_name SET column1 = value1 WHERE condition;
  ```
  This command changes existing records that meet certain criteria.

### 4. Delete data (Delete):

- **DELETE FROM**: Removes data from a table.
  ```
  DELETE FROM table_name WHERE condition
  ```
  This command deletes rows that meet certain criteria.

### 5. Create and modify tables (Schema Changes):

- **CREATE TABLE**: Creates new table.
  ```
  CREATE TABLE table_name (
      column1 datatype,
      column2 datatype,
      ...
  );
  ```
  This command sets up a new table with specified columns and data types.

- **ALTER TABLE**: Modifies an existing table.
  ```
  ALTER TABLE table_name ADD column_name datatype;
  ```
  This command adds a new column to an existing table.

### 6. Filtering and Sorting:

- **WHERE**: Filters the results based on a condition.
  ```
  SELECT column1, column2 FROM table_name WHERE condition;
  ```
  This helps you get specific records that match the criteria.

- **ORDER BY**: Sorts the results.
  ```
  SELECT column1, column2 FROM table_name ORDER BY column1 ASC/DESC;
  ```
  This arranges the results in ascending or descending order.

## We use SQLite

SQLite is a popular database engine that is known for its simplicity and ease of use. Unlike many other database systems, SQLite dooesn't require a seperate server process. The database engine is embedded directly into the application. SQLite is a single library that provides a full-featured SQL database engine. 



## How to use SQLite

