En se basant sur le fichier sql shema et shema figure:
-- vous devez créer une base données, et imiter les requêtes dans le fichier sql shema.
Exprimer les requêtes suivantes en SQL :
-- 4.1 Sélectionnez le titre de tous les films.

select title from movies;


-- 4.2 Afficher toutes les classifications distinctes dans la base de données.

select distinct rating from movies;


-- 4.3 Afficher tous les films non classés.

select * 
from movies
where rating is NULL;

-- 4.4 Sélectionner tous les cinémas qui ne diffusent pas de film actuellement.

select * from MovieTheaters
where Movie is NULL;

-- 4.5 Sélectionner toutes les données de tous les cinémas 
    -- En outre, les données du film qui est projeté en salle (si un film est projeté).



    SELECT *
   FROM MovieTheaters LEFT JOIN Movies
   ON MovieTheaters.Movie = Movies.Code;


-- 4.6 Sélectionnez toutes les données de tous les films et, si ce film est diffusé dans une salle de cinéma, affichez les données de la salle de cinéma.

 SELECT *
   FROM MovieTheaters RIGHT JOIN Movies
   ON MovieTheaters.Movie = Movies.Code;

-- 4.7 Afficher les titres des films qui ne sont actuellement diffusés dans aucun cinéma.

SELECT Title FROM Movies
   WHERE Code NOT IN
   (
     SELECT Movie FROM MovieTheaters
     WHERE Movie IS NOT NULL
   );


-- 4.8 Ajouter le film non coté "One, Two, three".


INSERT INTO Movies(Title,Rating) VALUES('One, Two, Three',NULL);
  INSERT INTO Movies(Code, Title,Rating) VALUES(9,'One, Two, Three',NULL)

-- 4.9 Fixer la classification de tous les films non classés à "G".
UPDATE Movies
SET Rating = 'G'
WHERE Rating is NULL;


-- 4.10 Supprimer les salles de cinéma qui projettent des films classés "NC-17".
delete from MovieTheaters 
where Movie in (
select Code from Movies where Rating = 'NC-17'
);