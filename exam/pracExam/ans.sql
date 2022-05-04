-- COMP3311 20T1 Exam Answer Template
--
-- * Don't change view names;
-- * Only change the SQL code for view as commented below;
-- * and follow the order of the view arguments as stated in the comments (if any);
-- * and do not remove the ending semicolon of course.
--
-- * You may create additional views, if you wish;
-- * but you are not allowed to create tables.
--


-- Q1 to Q4 --
--

drop view if exists Q1;
create view Q1
as
-- replace the SQL code for view Q1(title, year) below:
select m.title, m.year 
from movie m 
	join rating r on (m.id=r.movie_id) 
where r.imdb_score>=8.5
;

drop view if exists Q2;
create view Q2
as
-- replace the SQL code for view Q2(title, year) below:
select m.title, m.year 
from movie m
	join acting s on (m.id=s.movie_id) 
	join actor a on (s.actor_id=a.id)
where a.name="James Franco"
;

drop view if exists Q3;
create view Q3
as
-- replace the SQL code for view Q3(movies) below:
select count(*) 
from movie m 
where m.year>2010
;

drop view if exists Q4;
create view Q4
as
-- replace the SQL code for view Q4(movies) below:
select count(*)
from movie m 
where m.director_id is NULL
;

-- Q5 --
--

drop view if exists Q5a;
create view Q5a
as
-- replace "REPLACE ME" with your answer below (e.g. "CHECK (Age >= 18)"):
select check (enrolments.student_id>=2000000 and enrolments.student_id<=4999999)
;

drop view if exists Q5b;
create view Q5b
as
-- replace "REPLACE ME" with your answer below (e.g. "CHECK (Age >= 18)"):
select check (enrolments.course_code~'[A-Z]{4}[0-9]{4}')
;

drop view if exists Q5c;
create view Q5c
as
-- replace "REPLACE ME" with your answer below (e.g. "CHECK (Age >= 18)"):
select check (enrolments.semester~'[0-9]{2}[a-z][0-9]'
;

drop view if exists Q5d;
create view Q5d
as
-- replace "REPLACE ME" with your answer below (e.g. "CHECK (Age >= 18)"):
select "REPLACE ME"
;



-- Q6 --
--

drop view if exists Q6a;
create view Q6a
as
-- replace "REPLACE ME" with your answer below (e.g. "A,BC"):
select "REPLACE ME"
;

drop view if exists Q6b;
create view Q6b
as
-- replace "REPLACE ME" with your answer below (e.g. "A,BC"):
select "REPLACE ME"
;

drop view if exists Q6c;
create view Q6c
as
-- replace "REPLACE ME" with your answer below (e.g. "A,BC"):
select "REPLACE ME"
;



-- Q7 --
--

drop view if exists Q7a;
create view Q7a
as
-- replace "REPLACE ME" with your answer below (e.g. "AB,BCD"):
select "REPLACE ME"
;

drop view if exists Q7b;
create view Q7b
as
-- replace "REPLACE ME" with your answer below (e.g. "AB,BCD"):
select "REPLACE ME"
;



-- Q8 --
--

drop view if exists Q8a;
create view Q8a
as
-- replace "REPLACE ME" with your answer below (e.g. "Y" for serializable, "N" otherwise):
select "REPLACE ME"
;

drop view if exists Q8b;
create view Q8b
as
-- replace "REPLACE ME" with your answer below (e.g. "Y" for serializable, "N" otherwise):
select "REPLACE ME"
;



-- Q9 --
--
-- Save your ER drawing in a file called er.pdf in PDF format. 
--


-- END OF EXAM --
--
