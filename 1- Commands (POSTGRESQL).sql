
-- 0.   Create dataBase
-- 1.1  Create table
-- 1.2  Clear table
-- 1.3  Drop table
-- 2.   Example with all (almost) variable available:

-- DDL: Data Definition Language --------------------
-- 3.  Alter: Add new column to a table
-- 4.  Alter: Column name
-- 5.  Alter: Column type
-- 6.  Alter: Set default value
-- 7.  Alter: drop default
-- 8.  Alter: Constraint NOT NULL
-- 9.  Alter: drop NOT NULL
-- 10. Alter: constraint check 
-- 11. Alter: Table name
-- 12. Alter: Drop column

-- DML: Data Manipulation Language -------------------
-- 13. Insert: All values
-- 14. Insert: Specific values
-- 15. Update: Change a value in a specific data
-- 16. Delete: Data from the table
-- 17. Delete: ALL from table

-- DQL: Data Query Language -------------------
-- 18. Select: All
-- 19. Select: where
-- 20. Select: where ... like
-- 21. Select: where ... like (%)
-- 22. Select: where ... like ('X_')
-- 23. Select: where ... not like ()
-- 24. Select: where ... and
-- 25. Select: where ... or
-- 26. Select: order by ask
-- 27. Select: order by desc
-- 28. Select: No repetion
-- 29. Select: in
-- 30. Select: between

---------------------------------------------------

-- 0. Create dataBase
create database db_test;

-- 1.1 Create table
create table tb_person1(
	
	id bigint,
	first_name varchar(50),
	middle_name varchar(50),
	last_name varchar(50),
	cpf bigint,
	phone bigint
	
)

-- 1.2 Clear table:
truncate tb_person1;

-- 1.3 Drop table:
drop table tb_person1;

-- 2. Example with all (almost) variable available:
create table tb_exemplo(

	numero_pequeno smallint,
	numero_medio int,
	numero_grande bigint,
	numero_decimal decimal,
	numero_numerico numeric,
	numero_real real,
	numero_double double precision,
	
	chv character varying(10),
	char character(10),
	val varchar(10),
	cha char(10),
	
	texto text,
	data1 timestamp,
	datatz timestamptz,
	data2 date,
	bool boolean
	
)

-- DDL: Data Definition Language --------------------

-- 3. Alter: Add new column to a table
alter table tb_person1 
add column gender boolean;

-- 4. Alter: Column name
alter table tb_person1
rename column gender
to gender_type;

-- 5. Alter: Column type
alter table tb_person1
alter column gender
type varchar(1);

-- 6. Alter: default values
alter table tb_person1
alter column middle_name
set default 'no data';

-- 7. Alter: drop default
alter table tb_person1
alter column middle_name
drop default;

-- 8. Alter: Constraint NOT NULL
alter table tb_person1
alter column first_name
set not null;

-- 9. Alter: drop NOT NULL
alter table tb_person1
alter column first_name
drop not null;

-- 10. Alter: constraint check 
alter table tb_person1
add constraint age_check
check(
	age > 0 and age < 120
);

-- OR 

create table tb_person2(
	
	id bigint,
	first_name varchar(50),
	middle_name varchar(50),
	last_name varchar(50),
	cpf bigint,
	phone bigint,
	age smallint constraint age_check check (age > 0 and age < 120)
	
)

-- 11. Alter: Table name
alter table tb_person
rename to tb_person1;

-- 12. Alter: Drop column
alter table tb_person1
add column test_column int;

alter table tb_person1
drop column test_column;


-- DML: Data Manipulation Language -------------------

-- 13. Insert: All values:
insert into tb_person1
values (1, 'Rodrigo', 'Diaz', 'Lima', 123456789, 1999999999, 'M', 45);

-- 14. Insert: Specific values:
insert into tb_person1 (id, first_name, gender)
values (2, 'Robin', 'F');

-- 15. Update: Change a value in a specific data
update tb_person1 set first_name = 'George'
where id = 2;

-- 16. Delete: Data from the table
delete from tb_person1 where id = 2;

-- 17. Delete: ALL from table (Careful)
delete from tb_person1


-- DQL: Data Query Language -------------------

-- 18. Select: All
select * from tb_person1;

-- 19. Select: where
select * from tb_person1 where id = 1;

-- 20. Select: where ... like
select * from tb_person1 where first_name like ('Rodrigo')

-- 21. Select: where ... like (%)
select * from tb_person1 where first_name like ('R%')
select * from tb_person1 where first_name like ('%a%')

-- 22. Select: where ... like ('X_')
select * from tb_person1 where first_name like ('J__')

-- 23. Select: where ... not like ()
select * from tb_person1 where first_name not like ('Rodrigo')

-- 24. Select: where ... and
select * from tb_person1 where age > 10 and age < 40;

-- 25. Select: where ... or
select * from tb_person1 where age < 10 or age > 70;

-- 26. Select: order by ask
select * from tb_person1 order by first_name asc;

-- 27. Select: order by desc
select * from tb_person1 order by first_name desc;

-- 28. Select: No repetion
select distinct(first_name) from tb_person1;

-- 29. Select: in
select * from tb_person1 
where first_name
in ('Rodrigo', 'George');

-- 30. Select: between
select * from tb_person1
where age between 1 and 50;



-----------------------------------------------------
-- 0.   Create dataBase
-- 1.1  Create table
-- 1.2  Clear table
-- 1.3  Drop table
-- 2.   Example with all (almost) variable available:

-- DDL: Data Definition Language --------------------
-- 3.  Alter: Add new column to a table
-- 4.  Alter: Column name
-- 5.  Alter: Column type
-- 6.  Alter: Set default value
-- 7.  Alter: drop default
-- 8.  Alter: Constraint NOT NULL
-- 9.  Alter: drop NOT NULL
-- 10. Alter: constraint check 
-- 11. Alter: Table name
-- 12. Alter: Drop column

-- DML: Data Manipulation Language -------------------
-- 13. Insert: All values
-- 14. Insert: Specific values
-- 15. Update: Change a value in a specific data
-- 16. Delete: Data from the table
-- 17. Delete: ALL from table

-- DQL: Data Query Language -------------------
-- 18. Select: All
-- 19. Select: where
-- 20. Select: where ... like
-- 21. Select: where ... like (%)
-- 22. Select: where ... like ('X_')
-- 23. Select: where ... not like ()
-- 24. Select: where ... and
-- 25. Select: where ... or
-- 26. Select: order by ask
-- 27. Select: order by desc
-- 28. Select: No repetion
-- 29. Select: in
-- 30. Select: between




























