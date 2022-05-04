/*############################################################################*/

CREATE or REPLACE view Q1(pid,firstname,lastname) as
SELECT person.pid,firstname,lastname
FROM person
JOIN client on person.pid=client.pid
JOIN staff on client.pid=staff.pid
ORDER BY pid ASC;

/*############################################################################*/

CREATE or REPLACE view Q2(brand,car_id,pno,premium) as
SELECT * FROM
(
	SELECT DISTINCT ON (brand) brand,insured_item.id,coverage.pno,SUM(rating_record.rate) AS premium FROM insured_item
	JOIN policy ON insured_item.id=policy.id
	JOIN coverage ON policy.pno=coverage.pno
	JOIN rating_record ON coverage.coid=rating_record.coid
	GROUP BY coverage.pno, brand, insured_item.id
	ORDER BY brand, premium DESC
) AS getMax
ORDER BY brand,id,pno ASC;

/*############################################################################*/

CREATE or REPLACE view Q3(pid,firstname,lastname) as
SELECT person.pid,firstname,lastname
FROM person
JOIN staff on person.pid=staff.pid
WHERE staff.sid NOT IN
(SELECT staff.sid from staff
JOIN underwritten_by on staff.sid=underwritten_by.sid
WHERE underwritten_by.wdate > current_date-interval '1 year')
ORDER BY pid ASC;

/*############################################################################*/

CREATE or REPLACE view Q4(suburb, npolicies) AS
SELECT UPPER(person.suburb),count(policy.pno) AS npolicies FROM policy
JOIN insured_by ON policy.pno=insured_by.pno
JOIN client ON insured_by.cid=client.cid
JOIN person ON client.pid=person.pid
WHERE person.state='NSW'
GROUP BY person.suburb
ORDER BY npolicies ASC;

/*############################################################################*/

CREATE or REPLACE view Q5(pno,pname,pid,firstname,lastname) AS
SELECT policy.pno, policy.pname,person.pid,firstname,lastname
FROM policy JOIN staff ON policy.sid=staff.sid
JOIN person ON staff.pid=person.pid
JOIN underwriting_record ON policy.pno=underwriting_record.pno
JOIN underwritten_by ON underwriting_record.urid=underwritten_by.urid
JOIN coverage ON policy.pno=coverage.pno
JOIN rating_record ON coverage.coid=rating_record.coid
JOIN rated_by ON rating_record.rid=rated_by.rid
WHERE policy.sid=underwritten_by.sid AND policy.sid=rated_by.sid
ORDER BY pno ASC;

/*############################################################################*/

CREATE or REPLACE view Q6(name,brand) AS
SELECT TB3.name,insured_item.brand FROM
( 
	SELECT TB2.pid,TB2.name FROM
	(	
		SELECT TB1.pid, TB1.name, COUNT (TB1.pid) FROM
		(
			SELECT DISTINCT ON (person.pid,brand) person.pid,(firstname||' '||lastname) AS name,brand FROM PERSON
			JOIN staff ON person.pid=staff.pid
			JOIN policy ON staff.sid=policy.sid
			JOIN insured_item ON policy.id=insured_item.id
		) AS TB1
		GROUP BY TB1.pid, TB1.name
	) AS TB2
	WHERE TB2.count=1
	ORDER BY TB2.pid
) AS TB3
JOIN staff ON TB3.pid=staff.pid
JOIN policy ON staff.sid=policy.sid
JOIN insured_item ON policy.id=insured_item.id;

/*############################################################################*/

CREATE or REPLACE view Q7(pid,name) AS
SELECT TB4.pid,(firstname||' '||lastname) AS name FROM
(
	SELECT TB3.pid,TB3.num FROM
	(
		SELECT TB2.pid, count(brand) AS num FROM
		(
			SELECT DISTINCT pid,brand FROM
			(
				SELECT client.pid, brand FROM client
				JOIN insured_by ON client.cid=insured_by.cid
				JOIN policy ON insured_by.pno=policy.pno
				JOIN insured_item ON policy.id=insured_item.id
			) AS TB1
			ORDER BY pid
		) AS TB2
		GROUP BY TB2.pid
	) AS TB3
	WHERE TB3.num=
	(
		SELECT count(DISTINCT brand) FROM insured_item
	)
) AS TB4
JOIN person ON TB4.pid=person.pid
ORDER BY TB4.pid ASC;

/*############################################################################*/




