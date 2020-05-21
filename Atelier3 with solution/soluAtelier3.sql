-- En se basant sur le fichier sql shema et shema figure:
-- -- vous devez créer une base données, et imiter les requêtes dans le fichier sql shema.
-- Exprimer les requêtes suivantes en SQL :


--3.1 Sélectionner tous les entrepôts.
SELECT * FROM warehouses;


--3.2 Sélectionnez toutes les cases dont la valeur est supérieure à 150 $.

SELECT * FROM boxes WHERE VALUE > 150;

--3.3 Sélectionner tous les contenus distincts dans toutes les cases.

SELECT DISTINCT Contents FROM boxes;


--3.4 Sélectionner la valeur moyenne de toutes les boîtes.


SELECT AVG(Value) FROM boxes;

--3.5 Sélectionner le code de l'entrepôt et la valeur moyenne des boîtes dans chaque entrepôt.

SELECT Warehouse, AVG(Value) FROM Boxes GROUP BY Warehouse;



--3.6 Identique à l'exercice précédent, mais ne sélectionnez que les entrepôts où la valeur moyenne des boîtes est supérieure à 150.

SELECT Warehouse, AVG(Value) FROM boxes GROUP BY Warehouse HAVING AVG(Value)>150;
 

--3.7 Sélectionnez le code de chaque boîte, ainsi que le nom de la ville dans laquelle la boîte est située.

SELECT Boxes.Code, Location FROM Warehouses INNER JOIN Boxes ON Warehouses.Code = Boxes.Warehouse;

--3.8 Sélectionnez les codes des entrepôts, ainsi que le nombre de boîtes dans chaque entrepôt. 
    -- Facultativement, tenez compte du fait que certains entrepôts sont vides (c'est-à-dire que le nombre de boîtes devrait apparaître comme zéro, au lieu d'omettre l'entrepôt du résultat).

SELECT warehouse, COUNT(*) FROM boxes GROUP BY Warehouse;

--3.9 Sélectionnez les codes de tous les entrepôts qui sont saturés (un entrepôt est saturé si le nombre de boîtes qu'il contient est supérieur à la capacité de l'entrepôt).


SELECT Code
   FROM Warehouses
   WHERE Capacity <
   (
     SELECT COUNT(*)
     FROM Boxes
     WHERE Warehouse = Warehouses.Code
   );


   --3.10 Sélectionnez les codes de toutes les boîtes situées à Chicago.

   select Boxes.code 
from boxes join Warehouses
on boxes.warehouse = warehouses.code
where warehouses.location = 'Chicago';


--3.11 Créer un nouvel entrepôt à New York avec une capacité de 3 boîtes.

 INSERT
   INTO Warehouses
        (Location,Capacity)
 VALUES ('New York',3);






--3.12 Créer une nouvelle boîte, avec le code "H5RT", contenant des "Papers" d'une valeur de 200 $, et située dans l'entrepôt 2.

INSERT INTO boxes (Code, Contents, Value, Warehouse) VALUES ('H5RT','Papers', 200,2)

--3.13 Réduire la valeur de toutes les boîtes de 15 %.
   UPDATE Boxes SET Value = Value * 0.85; 

--3.14 Retirer toutes les boîtes d'une valeur inférieure à 100 $.

DELETE FROM boxes WHERE Value<100


-- 3.15 Retirer toutes les boîtes des entrepôts saturés.

DELETE FROM `boxes` WHERE Warehouse IN ( SELECT Code FROM warehouses WHERE Capacity < ( SELECT COUNT(*) FROM boxes WHERE Warehouse = warehouses.Code ) )


-- 3.16 Ajouter un indice pour la colonne "Entrepôt" dans le tableau "boîtes".

CREATE INDEX INDEX_WAREHOUSE ON Boxes (warehouse);


    -- !!!NOTE!! : l'index ne doit PAS être utilisé sur des petites tables dans la pratique
-- 3.17 Imprimer tous les index existants

SHOW INDEX FROM Boxes FROM namedatabes;


    -- !!!NOTE!! : l'index ne doit PAS être utilisé sur des petites tables dans la pratique

NB : Entrepôt c'est warehouse // les cases : boxes
