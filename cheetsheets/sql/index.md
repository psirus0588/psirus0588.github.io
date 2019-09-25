## SQL

Mysql get column namers from table
```sql


    SELECT COLUMN_NAME, DATA_TYPE, IS_NULLABLE, COLUMN_DEFAULT
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE table_name = 'tbl_name'
    [AND table_schema = 'db_name']
    [AND column_name LIKE 'wild']
```
  
_short hand:_
```sql
    SHOW COLUMNS FROM tbl_name [FROM db_name] [LIKE 'wild']
```
