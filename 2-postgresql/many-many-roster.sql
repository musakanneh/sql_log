-- Building a many-to-many roster
drop table student cascade ;
create table student ( id SERIAL, name varchar(128) unique, primary key(id));

drop table course cascade;
create table course (id SERIAL, title varchar(128) unique, primary key(id));

drop table roster cascade;
create table roster ( id SERIAL, student_id integer references student(id) on delete cascade,
    course_id integer references course(id) on delete cascade,
    role integer, unique(student_id, course_id), primary key (id)
);

insert into student (name) values ('Vikki');
insert into student (name) values ('Aliesha');
insert into student (name) values ('Megha');
insert into student (name) values ('Sabah');
insert into student (name) values ('Unaiza');
insert into student (name) values ('Zeph');
insert into student (name) values ('Caedyn');
insert into student (name) values ('Fatou');
insert into student (name) values ('Hadyn');
insert into student (name) values ('Reilly');
insert into student (name) values ('Abbigale');
insert into student (name) values ('Gerard');
insert into student (name) values ('Kaan');
insert into student (name) values ('Sheriff');
select id as "Student ID", name as "Student Name" from student

-- course table
insert into course (title) values ('si106');
insert into course (title) values ('si110');
insert into course (title) values ('si206');
select * from course

-- roster table
insert into roster (student_id, course_id, role) values (1, 1, 1);
insert into roster (student_id, course_id, role) values (2, 1, 0);
insert into roster (student_id, course_id, role) values (3, 1, 0);
insert into roster (student_id, course_id, role) values (4, 1, 0);
insert into roster (student_id, course_id, role) values (5, 1, 0);

insert into roster (student_id, course_id, role) values (6, 2, 1);
insert into roster (student_id, course_id, role) values (7, 2, 0);
insert into roster (student_id, course_id, role) values (8, 2, 0);
insert into roster (student_id, course_id, role) values (9, 2, 0);
insert into roster (student_id, course_id, role) values (10,2, 0);

insert into roster (student_id, course_id, role) values (8, 3, 1);
insert into roster (student_id, course_id, role) values (11, 3, 0);
insert into roster (student_id, course_id, role) values (12, 3, 0);
insert into roster (student_id, course_id, role) values (13, 3, 0);
insert into roster (student_id, course_id, role) values (14, 3, 0);
select * from roster 

select student.name as "Student Name", course.title as "Course Title", roster.role as "Role" from student 
    join roster ON student.id = roster.student_id
    join course ON roster.course_id = course.id
    order by course.title, roster.role desc, student.name;
