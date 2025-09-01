use AdventureWorksDW2012



/*SELECT 
    c.FirstName,
    c.LastName,
    SUM(f.SalesAmount) AS TotalSales
FROM FactInternetSales f
LEFT JOIN DimCustomer c ON f.CustomerKey = c.CustomerKey
GROUP BY c.FirstName, c.LastName
HAVING SUM(f.SalesAmount) > (
    SELECT AVG(T.CustomerSales)   
    FROM (
        SELECT SUM(SalesAmount) AS CustomerSales   
        FROM FactInternetSales
        GROUP BY CustomerKey t 
  */
  -- Her ürünün (DimProduct) ortalama ListPrice deðerini bul ve CTE kullanarak ortalamanýn üzerinde olan ürünleri listele.
  
  /*;with productavg as
  (select AVG(ListPrice) avgListPrice from DimProduct  )
  select p.ProductKey, p.EnglishProductName, p.ListPrice
  from DimProduct p 
 Cross join productavg pa 
 Where p.ListPrice > pa.avgListPrice; 
*/



-- --Her müþterinin (FactInternetSales üzerinden) toplam satýþ miktarýný (SalesAmount) hesapla. 
--Sonra CTE kullanarak en yüksek satýþ yapan ilk 10 müþteriyi listele.

/*;WITH CustomerSales AS (
    SELECT 
        f.CustomerKey,
        SUM(f.SalesAmount) AS TotalSales
    FROM FactInternetSales f
    GROUP BY f.CustomerKey
)
SELECT TOP 10 
    c.FirstName, 
    c.LastName, 
    cs.TotalSales
FROM CustomerSales cs
INNER JOIN DimCustomer c ON c.CustomerKey = cs.CustomerKey
ORDER BY cs.TotalSales DESC;*/

;

--Her yýl (DimDate.CalendarYear) için toplam satýþ (SalesAmount) deðerini bul.
--CTE kullanarak tüm yýllarýn ortalamasýndan fazla satýþ yapýlan yýllarý getir.

/*;With AVGSales as 
(select d.CalendarYear,SUM(f.SalesAmount) as TotalSales from FactInternetSales f 
inner join DimDate d on f.OrderDateKey = d.DateKey
Group By d.CalendarYear ) ,

OverallAvg as (select AVG(AVS.TotalSales) as AVGSALES from AVGSales as AVS)

select a.CalendarYear , a.TotalSales from AVGSales a 
cross join OverallAvg o 
where a.TotalSales > o.AVGSALES ;
*/

--Her kategorinin (DimProductCategory) toplam satýþ miktarýný (FactInternetSales üzerinden SalesAmount) bul. 
--Sonra CTE kullanarak tüm kategorilerin ortalamasýnýn üstünde satýþ yapan kategorileri listele.
 
 /*; With CategorySales as
(Select pc.EnglishProductCategoryName ,SUM(f.SalesAmount) as TotalSales from FactInternetSales f 
inner join DimProduct p on f.ProductKey = p.ProductKey
inner join DimProductSubcategory ps on p.ProductSubcategoryKey = ps.ProductSubcategoryKey
inner join DimProductCategory pc on ps.ProductCategoryKey = pc.ProductCategoryKey
Group By pc.EnglishProductCategoryName ),

 AvgCategorySales as (select  cs.EnglishProductCategoryName , AVG(cs.TotalSales) as AVGCategorySales from CategorySales cs
Group By EnglishProductCategoryName) 

select cs.EnglishProductCategoryName ,cs.TotalSales from  CategorySales cs 
cross join AvgCategorySales a 
Where cs.TotalSales > a.AVGCategorySales; 
*/




