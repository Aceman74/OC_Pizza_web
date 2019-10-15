CREATE SCHEMA oc_pizza;

CREATE SEQUENCE oc_pizza.type_employe_employe_id_seq;

CREATE TABLE oc_pizza.type_employe (
                type_employe_id INTEGER NOT NULL DEFAULT nextval('oc_pizza.type_employe_employe_id_seq'),
                livreur BOOLEAN NOT NULL,
                pizzaiolo BOOLEAN NOT NULL,
                receptionniste BOOLEAN NOT NULL,
                CONSTRAINT type_employe_pk PRIMARY KEY (type_employe_id)
);


ALTER SEQUENCE oc_pizza.type_employe_employe_id_seq OWNED BY oc_pizza.type_employe.type_employe_id;

CREATE SEQUENCE oc_pizza.identifiant_identifiant_id_seq;

CREATE TABLE oc_pizza.identifiant (
                identifiant_id INTEGER NOT NULL DEFAULT nextval('oc_pizza.identifiant_identifiant_id_seq'),
                login VARCHAR(20) NOT NULL,
                mot_de_passe VARCHAR(20) NOT NULL,
                est_employe BOOLEAN NOT NULL,
                est_client BOOLEAN NOT NULL,
                CONSTRAINT identifiant_pk PRIMARY KEY (identifiant_id)
);


ALTER SEQUENCE oc_pizza.identifiant_identifiant_id_seq OWNED BY oc_pizza.identifiant.identifiant_id;

CREATE SEQUENCE oc_pizza.client_client_id_seq;

CREATE TABLE oc_pizza.client (
                client_id INTEGER NOT NULL DEFAULT nextval('oc_pizza.client_client_id_seq'),
                nom VARCHAR(100) NOT NULL,
                prenom VARCHAR(100) NOT NULL,
                date_naissance DATE NOT NULL,
                identifiant_id INTEGER NOT NULL,
                CONSTRAINT client_pk PRIMARY KEY (client_id)
);


ALTER SEQUENCE oc_pizza.client_client_id_seq OWNED BY oc_pizza.client.client_id;

CREATE SEQUENCE oc_pizza.pizzeria_nom_pizzeria_id_seq;

CREATE TABLE oc_pizza.pizzeria (
                nom_pizzeria_id VARCHAR(50) NOT NULL DEFAULT nextval('oc_pizza.pizzeria_nom_pizzeria_id_seq'),
                horaires VARCHAR(100) NOT NULL,
                distance_livraison INTEGER NOT NULL,
                CONSTRAINT pizzeria_pk PRIMARY KEY (nom_pizzeria_id)
);


ALTER SEQUENCE oc_pizza.pizzeria_nom_pizzeria_id_seq OWNED BY oc_pizza.pizzeria.nom_pizzeria_id;

CREATE SEQUENCE oc_pizza.stock_ingredient_ingredient_id_seq;

CREATE TABLE oc_pizza.stock_ingredient (
                stock_id INTEGER NOT NULL DEFAULT nextval('oc_pizza.stock_ingredient_ingredient_id_seq'),
                nom_ingredient VARCHAR(50) NOT NULL,
                quantite_totale INTEGER NOT NULL,
                nom_pizzeria_id VARCHAR(50) NOT NULL,
                CONSTRAINT stock_ingredient_pk PRIMARY KEY (stock_id)
);


ALTER SEQUENCE oc_pizza.stock_ingredient_ingredient_id_seq OWNED BY oc_pizza.stock_ingredient.stock_id;

CREATE SEQUENCE oc_pizza.pizza_nom_pizza_id_seq;

CREATE TABLE oc_pizza.pizza (
                nom_pizza_id VARCHAR(50) NOT NULL DEFAULT nextval('oc_pizza.pizza_nom_pizza_id_seq'),
                prix_unitaire_ht NUMERIC(5,2) NOT NULL,
                CONSTRAINT pizza_pk PRIMARY KEY (nom_pizza_id)
);


ALTER SEQUENCE oc_pizza.pizza_nom_pizza_id_seq OWNED BY oc_pizza.pizza.nom_pizza_id;

CREATE TABLE oc_pizza.ingredient_requis (
                stock_id INTEGER NOT NULL,
                ingredient_requis VARCHAR(50) NOT NULL,
                quantite_requise INTEGER NOT NULL,
                nom_pizza_id VARCHAR(50) NOT NULL,
                CONSTRAINT ingredient_requis_pk PRIMARY KEY (stock_id)
);


CREATE TABLE oc_pizza.recette (
                nom_pizza_id VARCHAR(50) NOT NULL,
                description VARCHAR(200) NOT NULL,
                CONSTRAINT recette_pk PRIMARY KEY (nom_pizza_id)
);


CREATE SEQUENCE oc_pizza.employe_employe_id_seq;

CREATE TABLE oc_pizza.employe (
                employe_id INTEGER NOT NULL DEFAULT nextval('oc_pizza.employe_employe_id_seq'),
                nom_pizzeria_id VARCHAR(50) NOT NULL,
                nom VARCHAR(100) NOT NULL,
                prenom VARCHAR(100) NOT NULL,
                identifiant_id INTEGER NOT NULL,
                type_employe_id INTEGER NOT NULL,
                CONSTRAINT employe_pk PRIMARY KEY (employe_id)
);


ALTER SEQUENCE oc_pizza.employe_employe_id_seq OWNED BY oc_pizza.employe.employe_id;

CREATE SEQUENCE oc_pizza.commande_numero_commande_seq;

CREATE TABLE oc_pizza.commande (
                numero_commande_id INTEGER NOT NULL DEFAULT nextval('oc_pizza.commande_numero_commande_seq'),
                type_paiement VARCHAR(50) NOT NULL,
                date DATE NOT NULL,
                deja_payee BOOLEAN NOT NULL,
                statut_en_preparation BOOLEAN NOT NULL,
                statut_prete BOOLEAN NOT NULL,
                statut_livree BOOLEAN NOT NULL,
                heure_livree TIME,
                livreur_id INTEGER,
                client_id INTEGER NOT NULL,
                CONSTRAINT commande_pk PRIMARY KEY (numero_commande_id)
);


ALTER SEQUENCE oc_pizza.commande_numero_commande_seq OWNED BY oc_pizza.commande.numero_commande_id;

CREATE TABLE oc_pizza.ligne_commande (
                numero_commande_id INTEGER NOT NULL,
                date DATE NOT NULL,
                quantite INTEGER NOT NULL,
                nom_pizza_id VARCHAR(50) NOT NULL,
                CONSTRAINT ligne_commande_pk PRIMARY KEY (numero_commande_id)
);


CREATE SEQUENCE oc_pizza.adresse_adresse_id_seq;

CREATE TABLE oc_pizza.adresse (
                adresse_id INTEGER NOT NULL DEFAULT nextval('oc_pizza.adresse_adresse_id_seq'),
                rue VARCHAR(50) NOT NULL,
                complement_adresse VARCHAR(50),
                code_postale NUMERIC(5) NOT NULL,
                ville VARCHAR(50) NOT NULL,
                telephone NUMERIC(10) NOT NULL,
                email VARCHAR(100) NOT NULL,
                adresse_livraison BOOLEAN NOT NULL,
                adresse_facturation BOOLEAN NOT NULL,
                nom_pizzeria_id VARCHAR(50) NOT NULL,
                client_id INTEGER,
                CONSTRAINT adresse_pk PRIMARY KEY (adresse_id)
);


ALTER SEQUENCE oc_pizza.adresse_adresse_id_seq OWNED BY oc_pizza.adresse.adresse_id;

ALTER TABLE oc_pizza.employe ADD CONSTRAINT type_employe_employe_fk
FOREIGN KEY (type_employe_id)
REFERENCES oc_pizza.type_employe (type_employe_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE oc_pizza.employe ADD CONSTRAINT identifiant_employe_fk
FOREIGN KEY (identifiant_id)
REFERENCES oc_pizza.identifiant (identifiant_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE oc_pizza.client ADD CONSTRAINT identifiant_client_fk
FOREIGN KEY (identifiant_id)
REFERENCES oc_pizza.identifiant (identifiant_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE oc_pizza.commande ADD CONSTRAINT client_commande_fk
FOREIGN KEY (client_id)
REFERENCES oc_pizza.client (client_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE oc_pizza.adresse ADD CONSTRAINT client_adresse_fk
FOREIGN KEY (client_id)
REFERENCES oc_pizza.client (client_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE oc_pizza.employe ADD CONSTRAINT pizzeria_employe_fk
FOREIGN KEY (nom_pizzeria_id)
REFERENCES oc_pizza.pizzeria (nom_pizzeria_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE oc_pizza.adresse ADD CONSTRAINT pizzeria_adresse_fk
FOREIGN KEY (nom_pizzeria_id)
REFERENCES oc_pizza.pizzeria (nom_pizzeria_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE oc_pizza.stock_ingredient ADD CONSTRAINT pizzeria_stock_ingredient_fk
FOREIGN KEY (nom_pizzeria_id)
REFERENCES oc_pizza.pizzeria (nom_pizzeria_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE oc_pizza.ingredient_requis ADD CONSTRAINT stock_ingredient_ingredient_requis_fk
FOREIGN KEY (stock_id)
REFERENCES oc_pizza.stock_ingredient (stock_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE oc_pizza.recette ADD CONSTRAINT pizza_recette_fk
FOREIGN KEY (nom_pizza_id)
REFERENCES oc_pizza.pizza (nom_pizza_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE oc_pizza.ingredient_requis ADD CONSTRAINT pizza_ingredient_requis_fk
FOREIGN KEY (nom_pizza_id)
REFERENCES oc_pizza.pizza (nom_pizza_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE oc_pizza.ligne_commande ADD CONSTRAINT pizza_ligne_commande_fk
FOREIGN KEY (nom_pizza_id)
REFERENCES oc_pizza.pizza (nom_pizza_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE oc_pizza.commande ADD CONSTRAINT employe_commande_fk
FOREIGN KEY (livreur_id)
REFERENCES oc_pizza.employe (employe_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE oc_pizza.ligne_commande ADD CONSTRAINT commande_lignecommande_fk
FOREIGN KEY (numero_commande_id)
REFERENCES oc_pizza.commande (numero_commande_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
