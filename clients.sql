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