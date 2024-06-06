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

SQLite is a serverless database system, meaning it doesn't require a separate server process; instead, the database engine is embedded directly into the application. It is self-contained, consisting of a single library that offers a full-featured SQL database engine. SQLite requires zero configuration, eliminating the need for setup or administration, making it ideal for embedded systems, mobile apps, and small projects. Additionally, it is file-based, with the entire database stored in a single file on disk, simplifying backups and transfers.

## How to use SQLite

### Setting up

- **1. Installation:**
  - SQLite is often pre-installed on many systems. If not, you can download it from https://sqlite.org/.
  - For Windows, download the precompiled binaries. For macOS and Linux, you can often use package managers like `brew` or `apt`.
- **2. SQLite Command Line Interface (CLI):**
  - You can interact with SQLite databases using the SQLite CLI tool. Launch it by running `sqlite3` in your terminal or command prompt.
 
### Basic operations with SQLite

- **1. Creating a Database:**
  - You create a database by simply specifying a file name.
  ```
  sqlite3 my_database.db
  ```
  This opens the SQLite prompt and creates a new database file `my_database.db`.
