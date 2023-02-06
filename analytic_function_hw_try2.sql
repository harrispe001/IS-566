--Full Points
--1
select
      inspection_id
    , inspection_date
    , inspection_type
    , dba_name
    , license_no
    , fine
    , sum(fine) over (partition by license_no) as total_fine
from inspection_summary
where lower(facility_type) like '%mobile food preparer%'
order by license_no;

--3
select
      inspection_id
    , inspection_date
    , inspection_type
    , dba_name
    , license_no
    , fine
    , sum(fine) over (partition by license_no) as total_fine
    , sum(fine) over(partition by license_no order by inspection_date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) as running_total
    , sum(fine) over() as mobile_total

from inspection_summary
where lower(facility_type) like '%mobile food preparer%'
order by license_no;

--4
select
      inspection_id
    , inspection_date
    , dba_name
    , facility_type
    , fine
    , sum(fine) over (partition by facility_type) as facility_type_total
from inspection_summary
-- where first_name = 'Cecelia'
--     and last_name = 'Glenn'
where employee = 'Cecelia Glenn'
order by inspection_date

--6
select
      inspection_id
    , inspection_date
    , dba_name
    , facility_type
    , fine
    , sum(fine) over (partition by facility_type) as facility_type_total
    , sum(fine) over (partition by license_no, risk_level) as risk_level_total
    , sum(fine) over (partition by employee_id order by inspection_date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) as employee_running_total
from inspection_summary
-- where first_name = 'Cecelia'
--     and last_name = 'Glenn'
where employee = 'Cecelia Glenn'
order by inspection_date

--10
select
      inspection_id
    , inspection_date
    , employee_id
    , dba_name
    , facility_type
    , fine
    , sum(fine) over (partition by employee_id order by inspection_date rows between unbounded preceding and current row) as employee_running_total
    , sum(fine) over() as grand_total
    , sum(fine) over (partition by facility_type) as facility_type_total
from inspection_summary
where inspection_date between TO_DATE('01/12/2012', 'DD/MM/YYYY') AND TO_DATE('31/12/2012', 'DD/MM/YYYY')
order by inspection_date, employee, dba_name


--Partial Points
--2 fixed?
select
      inspection_id
    , inspection_date
    , inspection_type
    , dba_name
    , license_no
    , fine
    , sum(fine) over (partition by license_no) as total_fine
    , sum(fine) over(partition by license_no order by inspection_date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) as running_fine

from inspection_summary
where lower(facility_type) like '%mobile food preparer%'
order by license_no;

--5
select
      inspection_id
    , inspection_date
    , dba_name
    , facility_type
    , fine
    , sum(fine) over (partition by facility_type) as facility_type_total
    , sum(fine) over (partition by license_no, risk_level) as risk_level_total
from inspection_summary
-- where first_name = 'Cecelia'
--     and last_name = 'Glenn'
where employee = 'Cecelia Glenn'
order by inspection_date

--7
select
      inspection_id
    , inspection_date
    , dba_name
    , facility_type
    , fine
    , sum(fine) over (partition by facility_type) as facility_type_total
    , sum(fine) over (partition by license_no, risk_level) as risk_level_total
    , sum(fine) over (partition by employee_id order by inspection_date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) as employee_running_total
    , round(sum(fine) over(partition by employee_id order by inspection_date ROWS BETWEEN 9 PRECEDING AND CURRENT ROW) / 10) as trailing_ten_average
from inspection_summary
-- where first_name = 'Cecelia'
--     and last_name = 'Glenn'
where employee = 'Cecelia Glenn'
order by inspection_date

--8
select
      inspection_id
    , inspection_date
    , employee
    , dba_name
    , facility_type
    , fine
    , sum(fine) over (partition by employee_id order by inspection_date rows between unbounded preceding and current row) as employee_running_total
from inspection_summary
where inspection_date between TO_DATE('01/12/2012', 'DD/MM/YYYY') AND TO_DATE('31/12/2012', 'DD/MM/YYYY')
order by inspection_date, employee, dba_name

--9
select
      inspection_id
    , inspection_date
    , employee
    , dba_name
    , facility_type
    , fine
    , sum(fine) over (partition by employee_id order by inspection_date rows between unbounded preceding and current row) as employee_running_total
    , sum(fine) over() as grand_total

from inspection_summary
where inspection_date between TO_DATE('01/12/2012', 'DD/MM/YYYY') AND TO_DATE('31/12/2012', 'DD/MM/YYYY')
order by inspection_date, employee, dba_name