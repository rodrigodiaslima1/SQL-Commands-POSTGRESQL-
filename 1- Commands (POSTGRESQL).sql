
-- SQL COMMANDS (USING POSTGRESQL)

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

-- DQL: Data Query Language --------------------------
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

-- Other stuff ----------------------------------------
-- 31. Index:
-- 32. Primary Key
-- 33. Foreign Key:
-- 34. Constraints: Unique: won't accept repeated values in the column												 
-- 35. Constraints: Sequence: a sequence of values 
-- 36. Constraints: Sequence: get the current sequence value
-- 37. Constraints: Sequence: get next sequence value
-- 38. Inner Join
-- 39. Left Join
-- 40. Right Join
-- 41. Full Join
-- 42. Cross Join

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

-- 15.1 Update: Change a value in MANY entries
update tb_person1 set age = 100
where id=1 and id=2 and id=3;

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


-- Other stuff ----------------------------------------

-- 31. Index:
create index idx_tb_person1 on tb_person1(middle_name);

-- 32. Constraints: Primary Key: They are idexed, unique and not null
create table tb_person3(
	
	id bigint,
	first_name varchar(50),
	middle_name varchar(50),
	last_name varchar(50),
	cpf bigint,
	phone bigint,
	age smallint constraint age_check check (age > 0 and age < 120),
	
	constraint pk_id_tb_person3 primary key (id)
	
);

-- OR

create table tb_person3(
	
	id bigint primary key,
	first_name varchar(50),
	middle_name varchar(50),
	last_name varchar(50),
	cpf bigint,
	phone bigint,
	age smallint constraint age_check check (age > 0 and age < 120)
	
);

-- OR

alter table tb_person3
add constraint pk_id_tb_person3
primary key (id);

-- 33. Constraints: Foreign Key:
create table tb_country(

	id int primary key,
	country varchar(50)

);

create table tb_person4(
	
	id bigint,
	first_name varchar(50),
	middle_name varchar(50),
	last_name varchar(50),
	cpf bigint,
	phone bigint,
	age smallint constraint age_check check (age > 0 and age < 120),
	id_country int,
	
	constraint pk_id_tb_person4 primary key (id),
	constraint fk_id_country_tb_person4 foreign key (id_country) references tb_country(id)
	
);

-- OR

alter table tb_person4
add constraint fk_id_country_tb_person4 foreign key (id_country references tb_country(id);
													 
-- 34. Constraints: Unique: won't accept repeated values in the column
create table tb_person5(
	
	id bigint,
	first_name varchar(50),
	middle_name varchar(50),
	last_name varchar(50),
	cpf bigint,
	phone bigint,
	age smallint constraint age_check check (age > 0 and age < 120),
	id_country int,
	
	constraint pk_id_tb_person5 primary key (id),
	constraint fk_id_country_tb_person5 foreign key (id_country) references tb_country(id),
	constraint unique_cpf_tb_person5 unique (cpf)
	
);
													 
-- OR													 

alter table tb_person5
add constraint unique_cpf_tb_person5 unique (cpf);

-- 35. Constraints: Sequence: a sequence of values that can be used
-- in columns with autoincrement values:
create sequence sq_tb_person1
start 2 increment 1 -- here we start at 2 because we have already one data on the DB
owned by tb_person1.id;
													 
-- to insert using this value:
insert into tb_person1(id, first_name, cpf)
values (nextval('sq_tb_person1'), 'Christina', 312645978);

-- 36. Constraints: Sequence: get the current sequence value
select currval('sq_tb_person1');

-- 37. Constraints: Sequence: get next sequence value
select nextval('sq_tb_person1');

-- 38. Inner Join: combination of values from tab1 and tab2. It makes a
-- comparation between them. If they are the same, a join is made between
-- both tabs. Values that don't mach, are ignored and not returned

-- 1.1: without inner join (same result)
select * 
from tb_person4 person, tb_country country
where person.id_country = country.id;
-- 1.2: with inner join (same result)
select *
from tb_person4 person
inner join tb_country country
on person.id_country = country.id;

-- 2.1: without inner join (same result)
select person.id, person.first_name person_name, country.id, country.country nationality
from tb_person4 person, tb_country country
where person.id_country = country.id;
-- 2.2: with inner join (same result)
select person.id, person.first_name person_name, country.id, country.country nationality
from tb_person4 person
inner join tb_country country on country.id = person.id_country
													 
-- 3.1: without inner join (same result)
select person.id, person.first_name as person_name, country.id, country.country as nationality
from tb_person4 as person, tb_country as country
where person.id_country = country.id;
-- 3.2: with inner join (same result)	
select person.id, person.first_name as person_name, country.id, country.country as nationality
from tb_person4 as person
inner join tb_country as country on country.id = person.id_country;												 
													 
-- the tb_country and tb_person4 are used as examples:
create table tb_country(

	id int primary key,
	country varchar(50)

);

create table tb_person4(
	
	id bigint,
	first_name varchar(50),
	middle_name varchar(50),
	last_name varchar(50),
	cpf bigint,
	phone bigint,
	age smallint constraint age_check check (age > 0 and age < 120),
	id_country int,
	
	constraint pk_id_tb_person4 primary key (id),
	constraint fk_id_country_tb_person4 foreign key (id_country) references tb_country(id)
	
);

-- 39. Left Join: values that don't match, are returned, even so, with a NULL value:
select *
from tb_person4 person
left join tb_country country
on person.id_country = country.id;												 


-- 40. Right Join:

-- 41. Full Join: same as left and right join. Registers which do not have a pair
-- will show up as NULL, in the right side or left side
select *
from tb_person4 person
full join tb_country country
on person.id_country = country.id;		

-- 42. Cross Join: A very dangerous move here. Cross Join will brig all entries.
-- of joins, making repetions with the information for each of the columns from
-- both sides; (*** DO NOT USE IT ***)
select *
from tb_person4 person
cross join tb_country 								
													 
													 
													 
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

-- DQL: Data Query Language --------------------------
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

-- Other stuff ----------------------------------------
-- 31. Index:
-- 32. Primary Key
-- 33. Foreign Key:
-- 34. Constraints: Unique: won't accept repeated values in the column												 
-- 35. Constraints: Sequence: a sequence of values 
-- 36. Constraints: Sequence: get the current sequence value
-- 37. Constraints: Sequence: get next sequence value
-- 38. Inner Join
-- 39. Left Join
-- 40. Right Join
-- 41. Full Join
-- 42. Cross Join






















