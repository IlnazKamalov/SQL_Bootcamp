select p.name, count(p.id) as count_of_visits
from person_visits pv
join person p on p.id = pv.person_id
group by p.id
having count(p.id) > 3
