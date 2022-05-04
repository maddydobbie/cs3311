-- Q1
SELECT count(*) FROM Movies;

-- Q2
SELECT title FROM Movies;

-- Q3
SELECT min(year) FROM Movies;

-- Q4
SELECT count(*) FROM Actors;

-- Q5
SELECT givennames||' '||familyname FROM actors WHERE familyname='Zeta-Jones';

-- Q6
SELECT DISTINCT(genre) FROM belongsto;

-- Q7
SELECT Movies.title, Movies.year
FROM   Movies 
	JOIN Directs ON (Directs.movie = Movies.id)
	JOIN Directors ON (Directs.director = Directors.id)
WHERE Directors.familyname = 'Spielberg';

-- Q8
SELECT a.givennames||' '||a.familyname
FROM Actors a 
WHERE NOT EXISTS (
	SELECT id FROM Movies 
	EXCEPT 
	SELECT movie AS id FROM AppearsIn WHERE actor=a.id
);

-- Q9

SELECT TB0.name
FROM (
	SELECT (d.givenNames||' '||d.familyName) AS name, (COUNT(s.movie)) AS num
	FROM Directors d 
		LEFT JOIN Directs s ON (d.id=s.director)
) AS TB0 
WHERE TB0.num=0;

