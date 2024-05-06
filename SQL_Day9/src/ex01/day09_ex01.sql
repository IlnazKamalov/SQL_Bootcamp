create or replace function fnc_trg_person_update_audit() returns trigger as $person_audit$
begin
	if (tg_op = 'UPDATE') then
		insert into person_audit 
		values(current_timestamp, 'U', old.id, old.name, old.age, old.gender, old.address);
	end if;
	return null;
end;
$person_audit$ language plpgsql;

--trigger
create trigger trg_person_update_audit
after update on person 
for each row
	execute function fnc_trg_person_update_audit();

--check
UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;
select * from person;
select * from person_audit;
