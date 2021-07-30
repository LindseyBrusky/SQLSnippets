select
	(((ROW_NUMBER() OVER(ORDER BY table_name))-1)*12)+1 as rowNumber,
	'ALTER TABLE dbo.' + table_name + ' ADD SystemStartTime datetime2, SystemEndTime datetime2'
from INFORMATION_SCHEMA.TABLES
UNION SELECT 
	(((ROW_NUMBER() OVER(ORDER BY table_name))-1)*12)+2 as rowNumber,
	'GO'
from INFORMATION_SCHEMA.TABLES
UNION SELECT 
	(((ROW_NUMBER() OVER(ORDER BY table_name))-1)*12)+3 as rowNumber,
	'UPDATE dbo.' + table_name + ' SET SystemStartTime = ''19000101 00:00:00.0000000'', SystemEndTime = ''99991231 23:59:59.9999999'''
from INFORMATION_SCHEMA.TABLES
UNION SELECT 
	(((ROW_NUMBER() OVER(ORDER BY table_name))-1)*12)+4 as rowNumber,
	'GO'
from INFORMATION_SCHEMA.TABLES
UNION SELECT 
	(((ROW_NUMBER() OVER(ORDER BY table_name))-1)*12)+5 as rowNumber,
	'ALTER TABLE dbo.' + table_name + ' ALTER COLUMN SystemStartTime DATETIME2 NOT NULL'
from INFORMATION_SCHEMA.TABLES
UNION SELECT 
	(((ROW_NUMBER() OVER(ORDER BY table_name))-1)*12)+6 as rowNumber,
	'GO'
from INFORMATION_SCHEMA.TABLES
UNION SELECT 
	(((ROW_NUMBER() OVER(ORDER BY table_name))-1)*12)+7 as rowNumber,
	'ALTER TABLE dbo.' + table_name + ' ALTER COLUMN  SystemEndTime DATETIME2 NOT NULL'
from INFORMATION_SCHEMA.TABLES
UNION SELECT 
	(((ROW_NUMBER() OVER(ORDER BY table_name))-1)*12)+8 as rowNumber,
	'GO'
from INFORMATION_SCHEMA.TABLES
UNION SELECT 
	(((ROW_NUMBER() OVER(ORDER BY table_name))-1)*12)+9 as rowNumber,
	'ALTER TABLE dbo.' + table_name + ' ADD PERIOD FOR SYSTEM_TIME (SystemStartTime, SystemEndTime)'
from INFORMATION_SCHEMA.TABLES
UNION SELECT 
	(((ROW_NUMBER() OVER(ORDER BY table_name))-1)*12)+10 as rowNumber,
	'GO'
from INFORMATION_SCHEMA.TABLES
UNION SELECT 
	(((ROW_NUMBER() OVER(ORDER BY table_name))-1)*12)+11 as rowNumber,
	'ALTER TABLE dbo.' + table_name + ' SET(SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.' + table_name + 'History, DATA_CONSISTENCY_CHECK = ON))'
from INFORMATION_SCHEMA.TABLES
UNION SELECT 
	(((ROW_NUMBER() OVER(ORDER BY table_name))-1)*12)+12 as rowNumber,
	'GO'
from INFORMATION_SCHEMA.TABLES
ORDER BY rowNumber