-- Entering Many-to-One Data - Automobiles
drop table if exists make;
create table make ( id SERIAL, name varchar(128) unique, primary key(id));

drop table if exists model;
create table model (
  id SERIAL, name varchar(128),
  make_id integer references make(id) on delete cascade, primary key(id));
 
insert into make (name) values ('Mercedes-Benz');
insert into make (name) values ('Suzuki');
select * from make

insert into model (name, make_id) values ('500SEL 5.0L', 1);
insert into model (name, make_id) values ('500SEL 5.6L', 1);
insert into model (name, make_id) values ('500SL', 1);
insert into model (name, make_id) values ('Forenza', 2);
insert into model (name, make_id) values ('Forenza Wagon', 2);
select * from model

select make.name, model.name from model 
join make on model.make_id = make.id order by make.name limit 5;