USE [DSTRAINING]
GO
/****** Object:  StoredProcedure [dbo].[BLD_WRK_VehicleService]    Script Date: 8/18/2019 11:54:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[BLD_WK_VehicleService]
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

AS
BEGIN

----===================
 ---DROP TABLE
----===================

IF OBJECT_ID('WK_VehicleService') IS NOT NULL
DROP TABLE [WK_VehicleService]

----====================
---CREATE TABLE
----====================
CREATE TABLE [WK_VehicleService]

(

       [RowNumber]         INT IDENTITY(1,1)
      ,[CustomerID]        VARCHAR(100)
      ,[CustomerSince]     DATE
      ,[Vehicle]           VARCHAR(100)
      ,[2014]              FLOAT
      ,[2015]              FLOAT
      ,[2016E]             FLOAT
      
)

---===================
---TRUNCATE TABLE----
---===================
TRUNCATE TABLE [WK_VehicleService]

---===================
--INSERT INTO
---===================
INSERT INTO [WK_VehicleService]
(
      [CustomerID]
      ,[CustomerSince]
      ,[Vehicle]
      ,[2014]
      ,[2015]
      ,[2016E]
   
)
SELECT
   [CustomerID]
      ,[CustomerSince]
      ,[Vehicle]
      ,[2014]
      ,[2015]
      ,[2016E]
FROM [RAW_VehicleService_20190818]
---EXCLUSIONS

where ISNUMERIC([2015])= 1
   or [2015] = ''
  
   
  select *
  FROM [DSTRAINING].[dbo].[RAW_VehicleService_20190818]
  where ISNUMERIC([2015])=0
   and [2015] <> ''

   ----(1049998 row(s) affected)
   ---ADITIONAL CHECKS

   SELECT  [CustomerID],count(*)
   FROM [WK_VehicleService]
   group BY  [CustomerID]
   HAVING COUNT(*) > 1

SELECT *
FROM [WK_VehicleService]
WHERE  [CustomerID] like '3490750'

SELECT *
FROM [WK_VehicleService]
Where CustomerSince < '1965-01-01'

SELECT max([2014])
FROM [WK_VehicleService]

SELECT*
FROM [WK_VehicleService]
where [2014] > 800

SELECT  sum([2016E])
from [WK_VehicleService]


END
