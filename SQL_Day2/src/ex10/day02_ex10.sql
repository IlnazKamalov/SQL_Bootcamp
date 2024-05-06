select person1.name as person_name1,
	person2.name as person_name2,
	person1.address as common_address
from person as person1
cross join person as person2
	where person1.name != person2.name
	and person1.address = person2.address
	and person1.id > person2.id
order by person_name1, person_name2, common_address
