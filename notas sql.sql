acordarse de usar CAST para castear a otro tipo de dato
having es el where para cuando estamos usando el group BY

/*
ejemplo de case 
*/
SELECT
    CustomerId,
    Total,
    CASE
        WHEN Total <= 2 THEN 'Bajo Valor'
        WHEN Total BETWEEN 2 AND 5 THEN 'Medio Valor'
        WHEN Total >= 5 THEN 'Alto Valor'
        ELSE 'Revisar'
    END AS Total_Class
FROM
    Invoice c

--ejemplo de join

SELECT
    c.FirstName,
    SUM(i.Total)
FROM
    Invoice i
JOIN Customer c
    ON i.CustomerId = c.CustomerId
GROUP BY c.FirstName


-------------------------------
cheat sheet
-----------------------------

====================================================================================================
                                      GUÍA RÁPIDA DE SQL
====================================================================================================

----------------------------------------------------------------------------------------------------
1. QUERYING DATA FROM A TABLE
----------------------------------------------------------------------------------------------------

| COMANDO SQL                                          | DESCRIPCIÓN                               |
|------------------------------------------------------|-------------------------------------------|
| SELECT c1, c2 FROM t;                                | Query data in columns c1, c2 from a table |
|                                                      |                                           |
| SELECT * FROM t;                                     | Query all rows and columns from a table   |
|                                                      |                                           |
| SELECT c1, c2 FROM t                                 | Query data and filter rows with a         |
| WHERE condition;                                     | condition                                 |
|                                                      |                                           |
| SELECT DISTINCT c1 FROM t                            | Query distinct rows from a table          |
| WHERE condition;                                     |                                           |
|                                                      |                                           |
| SELECT c1, c2 FROM t                                 | Sort the result set in ascending or       |
| ORDER BY c1 ASC [DESC];                              | descending order                          |
|                                                      |                                           |
| SELECT c1, c2 FROM t                                 | Skip offset of rows and return the next   |
| ORDER BY c1 LIMIT n OFFSET offset;                   | n rows                                    |
|                                                      |                                           |
| SELECT c1, aggregate(c2)                             | Group rows using an aggregate function    |
| FROM t GROUP BY c1;                                  |                                           |
|                                                      |                                           |
| SELECT c1, aggregate(c2) FROM t                      | Filter groups using HAVING clause         |
| GROUP BY c1 HAVING condition;                        |                                           |
----------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------
2. QUERYING FROM MULTIPLE TABLES
----------------------------------------------------------------------------------------------------

| COMANDO SQL                                          | DESCRIPCIÓN                               |
|------------------------------------------------------|-------------------------------------------|
| SELECT c1, c2 FROM t1                                | Inner join t1 and t2                      |
| INNER JOIN t2 ON condition;                          |                                           |
|                                                      |                                           |
| SELECT c1, c2 FROM t1                                | Left join t1 and t1                       |
| LEFT JOIN t2 ON condition;                           |                                           |
|                                                      |                                           |
| SELECT c1, c2 FROM t1                                | Right join t1 and t2                      |
| RIGHT JOIN t2 ON condition;                          |                                           |
|                                                      |                                           |
| SELECT c1, c2 FROM t1                                | Perform full outer join                   |
| FULL OUTER JOIN t2 ON condition;                     |                                           |
|                                                      |                                           |
| SELECT c1, c2 FROM t1                                | Produce a Cartesian product of rows       |
| CROSS JOIN t2;                                       | in tables                                 |
|                                                      |                                           |
| SELECT c1, c2 FROM t1, t2;                           | Another way to perform cross join         |
|                                                      |                                           |
| SELECT c1, c2 FROM t1 A                              | Join t1 to itself using INNER JOIN clause |
| INNER JOIN t2 B ON condition;                        |                                           |
----------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------
3. USING SQL OPERATORS
----------------------------------------------------------------------------------------------------

| COMANDO SQL                                          | DESCRIPCIÓN                               |
|------------------------------------------------------|-------------------------------------------|
| SELECT c1, c2 FROM t1 UNION [ALL]                    | Combine rows from two queries             |
| SELECT c1, c2 FROM t2;                               |                                           |
|                                                      |                                           |
| SELECT c1, c2 FROM t1 INTERSECT                      | Return the intersection of two queries    |
| SELECT c1, c2 FROM t2;                               |                                           |
|                                                      |                                           |
| SELECT c1, c2 FROM t1 MINUS                          | Subtract a result set from another        |
| SELECT c1, c2 FROM t2;                               | result set                                |
|                                                      |                                           |
| SELECT c1, c2 FROM t1                                | Query rows using pattern matching %, _    |
| WHERE c1 [NOT] LIKE pattern;                         |                                           |
|                                                      |                                           |
| SELECT c1, c2 FROM t1                                | Query rows in a list                      |
| WHERE c1 [NOT] IN value_list;                        |                                           |
|                                                      |                                           |
| SELECT c1, c2 FROM t1                                | Query rows between two values             |
| WHERE c1 BETWEEN low AND high;                       |                                           |
|                                                      |                                           |
| SELECT c1, c2 FROM t1                                | Check if values in a table is NULL or not |
| WHERE c1 IS [NOT] NULL;                              |                                           |
----------------------------------------------------------------------------------------------------





====================================================================================================
                                     GUÍA RÁPIDA DE SQL (PARTE 2)
====================================================================================================

----------------------------------------------------------------------------------------------------
1. MANAGING TABLES (GESTIÓN DE TABLAS)
----------------------------------------------------------------------------------------------------


| COMANDO SQL                                          | DESCRIPCIÓN                               |
|------------------------------------------------------|-------------------------------------------|
| CREATE TABLE t (                                     | Create a new table with three columns     |
|     id INT PRIMARY KEY,                              |                                           |
|     name VARCHAR NOT NULL,                           |                                           |
|     price INT DEFAULT 0                              |                                           |
| );                                                   |                                           |
|                                                      |                                           |
| DROP TABLE t;                                        | Delete the table from the database        |
|                                                      |                                           |
| ALTER TABLE t ADD column;                            | Add a new column to the table             |
|                                                      |                                           |
| ALTER TABLE t DROP COLUMN c;                         | Drop column c from the table              |
|                                                      |                                           |
| ALTER TABLE t ADD constraint;                        | Add a constraint                          |
|                                                      |                                           |
| ALTER TABLE t DROP constraint;                       | Drop a constraint                         |
|                                                      |                                           |
| ALTER TABLE t1 RENAME TO t2;                         | Rename a table from t1 to t2              |
|                                                      |                                           |
| ALTER TABLE t1 RENAME c1 TO c2;                      | Rename column c1 to c2                    |
|                                                      |                                           |
| TRUNCATE TABLE t;                                    | Remove all data in a table                |
----------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------
2. USING SQL CONSTRAINTS (RESTRICCIONES)
----------------------------------------------------------------------------------------------------


| COMANDO SQL                                          | DESCRIPCIÓN                               |
|------------------------------------------------------|-------------------------------------------|
| CREATE TABLE t (                                     | Set c1 and c2 as a primary key            |
|     c1 INT, c2 INT, c3 VARCHAR,                      |                                           |
|     PRIMARY KEY (c1, c2)                             |                                           |
| );                                                   |                                           |
|                                                      |                                           |
| CREATE TABLE t1 (                                    | Set c2 column as a foreign key            |
|     c1 INT PRIMARY KEY, c2 INT,                      |                                           |
|     FOREIGN KEY (c2) REFERENCES t2(c2)               |                                           |
| );                                                   |                                           |
|                                                      |                                           |
| CREATE TABLE t (                                     | Make the values in c1 and c2 unique       |
|     c1 INT, c1 INT,                                  |                                           |
|     UNIQUE(c2, c3)                                   |                                           |
| );                                                   |                                           |
|                                                      |                                           |
| CREATE TABLE t (                                     | Ensure c1 > 0 and values in c1 >= c2      |
|     c1 INT, c2 INT,                                  |                                           |
|     CHECK(c1 > 0 AND c1 >= c2)                       |                                           |
| );                                                   |                                           |
|                                                      |                                           |
| CREATE TABLE t (                                     | Set values in c2 column not NULL          |
|     c1 INT PRIMARY KEY,                              |                                           |
|     c2 VARCHAR NOT NULL                              |                                           |
| );                                                   |                                           |
----------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------
3. MODIFYING DATA (MODIFICACIÓN DE DATOS)
----------------------------------------------------------------------------------------------------


| COMANDO SQL                                          | DESCRIPCIÓN                               |
|------------------------------------------------------|-------------------------------------------|
| INSERT INTO t(column_list)                           | Insert one row into a table               |
| VALUES(value_list);                                  |                                           |
|                                                      |                                           |
| INSERT INTO t(column_list)                           | Insert multiple rows into a table         |
| VALUES(v1), (v2), (v3);                              |                                           |
|                                                      |                                           |
| INSERT INTO t1(column_list)                          | Insert rows from t2 into t1               |
| SELECT column_list FROM t2;                          |                                           |
|                                                      |                                           |
| UPDATE t                                             | Update new value in the column c1 for     |
| SET c1 = new_value;                                  | all rows                                  |
|                                                      |                                           |
| UPDATE t                                             | Update values in the column c1, c2 that   |
| SET c1 = v1, c2 = v2                                 | match the condition                       |
| WHERE condition;                                     |                                           |
|                                                      |                                           |
| DELETE FROM t;                                       | Delete all data in a table                |
|                                                      |                                           |
| DELETE FROM t                                        | Delete subset of rows in a table          |
| WHERE condition;                                     |                                           |
----------------------------------------------------------------------------------------------------
