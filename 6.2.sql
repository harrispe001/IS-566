--1
select
      FirstName
    , LastName
from Customer
where CustomerID = 610;

--2
select
      FirstName
    , LastName
    , Phone
from Employee
where EmployeeID = 170;

--3
select
      SaleDate
    , Shipping
from Sale
where Shipping > 55;

--4
select
    *
from Sale
where SaleDate between DATE '2015-01-21' and DATE '2015-01-31';

--5
select
      FirstName
    , LastName
--    , State
from Customer
where state = 'MN'
order by LastName

--6
Select
    CustomerID
from Customer
where FirstName = 'Sam'
    and LastName = 'Gill'

--7
Select
      SaleDate
    , (Tax + Shipping) as SUM
From Sale
Where SaleDate between Date'2015-12-20' and Date'2015-12-25'

--8
select
    CustomerID
from Customer
where city in ('Chicago', 'Saint Louis', 'Baltimore', 'Newark')

--9
select
      ManufacturerName
    , City
from Manufacturer
where SUBSTR(City, 1, 1) = 'C'

--10
select
      ManufacturerName
    , City
from Manufacturer
where SUBSTR(City, -4, 4) = 'City'

--11
select
      FirstName
    , LastName
from Customer
where LOWER( SUBSTR( LastName, 3, 1 ) ) = 'd'

--12
select
    *
from Sale
where (Tax > 0) and NOT (Shipping >= 15)

--13
select
      FirstName
    , LastName    
from Employee
where (ManagerID = EmployeeID) 
    or (ManagerID is null);

--14
select
    *
from SalaryEmployee
where Salary between 40000 and 50000    

--15
select
    *
from SaleItem
where (Quantity >= 2)
    and (ItemSize in (5, 6, 7))