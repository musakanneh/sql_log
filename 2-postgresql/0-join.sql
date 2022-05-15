drop table if exists student;
create table student (
	id SERIAL, name varchar(128), email varchar(128) unique, primary key (id)
);
insert into student (name, email) values ('Musa', 'musa.kanneh@gmail.com');
insert into student (name, email) values ('Isaac', 'isaas.montaya@gmail.com');
insert into student (name, email) values ('Aubrey', 'aubrey.omondi@gmail.com');
insert into student (name, email) values ('Kanenh', 'kanneh.musa@gmail.com');
select * from student;

drop table if exists course;
create table course (
	id SERIAL, title varchar(128) unique, primary key (id)
);
insert into course (title) values ('Python');
insert into course (title) values ('SQL');
insert into course (title) values ('PHP');
select * from course;

drop table if exists some_member;
create table some_member (
	student_id integer references student(id) on delete cascade,
	course_id integer references course(id) on delete cascade,
	role integer,
	primary key (student_id, course_id)
);
insert into some_member (student_id, course_id, role) values (1, 2, 1);
insert into some_member (student_id, course_id, role) values (2, 1, 0);
insert into some_member (student_id, course_id, role) values (3, 2, 1);
select * from some_member;

select student.name, some_member.role, course.title 
from student
join some_member on some_member.student_id = student_id
join course on some_member.course_id = course_id
order by course.title, some_member.role desc, student.name;