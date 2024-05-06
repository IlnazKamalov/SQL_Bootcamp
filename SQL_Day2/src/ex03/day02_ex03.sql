with cte_missing_date(missing_date) as
(select days.date as missing_date
from generate_series('2022-01-01', '2022-01-10', interval '1 day') as days)
select missing_date
	from cte_missing_date
full join
    (select *
    from person_visits where person_id = 1 or person_id = 2
    and visit_date between '2022-01-01' and '2022-01-10') as day
on missing_date  = day.visit_date
where day.person_id is null
order by missing_date
