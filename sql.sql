--Problem 1--
select  Name, ListPrice
from Production.Product;

--problem 2--
select p.FirstName,e.EmailAddress,a.City
into New_Customertable
from Person.Person p
join Person.EmailAddress e ON p.BusinessEntityID = e.BusinessEntityID
join Person.Address a ON p.BusinessEntityID = a.AddressID
join Sales.Customer c ON p.BusinessEntityID = c.PersonID;
select  FirstName,EmailAddress,City from New_Customertable where city='seattle';

--problem 3--
select*from sales.SalesOrderDetail
select*from production.Product
select p.Name as ProductName, SUM(SalesOrderDetail.LineTotal) As TotalSalesAmount
from Sales.SalesOrderDetail 
join Production.Product as p on SalesOrderDetail.ProductID = p.ProductID
where SalesOrderDetail.ProductID = 793
group by p.Name;

--problem 4--
select HumanResources.Department.name ,HumanResources.Employee.jobtitle
from HumanResources.Department 
inner join HumanResources.Employee
on HumanResources.Department.DepartmentID=HumanResources.Employee.BusinessEntityID
order by JobTitle asc;

--problem 5--
Select Production.Product.Name as ProductName,sales.SalesOrderDetail.OrderQty as Quantity
From Sales.SalesOrderHeader 
join Sales.SalesOrderDetail  on sales.SalesOrderHeader.SalesOrderID = sales.SalesOrderDetail.SalesOrderID
join Production.Product  on sales.SalesOrderDetail.ProductID = production.product.ProductID
where sales.SalesOrderHeader.CustomerID = 29485;

--problem 6--
select sales.SalesOrderHeader.SalesOrderID as OrderNumber,sales.SalesOrderHeader.OrderDate,
concat(person.person.FirstName, ' ', person.person.LastName) as CustomerName
from Sales.SalesOrderHeader
join person.Person  on person.person.BusinessEntityID = sales.SalesOrderHeader.SalesPersonID
where sales.SalesOrderHeader.SalesPersonID = 276;

--problem 7--
Select person.person.FirstName as Name,person.person.LastName as LastName,person.EmailAddress.EmailAddress as Email
From Person.Person 
join Person.EmailAddress  on person.person.BusinessEntityID = person.EmailAddress.BusinessEntityID
left join Sales.SalesOrderHeader  on person.person.BusinessEntityID = sales.SalesOrderHeader.CustomerID
where sales.SalesOrderHeader.SalesOrderID is null
order by FirstName ASC;

-- problem 8--
select sub.name , avg(sd.orderqty*sd.unitprice) as avgsalesamt
from Production.Productcategory as pc
inner join Production.ProductSubcategory as sub on pc.ProductCategoryID=sub.ProductCategoryID
inner join Production.Product as pp on sub.ProductSubcategoryID=pp.ProductSubcategoryID
inner join sales.SalesOrderDetail as sd on pp.ProductID=sd.ProductID
group by sub.name;

--problem 9--
select top 10 Production.Product.Name AS ProductName,sum(Sales.SalesOrderDetail.OrderQty) as TotalQuantitySold
from Production.Product
inner join Sales.SalesOrderDetail
on Production.Product.ProductID = Sales.SalesOrderDetail.ProductID
group by Production.Product.Name
order by TotalQuantitySold desc

--problem 10--
select  SalesOrderID,OrderDate,ShipDate,ShipToAddressID
from Sales.SalesOrderHeader
where ShipDate>ShipToAddressID
order by  ShipToAddressID asc;





   



















