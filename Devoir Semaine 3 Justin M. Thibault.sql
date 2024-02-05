-- Devoir Semaine 3

-- Exercice 1
SELECT a.lname AS authors, e.lname AS publishers
FROM authors a
JOIN publishers e ON a.city = e.city;


-- Exercice 2
SELECT a.lname AS authors, e.lname AS publishers
FROM authors a
LEFT JOIN publishers e ON a.city = e.city;


-- Exercice 3
SELECT a.lname AS authors, e.lname AS publishers
FROM  authors a
RIGHT JOIN publishers e ON a.city = e.city;


-- Exercice 4
SELECT a.lname AS  authors, e.lname AS publishers
FROM  authors a
FULL JOIN publishers e ON a.city = e.city;


-- Exercice 5
SELECT e.lname AS publishers, job_lvl, COUNT(emp_id) AS effectif
FROM publishers e
JOIN employees emp ON e_id = emp_id_publishers
GROUP BY e.lname, emp_lvl_experience;


-- Exercice 6
SELECT e.lname AS publishers, COUNT(emp_id) AS nombre_employees
FROM publishers e
JOIN employees emp ON e.id = emp_id_publishers
GROUP BY e.lname;


-- Exercice 7
SELECT e.lname AS publishers, AVG(emp_salary) AS salary_moyen
FROM publishers e
JOIN employees emp ON e_id = emp_id_publishers
GROUP BY e.lname;


-- Exercice 8
SELECT e.lname AS publishers, COUNT(emp_id) AS effectif_senior
FROM publishers e
JOIN employees emp ON e.id = emp_id_publishers
WHERE emp_max_lvl = 'SENIOR'
GROUP BY e.lname;