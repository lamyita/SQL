En se basant sur le fichier sql shema et shema figure:
-- vous devez créer une base données, et imiter les requêtes dans le fichier sql shema.
Exprimer les requêtes suivantes en SQL :
-- 2.1 Sélectionnez le nom de famille de tous les employés.

SELECT LastName FROM employees

-- 2.2 Sélectionnez le nom de famille de tous les employés, sans doublons.

SELECT DISTINCT LastName FROM employees

-- 2.3 Sélectionnez toutes les données des employés dont le nom de famille est "Smith".

SELECT * FROM employees WHERE LastName = 'Smith'


-- 2.4  toutSélectionnezes les données des employés dont le nom de famille est "Smith" ou "Doe".

SELECT * FROM employees WHERE LastName = 'Smith' OR LastName = 'Doe'

-- 2.5 Sélectionnez toutes les données des employés qui travaillent dans le département 14.

SELECT * FROM employees WHERE Department = 14



-- 2.6 Sélectionner toutes les données des employés qui travaillent dans le département 37 ou le département 77.

SELECT * FROM employees WHERE Department =37 OR Department = 77

-- 2.7 Sélectionner toutes les données des employés dont le nom de famille commence par un "S".

SELECT * FROM employees WHERE LastName LIKE 'S%';


-- 2.8 Sélectionner la somme des budgets de tous les départements.

SELECT SUM(Budget) FROM departments


-- 2.9 Sélectionnez le nombre d'employés dans chaque département (vous devez seulement indiquer le code du département et le nombre d'employés).

SELECT Department,COUNT(Name) FROM employees GROUP BY Department;


-- 2.10 Sélectionnez toutes les données des employés, y compris les données du département de chaque employé.

SELECT * FROM employees INNER JOIN departments ON employees.Department = departments.Code



-- 2.11 Sélectionnez le nom et le prénom de chaque employé, ainsi que le nom et le budget du département de l'employé.
SELECT  `Name`, `LastName` FROM employees;

SELECT  `Name`, `Budget` FROM departments


-- 2.12 Sélectionnez le nom et le nom de famille des employés travaillant pour des ministères dont le budget est supérieur à 60 000 $.


-- 2.13 Sélectionnez les départements dont le budget est supérieur au budget moyen de l'ensemble des départements.


-- 2.14 Sélectionnez les noms des départements ayant plus de deux employés.
-- 2.15 Très important - Sélectionnez le nom et le nom de famille des employés travaillant pour les ministères dont le budget est le deuxième plus bas.
-- 2.16 Ajoutez un nouveau service appelé "Quality assurance", avec un budget de 40 000 $ et le code de service 11. Et ajoutez un employé appelé "Mary Moore" dans ce département, avec le code SSN 847-21-9811.
-- 2.17 Réduire le budget de tous les départements de 10 %.
-- 2.18 Réaffecter tous les employés du département de la recherche (code 77) au département informatique (code 14).
-- 2.19 Supprimer du tableau tous les employés du département informatique (code 14).
-- 2.20 Supprimer du tableau tous les employés qui travaillent dans des départements dont le budget est supérieur ou égal à 60 000 $.
-- 2.21 Supprimer du tableau tous les employés.
