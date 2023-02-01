--1
select
      i.inspection_id
    , i.inspection_date
    , i.inspection_type
    , e.dba_name
    , i.license_no
    , v.fine
    , sum(v.fine) over (partition by e.license_no) as total_fine
from inspection i
inner join establishment e
    on i.license_no = e.license_no
inner join violation v
    on i.inspection_id = v.inspection_id
where lower(facility_type) like '%mobile food preparer%'
order by license_no;

--2
select
      i.inspection_id
    , i.inspection_date
    , i.inspection_type
    , e.dba_name
    , i.license_no
    , v.fine
    , sum(v.fine) over (partition by e.license_no) as total_fine
    , sum(v.fine) over(partition by e.license_no order by inspection_date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) as running_total
from inspection i
inner join establishment e
    on i.license_no = e.license_no
inner join violation v
    on i.inspection_id = v.inspection_id
where lower(facility_type) like '%mobile food preparer%'
order by license_no


--3
select
      i.inspection_id
    , i.inspection_date
    , i.inspection_type
    , e.dba_name
    , i.license_no
    , v.fine
    , sum(v.fine) over (partition by e.license_no) as total_fine
    , sum(v.fine) over(partition by e.license_no order by inspection_date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) as running_total
    , sum(v.fine) over() as mobile_total

from inspection i
inner join establishment e
    on i.license_no = e.license_no
inner join violation v
    on i.inspection_id = v.inspection_id
where lower(facility_type) like '%mobile food preparer%'
order by license_no


--4
select
      i.inspection_id
    , i.inspection_date
    , est.dba_name
    , est.facility_type
    , v.fine
    , sum(fine) over (partition by facility_type) as facility_type_total
from employee e
inner join inspection i
    on e.employee_id = i.employee_id
inner join establishment est
    on i.license_no = est.license_no
inner join violation v
    on i.inspection_id = v.inspection_id
where e.first_name = 'Cecelia'
    and e.last_name = 'Glenn'
order by inspection_date

--5
select
      i.inspection_id
    , i.inspection_date
    , est.dba_name
    , est.facility_type
    , est.risk_level
    , v.fine
    , sum(fine) over (partition by facility_type) as facility_type_total
    , sum(fine) over (partition by est.license_no, est.risk_level) as risk_level_total
from employee e
inner join inspection i
    on e.employee_id = i.employee_id
inner join establishment est
    on i.license_no = est.license_no
inner join violation v
    on i.inspection_id = v.inspection_id
where e.first_name = 'Cecelia'
    and e.last_name = 'Glenn'
order by est.license_no, est.risk_level


--6
select
      i.inspection_id
    , i.inspection_date
    , est.dba_name
    , est.facility_type
    , est.risk_level
    , v.fine
    , sum(fine) over (partition by facility_type) as facility_type_total
    , sum(fine) over (partition by est.license_no, est.risk_level) as risk_level_total
    , sum(fine) over (partition by e.employee_id) as employee_running_total
from employee e
inner join inspection i
    on e.employee_id = i.employee_id
inner join establishment est
    on i.license_no = est.license_no
inner join violation v
    on i.inspection_id = v.inspection_id
where e.first_name = 'Cecelia'
    and e.last_name = 'Glenn'
order by est.license_no, est.risk_level


--7
select
      i.inspection_id
    , i.inspection_date
    , est.dba_name
    , est.facility_type
    , est.risk_level
    , v.fine
    , sum(fine) over (partition by facility_type) as facility_type_total
    , sum(fine) over (partition by est.license_no, est.risk_level) as risk_level_total
    , sum(fine) over (partition by e.employee_id) as employee_running_total
    , sum(v.fine) over(partition by e.employee_id order by inspection_date ROWS BETWEEN 9 PRECEDING AND CURRENT ROW) as trailing_ten_average

from employee e 
inner join inspection i
    on e.employee_id = i.employee_id
inner join establishment est
    on i.license_no = est.license_no
inner join violation v
    on i.inspection_id = v.inspection_id
where e.first_name = 'Cecelia'
    and e.last_name = 'Glenn'
order by inspection_date


--8
select
      i.inspection_id
    , i.inspection_date
    , i.employee_id
    , est.dba_name
    , est.facility_type
    , v.fine
    , sum(fine) over (partition by e.employee_id order by inspection_date rows between unbounded preceding and current row) as employee_running_total
from inspection i
inner join establishment est
    on i.license_no = est.license_no
inner join violation v
    on i.inspection_id = v.inspection_id
inner join employee e
    on i.employee_id = e.employee_id
where i.inspection_date between TO_DATE('01/12/2012', 'DD/MM/YYYY') AND TO_DATE('31/12/2012', 'DD/MM/YYYY')
order by inspection_date, e.last_name, e.first_name, est.dba_name

--9
select
      i.inspection_id
    , i.inspection_date
    , i.employee_id
    , est.dba_name
    , est.facility_type
    , v.fine
    , sum(fine) over (partition by e.employee_id order by inspection_date rows between unbounded preceding and current row) as employee_running_total 
    , sum(fine) over () as grand_total

from inspection i
inner join establishment est
    on i.license_no = est.license_no
inner join violation v
    on i.inspection_id = v.inspection_id
inner join employee e
    on i.employee_id = e.employee_id
where i.inspection_date between TO_DATE('01/12/2012', 'DD/MM/YYYY') AND TO_DATE('31/12/2012', 'DD/MM/YYYY')
order by inspection_date, e.last_name, e.first_name, est.dba_name


--10
select
      i.inspection_id
    , i.inspection_date
    , i.employee_id
    , est.dba_name
    , est.facility_type
    , v.fine
    , sum(fine) over (partition by e.employee_id order by inspection_date rows between unbounded preceding and current row) as employee_running_total 
    , sum(fine) over () as grand_total
    , sum(fine) over (partition by facility_type) as facility_type_total
from inspection i
inner join establishment est
    on i.license_no = est.license_no
inner join violation v
    on i.inspection_id = v.inspection_id
inner join employee e
    on i.employee_id = e.employee_id
where i.inspection_date between TO_DATE('01/12/2012', 'DD/MM/YYYY') AND TO_DATE('31/12/2012', 'DD/MM/YYYY')
order by inspection_date, e.last_name, e.first_name, est.dba_name