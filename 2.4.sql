--1
select
      p.productName
    , p.category
    , m.manufacturerName
from product p
left join manufacturer m
    on p.manufacturerId = m.manufacturerId
where p.category in ('sandals', 'sneakers', 'casual shoes')
    and m.manufacturerName in ('Buyers Picks', 'Radii Footwear')

--2
select distinct
      c.city
    , c.state
from customer c
left join sale s
    on c.customerId = s.customerId
left join product p
    on p.productId = s.productId
where EXTRACT(Month from s.saleDate) = 01
    and p.category = 'boots'
order by state

--3
select distinct
      p.productName
from product p
inner join sale s
    on p.productId = s.productId
inner join customer c
    on s.customerId = c.customerId
where c.state in ('UT', 'WY', 'MT')

--4
select distinct
      c.*
from customer c
left join sale s
    on c.customerId = s.customerId
left join product p
    on p.productId = s.productId
where (s.quantity * p.price) > 150

--5
select distinct
      c.firstName
    , c.lastName
    , c.state
from customer c
left join sale s
    on c.customerId = s.customerId
left join product p
    on s.productId = p.productId
where p.price between 130 and 150

--sale price or list price for a single product

--6
select distinct
      m.manufacturerName
from manufacturer m
left join product p
    on m.manufacturerId = p.manufacturerId
left join sale s
    on p.productId = s.productId
where EXTRACT(Month from s.saleDate) = 02


--7
select
    s.*
from sale s
left join product p
    on s.productId = p.productId
left join manufacturer m
    on p.manufacturerId = m.manufacturerId
where m.manufacturerName = 'Nike'
    and color = 'White'
    and category = 'sneakers'
    
-- need to be distinct?

--8
select
      c.lastName
    , c.firstName
from customer c
left join sale s
    on c.customerId = s.customerId
left join product p
    on s.productId = p.productId
left join manufacturer m
    on p.manufacturerId = m.manufacturerId
where m.manufacturerName = 'Keds'
    and p.color = 'Black'
order by lastName, firstName;

--all categories are shoes?

--9
select distinct
      m.state
from customer c
left join sale s
    on c.customerId = s.customerId
left join product p
    on s.productId = p.productId
left join manufacturer m
    on p.manufacturerId = m.manufacturerId
where c.state = 'KS'

--10
select distinct
      p.productName
from customer c
left join sale s
    on c.customerId = s.customerId
left join product p
    on s.productId = p.productId
left join manufacturer m
    on p.manufacturerId = m.manufacturerId
where m.manufacturerName = 'Adidas'
    and c.State = 'CA'
    and EXTRACT(Month from s.saleDate ) = 08;