--1
select
    sale.*
from sale
left join product
    on sale.productId = product.productId
where product.category = 'slippers'

--2
select
    sale.*
    , (sale.saleDate)
from sale
left join product
    on sale.productId = product.productId
where product.category in ('slippers', 'casual shoes')
    and substr(sale.saleDate, 1, 2) = '10'

--3
select
    s.*
    -- , p.category
    -- , p.color
from sale s
left join product p
    on s.productId = p.productId
where p.category = 'sneakers'
    and p.color = 'Green';

--4
select
      s.*
    , p.productName
    , p.category
    , p.color
from sale s
left join product p
    on s.productId = p.productId
where p.category in ('sneakers', 'sandals')
    and p.color = 'Green'

--5
select distinct
    c.state
from sale s
left join customer c
    on s.customerId = c.customerId
where EXTRACT(Year from s.saledate) = 2015
    and EXTRACT(Month from s.saledate) = 01
order by c.state

--do you need a distinct?

--6
select distinct
    m.manufacturerName
from manufacturer m
left join product p
    on m.manufacturerId = p.manufacturerId
where p.price >= 50
    and category = 'heels'
    
--do you need a distinct?

--7
select distinct
      p.category
    , p.color
from product p
left join manufacturer m
    on p.manufacturerId = m.manufacturerId
where m.manufacturerName = 'Puma'
order by color

--8
select distinct
    p.category
from product p
left join sale s
    on p.productId = s.productId
where EXTRACT(Year from s.saleDate) = 2014
    and EXTRACT(Month from s.saleDate) = 01

--9
select
      c.firstName
    , c.lastName
    , s.quantity
from customer c
left join sale s
    on c.customerId = s.customerId
where c.state = 'CA'
    and EXTRACT(Year from s.saleDate) = 2015
    and EXTRACT(Month from s.saleDate) = 01

--10
select distinct
      c.firstName
    , c.lastName
from customer c
inner join sale s
    on c.customerId = s.customerId
where c.state = 'WA'

--need distinct?