select days.date as missing_date
from generate_series('2022-01-01', '2022-01-10', interval '1 day') as days
full join
    (select *
    from person_visits where person_id = 1 or person_id = 2
    and visit_date between '2022-01-01' and '2022-01-10') as day
on days = day.visit_date
where day.person_id is null
order by days;
