USE Ammar;


SELECT *
FROM Employee;


-- PROCENAT ZAPOSLENIH SA SVAKIM OD NIVOA OBRAZOVANJA
SELECT Education, CONCAT(ROUND(COUNT(*)/CAST((SELECT COUNT(*) FROM employee) as float)*100,2),'%') as percentage_per_education_tier
FROM Employee
GROUP BY Education
ORDER BY 1;



-- ZAPOSLENI PO NIVOU OBRAZOVANJA I NIVOU PLATE
SELECT Education, PaymentTier, COUNT(*) as number_of
FROM Employee
GROUP BY Education, PaymentTier
ORDER BY 1,2;


-- BROJ NOVIH RADNIKA ZA SVAKU GODINU, BROJ I PROCENAT ONIH KOJI SU OTISLI PO GODINI ZAPOŠLJAVANJA
SELECT JoiningYear, Count(*) as num_of_joining, 
SUM(LeaveOrNot) as num_left, 
CONCAT(ROUND(SUM(LeaveOrNot)/CAST(Count(*) AS FLOAT)*100,2),'%') as percent_left_from_that_year
FROM employee
GROUP BY JoiningYear
ORDER BY 1;

-- UKUPNO ZAPOSLENIH DANAS
SELECT COUNT(*) - SUM(LeaveOrNot) as total_employees_today
FROM employee


-- BROJ ZAPOSLENIH U SVAKOJ KATEGORIJI GODINA
SELECT age_bracket, COUNT(*) as num_in_age_bracket
FROM(
SELECT *,
	CASE
		WHEN Age Between 20 AND 29 THEN '20s'
		WHEN Age Between 30 AND 39 THEN '30s'
		WHEN Age Between 40 AND 49 THEN '40s'
		WHEN Age Between 50 AND 59 THEN '50s'
		WHEN Age Between 60 AND 69 THEN '60s'
		WHEN Age Between 70 AND 79 THEN '70s'
	END as age_bracket
FROM employee) as aa
GROUP BY age_bracket
ORDER BY 1;


-- PODACI ZA NIVO PLATE 3 I NAJRANIJU GODINU ZAPOŠLJAVANJA
SELECT *
FROM employee
WHERE PaymentTier = 3 AND JoiningYear = (SELECT MIN(JoiningYear) FROM employee);

