/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [RowNumber]
      ,[CustomerID]
      ,[CustomerSince]
      ,[Vehicle]
      ,[2014]
      ,[2015]
      ,[2016E]
      ,[Column 6]
  FROM [DSTRAINING].[dbo].[RAW_VehicleService_20190818]

  where[Column 6] <> ' '

  select * 
   from [DSTRAINING].[dbo].[RAW_VehicleService_20190818]
   where ISNUMERIC([2014]) = 0
   and [2014] <> ''

    select * 
   from [DSTRAINING].[dbo].[RAW_VehicleService_20190818]
   where ISNUMERIC([2015]) = 0
   and [2015] <> ''

    select * 
   from [DSTRAINING].[dbo].[RAW_VehicleService_20190818]
   where ISNUMERIC([2016E]) = 0
   and [2016E] <> ''