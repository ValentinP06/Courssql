SELECT * FROM telephones WHERE manufacturer IN("Apple","Samsung");

SELECT name,manufacturer,price FROM telephones WHERE price BETWEEN 150 AND 200;


-- Afficher dans l'ordre croissant des prix
SELECT id,name,manufacturer,price FROM telephones ORDER BY price ASC;

-- Afficher dans l'ordre decroissant des prix
SELECT id,name,manufacturer,price FROM telephones ORDER BY price DESC;

-- Several order criterias
SELECT id,name,manufacturer,price FROM telephones ORDER BY price DESC,manufacturer DESC;

SELECT name, manufacturer,price, units_sold, price*units_sold FROM telephones

SELECT name AS modele, manufacturer AS constructeur,price AS prix, units_sold AS unites_vendues, (price*units_sold) AS chiffre_affaire FROM telephones;

SELECT CONCAT (name, " ", manufacturer) AS modele, CONCAT (price, " ", "€") AS prix, units_solds AS unites_vendues, CONCAT ((price*units_solds), " ", "€") AS CA FROM telephones;

CREATE VIEW v_revenu_total AS SELECT name AS modele, manufacturer AS constructeur,price AS prix, units_sold AS unites_vendues, (price*units_sold) AS chiffre_affaire FROM telephones;


SELECT * FROM v_revenu_total;

SELECT DISTINCT(manufacturer) FROM telephones;

-- Afficher le nombre d'appareils Apple
SELECT COUNT(*) FROM telephones WHERE manufacturer="Apple";

-- Total des ventes
SELECT SUM(units_sold)AS total_ventes FROM telephones;

-- Average sales
SELECT AVG(units_sold)AS moyenne_ventes FROM telephones;

-- Ventes les plus elevées
SELECT MAX(units_sold)AS ventes_plus_elevee FROM telephones;

-- Ventes les moins elevées
SELECT MIN(units_sold)AS ventes_moins_elevee FROM telephones;

