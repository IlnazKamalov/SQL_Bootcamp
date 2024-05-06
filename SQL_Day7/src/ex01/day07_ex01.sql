select person.name, count(person_id) as count_of_visits 
from  person_visits
	inner join person on person.id = person_visits.person_id
group by person.name
order by count_of_visits desc, name asc
limit 4
