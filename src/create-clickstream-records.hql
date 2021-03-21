CREATE EXTERNAL TABLE IF NOT EXISTS clickstream_records (
    offset bigint,
    customer_id int,
    product_id int,
    browser_x_pos float,
    browser_y_pos float,
    date_time timestamp
)
COMMENT 'Stores all clickstream records as is'
PARTITIONED BY (
    zip_code int
)
STORED AS PARQUET
LOCATION "/data/clickstream/recordings/data"
TBLPROPERTIES ("parquet.compression"="snappy");

SET hive.msck.repair.batch.size=100000;
MSCK REPAIR TABLE clickstream_records;

-- CREATE EXTERNAL TABLE IF NOT EXISTS clickstream_records (
--     offset bigint,
--     customer_id int,
--     product_id int,
--     browser_x_pos float,
--     browser_y_pos float,
--     date_time timestamp
-- )
-- COMMENT 'Stores all clickstream records as is'
-- STORED AS PARQUET
-- LOCATION "/data/clickstream/recordings/data/zip_code=97159"
-- TBLPROPERTIES ("parquet.compression"="snappy");