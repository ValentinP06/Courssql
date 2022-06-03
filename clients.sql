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

SELECT * FROM telephones WHERE manufacturer='Apple' OR manufacturer='Samsung';


--COURS DU 03 JUIN

-- creation de la table telephone 

CREATE table telephones (
id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
numero VARCHAR (20) NOT NULL,
id_client INTEGERR,
FOREIGN KEY(id_client) REFERENCES clients(id) ON DELETE CASCADE on update CASCADE
);

-- Supprimer une colonne

ALTER TABLE clients DROP COLUMN telephones;

-- Supprimer une table

 DROP TABLE clients;

-- Supprimer une base de données

 DROP DATABASE sales;


 INSERT INTO telephones(numero,id_client) values("0636363336",1),("0637363336",1),("0736363336",1),("0638863336",2),("0636360946",2),("0636364446",3),("0637380336",4),("0708463336",4),("0636363339",5),("0636222236",6),("0636363333",6),("0788363336",6),("0639993336",6);

-- Join query

-- Afficher tous les numéros de téléphone de tous les clients

 -- table sollicité : clients et téléphones


SELECT clients.prenom, clients.nom, clients.email, telephones.numero
FROM clients Join telephones ON clients.id=telephones.id_client;

-- Jointure et concatenation

SELECT CONCAT (clients.prenom," ", clients.nom) as nom, clients.email, telephones.numero
FROM clients Join telephones ON clients.id=telephones.id_client;

--Jointure et concaténation

SELECT CONCAT(clients.prenom," ",clients.nom) AS nom, clients.email,telephones.numero FROM clients JOIN telephones ON clients.id=telephones.id_client WHERE clients.id=1;


-- TP2 du 3 juin 2022

-- creer la base de données
CREATE DATABASE TP2;
USE DATABASE TP2;

--créer la table orders 

CREATE TABLE orders(
id INTEGER AUTO_INCREMENT PRIMARY KEY,
typePresta VARCHAR(50),
designation VARCHAR(50),
clientId INTEGER,
nbDays INTEGER,
unitPrice INTEGER,
State INTEGER
);

-- CREATE TABLE orders(id INTEGER PRIMARY KEY, typePresta VARCHAR, designation VARCHAR, clientId INTEGER, nbDays INTEGER, unitPrice INTEGER, states INTEGER);

INSERT INTO orders(id, typePresta, designation, clientId, nbDays,unitPrice, State) VALUES
(1, "Formation", "Angular init", 2, 3, 1200, 0),
(2, "Formation", "React avancé ", 2, 3, 1000, 2),
(3, "Coaching", "React Techlead", 1, 20, 900, 2),
(4, "Coaching", "Nest.jsTechlead", 1, 50,800, 1),
(5, "Coaching", "ReactTechlead", 3, 60,4000, 0),
(6, "Coaching", "Jakarta EE", 3, 70, 5000, 1),
(7, "Coaching", "AngularTechlead", 4, 80, 87, 2);

INSERT INTO orders(id, typePresta, designation, clientId, nbDays,unitPrice, State) VALUES
(8, "Coaching", "LEGO init", 2, 3, 12500, 0),
(9, "Coaching", "DEV avancé ", 2, 3, 10, 2),
(10, "Coaching", "UX Techlead", 1, 20, 900, 2);

-- Voirs la table orders
SELECT * FROM orders;

-- Cration de la vue pour afficher le total avec les taxes et taxes avec TVA 20%

CREATE VIEW total_taxe AS SELECT id, typePresta, designation, clientId, nbDays,unitPrice, State, (nbDays*unitPrice) AS total_taxe_exclued, (nbDays*unitPrice*1.2) AS Total_taxe FROM orders;

SELECT * FROM total_taxe;

-- Création de la table clients

CREATE TABLE clients(
id INTEGER AUTO_INCREMENT PRIMARY KEY,
companyName VARCHAR(50),
firstName VARCHAR(50),
lastName VARCHAR(50),
email VARCHAR(50),
phone VARCHAR(50),
adress VARCHAR(50),
zipCode VARCHAR(50),
city VARCHAR(50),
country VARCHAR(50),
state INTEGER
);

-- Insertion des données dans la table clients

INSERT INTO clients (
    id,
    companyName,
    firstName,
    lastName,
    email,
    phone,
    adress,
    zipCode,
    city,
    country,
    state
) VALUES 

(1,"Capgemini" ,"Fabrice","Martin","martin@mail.com","06 56 85 84 33","abc","xyz","Nantes","France",0),
(2,"M2iFormation" ,"ludo","hihi","ludo@mail.com","06 00 11 22 33","def","ijk","Stras","France",1),
(3,"ATOS" ,"titi","once","titi@mail.com","06 00 11 22 33","def","ijk","Stras","France",2),
(4,"sopra" ,"jack","thecat","jackcat@mail.com","06 00 11 22 33","def","ijk","Stras","France",0);

-- *=> Ecrire une requête pour créer ces 2 tables en prenant en compte la jointure

SELECT orders.typePresta, orders.designation, orders.unitPrice, clients.companyName, clients.firstName, clients.lastName, clients.email
FROM orders Join clients ON clients.id=orders.clientId;

-- *=> Afficher toutes les formations sollicités par le client M2i formation


SELECT orders.typePresta, orders.designation, clients.companyName
FROM orders Join clients ON clients.id=orders.clientId WHERE companyName="M2iFormation";

--*=> Afficher les noms et contacts de tous les contacts des clients qui ont sollicité un coaching

SELECT orders.typePresta, orders.designation, clients.lastName, clients.email
FROM orders Join clients ON clients.id=orders.clientId WHERE typePresta="Coaching";

-- *=> Afficher les noms et contacts de tous les contacts des clients qui ont sollicité un coaching
--     pour les accompagnements React.js

SELECT orders.typePresta, orders.designation, clients.lastName, clients.email
FROM orders Join clients ON clients.id=orders.clientId WHERE designation="ReactTechlead";

-- *=> Pour chacune des demandes de formation, afficher le prix UHT et prix TTC en se basant sur le 
--     unité Price(TJM) et le nombre de jours de prestation tout en sachant que la TVA est de 20%.
CREATE VIEW Totaltaxe AS SELECT id, typePresta, designation, nbDays,unitPrice, (nbDays*unitPrice) AS "PRIX UHT", (nbDays*unitPrice*1.2) AS "Prix TTC" FROM orders;

SELECT * FROM totaltaxe;

-- *=> Lister toutes les prestations qui sont confirmés et qui vont rapporter plus 30.000€

SELECT orders.typePresta, orders.designation, orders.state
FROM orders Join clients ON clients.id=orders.clientId WHERE (nbDays*unitPrice*1.2)>30000 AND State=2;


ALTER TABLE clients MODIFY COLUMN State DECIMAL (0,1);