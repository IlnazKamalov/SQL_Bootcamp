select menu.id
from menu
where id not in (select menu_id from person_order)
order by menu;
