-- COMP3311 Prac 03 Exercise
-- Schema for simple company database

create table Employees (
	tfn         char(11) check (tfn='[0-9]{3}-[0-9]{3}-[0-9]{3}'),
	givenName   varchar(30) NOT NULL,
	familyName  varchar(30),
	hoursPweek  float check ( hoursPweek between 0 and 168.00)
);

create table Departments (
	id          char(3) check (id='[0-9]{3}') PRIMARY KEY,
	name        varchar(100) UNIQUE,
	manager     char(11) UNIQUE
);

create table DeptMissions (
	department  char(3) REFERENCES departments (id),
	keyword     varchar(20)
);

create table WorksFor (
	employee    char(11),
	department  char(3),
	percentage  float check (percentage between 0 and 100.00)
);
