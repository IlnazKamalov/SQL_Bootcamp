create or replace function fnc_trg_person_delete_audit() returns trigger as $person_audit$
begin
	if (tg_op = 'DELETE') then
		insert into person_audit 
		values(current_timestamp, 'D', old.id, old.name, old.age, old.gender, old.address);
	end if;
	return null;
end;
$person_audit$ language plpgsql;

--trigger
create trigger trg_person_delete_audit
after delete on person 
for each row
	execute function fnc_trg_person_delete_audit();

--check
DELETE FROM person WHERE id = 10;
select * from person;
select * from person_audit;
