-- Following queries are used to create required tables for the project. 
-- We create five tables:
-- 1. Product
-- 2. Maintabletransient
-- 3. History
-- 4. Shelf
-- 5. Inventory

CREATE DATABASE trends;
USE DATABASE trends;

CREATE EXTERNAL TABLE IF NOT EXISTS trends.MainTableTransient (
  `productID` int,
  `productName` string,
  `shelfID` int,
  `productQuantity` int,
  `currentDate` date,
  `currentTime` timestamp 
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'serialization.format' = ',',
  'field.delim' = ','
) LOCATION 's3://trendsdatabase/Main_table/'
TBLPROPERTIES ('has_encrypted_data'='false');

CREATE EXTERNAL TABLE IF NOT EXISTS trends.History (
  `productID` int,
  `productName` string,
  `shelfID` int,
  `productQuantity` int,
  `currentDate` date,
  `currentTime` timestamp 
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'serialization.format' = ',',
  'field.delim' = ','
) LOCATION 's3://trendsdatabase/History/'
TBLPROPERTIES ('has_encrypted_data'='false');


CREATE EXTERNAL TABLE IF NOT EXISTS trends.Inventory (
  `productID` int,
  `productName` string,
  `totalQuantity` int
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'serialization.format' = ',',
  'field.delim' = ','
) LOCATION 's3://trendsdatabase/Inventory/'
TBLPROPERTIES ('has_encrypted_data'='false');

CREATE EXTERNAL TABLE IF NOT EXISTS trends.Shelf (
  `shelfID` int,
  `productID` string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'serialization.format' = ',',
  'field.delim' = ','
) LOCATION 's3://trendsdatabase/Shelf/'
TBLPROPERTIES ('has_encrypted_data'='false');

CREATE EXTERNAL TABLE IF NOT EXISTS trends.Product (
  `productID` int,
  `productName` string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'serialization.format' = ',',
  'field.delim' = ','
) LOCATION 's3://trendsdatabase/Product/'
TBLPROPERTIES ('has_encrypted_data'='false');
