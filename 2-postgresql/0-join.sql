DROP TABLE IF EXISTS student;
CREATE TABLE student (
	id SERIAL,
	name VARCHAR(128),
	email VARCHAR(128) unique,
	PRIMARY KEY (id)
);
INSERT INTO student (name, email) VALUES ('Musa', 'musa.kanneh@gmail.com');
INSERT INTO student (name, email) VALUES ('Isaac', 'isaas.montaya@gmail.com');
INSERT INTO student (name, email) VALUES ('Aubrey', 'aubrey.omondi@gmail.com');
INSERT INTO student (name, email) VALUES ('Kanenh', 'kanneh.musa@gmail.com');
SELECT * FROM student;

DROP TABLE IF EXISTS course;
CREATE TABLE course (
	id SERIAL,
	title VARCHAR(128) unique,
	primary key (id)
);
INSERT INTO course (title) VALUES ('Python');
INSERT INTO course (title) VALUES ('SQL');
INSERT INTO course (title) VALUES ('PHP');
SELECT * FROM course;

DROP TABLE IF EXISTS some_member;
CREATE TABLE some_member (
	student_id INTEGER references student(id) on delete cascade,
	course_id INTEGER references course(id) on delete cascade,
	role INTEGER,
	PRIMARY KEY (student_id, course_id)
);

INSERT INTO some_member (student_id, course_id, role) VALUES (1, 2, 1);
INSERT INTO some_member (student_id, course_id, role) VALUES (2, 1, 0);
INSERT INTO some_member (student_id, course_id, role) VALUES (3, 2, 1);
SELECT * from some_member;

SELECT
	student.name,
	some_member.role,
	course.title
FROM
	student
	JOIN some_member ON some_member.student_id = student_id
	JOIN course ON some_member.course_id = course_id
ORDER BY
	course.title,
	some_member.role DESC,
	student.name;