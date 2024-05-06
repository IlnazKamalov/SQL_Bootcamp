select
	address,
	trim_scale(round((max(age::numeric)-min(age::numeric)/max(age)),2)) as formula,
	trim_scale(round(avg(age),2)) as average,
	(select
		case
			when(max(age)-(min(age)/max(age))) > avg(age)
			then true
			else false
		end
	) as comparison
from person
group by address
order by address
