-- Authentification/connexion
>mysql -u root -- Si l'utilisateur n'a pas de mot de passe
>mysql -u root -p -- Si l'utilisateur possède un mot de passe


--- 1 Lister les bases de données

SHOW DATABASES;

-- 2. Création de la base de donées

CREATE DATABASE ventes;


-- 3. Utilisation/selectionner une base de données

--USE <nom base de donnée>
USE ventes

-- 4.Lister les tables de la bases dedonées

SHOW TABLES;

-- 4. Création de la table clients
-- INTEGER : c'est le type entier
-- NOT NULL : cette colonne doit toujours contenir une information
-- AUTO_INCREMENT : Dire à MySQL de fournir des valeurs en incrémentant 
--                  automatiquement les clés
-- PRIMARY KEY :  Marquer la colonne comme étant la clé primaire
-- UNIQUE : Appliquer une contrainte d'unicité
CREATE TABLE clients(
id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
nom VARCHAR(50) NOT NULL,
prenom VARCHAR(50) NOT NULL,
email VARCHAR(70) UNIQUE,
telephone VARCHAR(20) NOT NULL, 
);
-- +33654345654
-- 003365434565
-- +1

-- Voir la description de la table
-- DESC <nom_table> ou DESCRIBE <nom_table>
DESC clients;

--Modifier une table en ajoutant une nouvelle colonne
ALTER TABLE clients ADD COLUMN postnom VARCHAR(50);

-- Modifier une table en ajoutant une nouvelle colonne après une autre
-- On rajoute la colonne 'postnom' après la colonne 'prenom'

AFTER TABLE clients ADD COLUMN postnom VARCHAR(50) AFTER prenom

----LMD

--lister(SELECT) les informations de toutes(*) les colonnes 
-- de la table(FROM) client


SELECT * FROM clients; 

-- Insertion des données

INSERT INTO clients(nom,prenom,email,telephone) values("Lisangola","Christian","christianlisangola@gmail.com","0505050505"),("Payet","Valentin","valentinpayet06@gmail.com","0679687207");

-- Rajout d'une colonne 

ALTER TABLE clients ADD COLUMN age INTEGER;

--Mise à jour des données

UPDATE clients SET telephone="0673460986" WHERE id=2;

UPDATE clients SET postnom="tarzan",age=17 WHERE id=1;

-- Supprime un enregistrement

DELETE FROM clients WHERE id=2;

--Configurer MySQL en mode strict
-- Valeur pour le mode strict : STRICT_TRANS_TABLES;

-- Verifier le mode transition
SHOW VARIABLES LIKE'sql_mode'

--  SELECT * FROM clients WHERE age<30 OR prenom="Christian";

--TP
-- Créer une base de données appelée sales

CREATE DATABASE sales;
USE sales;

-- ## Créer une table appelée telephones avec les colonnes suivantes :
-- *=> name : chaîne de caractères qui représente le modèle du téléphone
-- *=> manufacturer : chaîne de caractères qui représente le fabricant
-- *=> price : un nombre qui représente le prix UHT
-- *=> units_sold : nombre qui représentent la quantité vendue


CREATE TABLE telephones(
    id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    manufacturer VARCHAR(50) NOT NULL,
    price FLOAT NOT NULL,
    units_sold INTEGER
);

-- *=> Insérer les données suivantes (cf .pdf)

INSERT INTO telephones (id, name, manufacturer, price, units_sold) VALUES
(2, "Iphone 4", "Apple", 399, 9436),
(1, "N1280", "Nokia", 199, 1925),
(3, "Galaxy S 5", "Samsung", 299, 2359),
(4, "S5620 Monte", "Samsung", 250, 2385),
(5, "N8", "Nokia", 150, 7543),
(6, "Droid", "Motorola", 150, 8395),
(7, "Iphone 13 Pro Max", "Apple", 1300, 12849),
(8, "Galaxy Note 20", "Samsung", 1100, 10353);

-- *=> Ecrire une requête pour liste tous les modèles de téléphones

SELECT name FROM telephones;

-- *=> Ecrire une requête pour lister tous les 
-- telephone(name, manufacturer) de tous les
-- téléphone dont le prix est supérieur à 200€

SELECT name, manufacturer FROM telephones where price > 200;

-- *=> Ecrire une requête pour lister tous les 
-- telephone(name, manufacturer) de tous les
-- téléphone dont le prix est varie entre 150 et 200€

SELECT name, manufacturer FROM telephones where price > 149 AND price < 201;

-- *=> Lister tous les téléphones de marque samsung et Apple

SELECT * FROM telephones WHERE manufacturer='Apple' OR manufacturer='Samsung' ORDER BY price ASC;
