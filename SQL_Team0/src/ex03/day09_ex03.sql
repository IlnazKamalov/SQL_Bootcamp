create or replace function fnc_trg_person_audit() returns trigger as $person_audit$
begin
	if (tg_op = 'INSERT') then
        insert into person_audit 
		values(current_timestamp, 'I', new.id, new.name, new.age, new.gender, new.address); 
    elsif (tg_op = 'UPDATE') then
        insert into person_audit
		values(current_timestamp, 'U', old.id, old.name, old.age, old.gender, old.address);
    elsif (tg_op = 'DELETE' or tg_op = 'TRUNCATE') then
        insert into person_audit
		values(current_timestamp, 'D', old.id, old.name, old.age, old.gender, old.address);
    end if;
	return null;
end;
$person_audit$ language plpgsql;

--trigger
create trigger trg_person_audit
after insert or update or delete on person 
for each row
	execute function fnc_trg_person_audit();

--drop
drop trigger if exists trg_person_insert_audit on person;
drop trigger if exists trg_person_update_audit on person;
drop trigger if exists trg_person_delete_audit on person;
drop function if exists fnc_trg_person_insert_audit;
drop function if exists fnc_trg_person_update_audit;
drop function if exists fnc_trg_person_delete_audit;
delete from person_audit where true;

--check
INSERT INTO person(id, name, age, gender, address) 
	VALUES (10,'Damir', 22, 'male', 'Irkutsk');
UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;
DELETE FROM person WHERE id = 10;
