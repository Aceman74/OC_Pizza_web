INSERT INTO oc_pizza.pizzeria(
nom_pizzeria_id,horaires,distance_livraison)
VALUES(
'OCPizza du Lac', 'Du Lundi au Samedi de 11h a 21h',20),
('OCPizza Capital', 'Du Lundi au Samedi de 12h a 22h',15),
('OCPizza du Port', 'Du Lundi au Samedi de 12h a 22h',15),
('OCPizza du Nord', 'Du Lundi au Samedi de 11h a 21h',20);

INSERT INTO oc_pizza.adresse(
rue,complement_adresse,code_postale,ville,telephone,email,adresse_livraison,adresse_facturation,nom_pizzeria_id)
VALUES(
'51 Route de Frize', NULL, 74140, 'Messery', 0630254436, 'OCpizzaLac@gmail.com', TRUE, TRUE, 'OCPizza du Lac'),
('51 Route de Paris', 'Sous tour Effeil', 75000, 'Paris', 0675007500, 'OCpizzaParis@gmail.com', TRUE, TRUE, 'OCPizza Capital'),
('51 Route du Vieux Port', NULL, 13000, 'Marseille', 0613001300, 'OCpizzaMarseille@gmail.com', TRUE, TRUE, 'OCPizza du Port'),
('51 Route de Dieppe', 'Devant la piscine', 76200, 'Dieppe', 0676207620, 'OCpizzaNormandie@gmail.com', TRUE, TRUE, 'OCPizza du Nord');

INSERT INTO oc_pizza.identifiant(
identifiant_id, est_client, est_employe, login, mot_de_passe)
VALUES(
1, FALSE, TRUE, 'jamesBond','espion007'),
(2, FALSE, TRUE, 'JePerce','BRO5nan'),
(3, FALSE, TRUE, 'Mojo','YEAHbaby'),
(4, FALSE, TRUE, 'mike','MMY69'),
(5, FALSE, TRUE, 'Lucien','Bramart'),
(6, FALSE, TRUE, 'JeanD','111111'),
(7, FALSE, TRUE, 'Queen','ELIZABAIT2'),
(8, FALSE, TRUE,  'Row','atkiki_'),
(9, TRUE, FALSE,  'SayMyName','Heinsenberg'),
(10, TRUE, FALSE,  'PrisonMike','DUNDERMIFFLIN'),
(11, TRUE, FALSE,  'rick','morty'),
(12, TRUE, FALSE,  'Yarl','Lagertha');

INSERT INTO oc_pizza.type_employe(
type_employe_id, livreur, pizzaiolo, receptionniste)
VALUES(
1, TRUE, FALSE, FALSE),
(2, FALSE, TRUE, TRUE),
(3, FALSE, TRUE, FALSE),
(4, TRUE, FALSE, FALSE),
(5, FALSE, TRUE, TRUE),
(6, TRUE, FALSE, FALSE),
(7, FALSE, TRUE, FALSE),
(8, TRUE, FALSE, TRUE);

INSERT INTO oc_pizza.employe(
identifiant_id ,type_employe_id, nom, prenom, nom_pizzeria_id)
VALUES(
1, 1, 'Bond', 'James', 'OCPizza du Lac'),
(2, 2, 'Brosnan', 'Pierce', 'OCPizza du Lac'),
(3, 3, 'Powers', 'Austin', 'OCPizza Capital'),
(4, 4, 'Myers', 'Mike', 'OCPizza Capital'),
(5, 5, 'Bonnisseur', 'Hubert', 'OCPizza du Port'),
(6, 6, 'Dujardin', 'Jean', 'OCPizza du Port'),
(7, 7, 'English', 'Johnny', 'OCPizza du Nord'),
(8, 8, 'Atkinson', 'Rowan', 'OCPizza du Nord');

INSERT INTO oc_pizza.client(
nom, prenom, date_naissance,identifiant_id)
VALUES(
'White', 'Walter', '1959-09-07', 9),
('Scott', 'Mickael', '1964-05-15', 10),
('Sanchez', 'Rick', '1965-01-01', 11),
('Lodbrok', 'Ragnar', '0840-06-10', 12);

INSERT INTO oc_pizza.pizza (
nom_pizza_id,prix_unitaire_ht)
VALUES(
'Reine', 10.25),('4 Fromages', 12.00),
('Calzone', 10.50),('Margherita', 11.50);

INSERT INTO oc_pizza.stock_ingredient(
nom_ingredient, quantite_totale, nom_pizzeria_id)
VALUES (
'Champignons','2500','OCPizza du Lac'),('Chèvre','4100','OCPizza du Lac'),
('Sauce Tomate','6200','OCPizza du Lac'),('Jambon','4200','OCPizza du Lac'),
('Gruyère','4100','OCPizza du Lac'),('Olive','2500','OCPizza du Lac'),
('Mozzarella','4000','OCPizza du Lac'),('Bleu','3800','OCPizza du Lac'),
('Champignons','3100','OCPizza Capital'),('Chèvre','4500','OCPizza Capital'),
('Sauce Tomate','6300','OCPizza Capital'),('Jambon','4250','OCPizza Capital'),
('Gruyère','4300','OCPizza Capital'),('Olive','2150','OCPizza Capital'),
('Mozzarella','4100','OCPizza Capital'),('Bleu','3100','OCPizza Capital'),
('Champignons','3100','OCPizza du Port'),('Chèvre','4200','OCPizza du Port'),
('Sauce Tomate','6200','OCPizza du Port'),('Jambon','4050','OCPizza du Port'),
('Gruyère','4800','OCPizza du Port'),('Olive','2050','OCPizza du Port'),
('Mozzarella','4400','OCPizza du Port'),('Bleu','3000','OCPizza du Port'),
('Champignons','3200','OCPizza du Nord'),('Chèvre','3500','OCPizza du Nord'),
('Sauce Tomate','6250','OCPizza du Nord'),('Jambon','3200','OCPizza du Nord'),
('Gruyère','3500','OCPizza du Nord'),('Olive','2100','OCPizza du Nord'),
('Mozzarella','2800','OCPizza du Nord'),('Bleu','3250','OCPizza du Nord');

INSERT INTO oc_pizza.adresse(
rue,complement_adresse,code_postale,ville,telephone,email,adresse_livraison,adresse_facturation,nom_pizzeria_id,client_id)
VALUES(
'51 Route Albuquerque', NULL, 74140, 'Messery', 0630303030, 'BabyBlue@gmail.com', TRUE, TRUE, 'OCPizza du Lac', (SELECT oc_pizza.client.client_id FROM oc_pizza.client  WHERE oc_pizza.client.nom = 'White')),
('51 Route de Scranton', NULL, 75000, 'Paris', 0675757575, 'Dunder4Life@gmail.com', FALSE, TRUE, 'OCPizza Capital', (SELECT oc_pizza.client.client_id FROM oc_pizza.client  WHERE oc_pizza.client.nom = 'Scott')),
('108 Route de la Tour', NULL, 75000, 'Paris', 0601050408, 'DwightSchrute@gmail.com', TRUE, FALSE, 'OCPizza Capital', (SELECT oc_pizza.client.client_id FROM oc_pizza.client  WHERE oc_pizza.client.nom = 'Scott')),
('51 Route Inconnu', 'Deposer devant la porte 12', 13000, 'Marseille', 0613111311, 'pickleRick@gmail.com', TRUE, TRUE, 'OCPizza du Port', (SELECT oc_pizza.client.client_id FROM oc_pizza.client  WHERE oc_pizza.client.nom = 'Sanchez')),
('51 Route du valhalla', 'Frapper fort', 76200, 'Dieppe', 0676227622, 'northenLegend@gmail.com', TRUE, TRUE, 'OCPizza du Nord', (SELECT oc_pizza.client.client_id FROM oc_pizza.client  WHERE oc_pizza.client.nom = 'Lodbrok'));

INSERT INTO oc_pizza.recette(
nom_pizza_id, description)
VALUES(
	'Reine','200g Champignon de Paris, 200g Janbon, 300g Sauce tomate, Gruyere.'),('4 Fromages','200g Chevre, 200g Bleu, 200g Mozzarella, 200g Gruyère.'),
	('Calzone','200g Mozzarella, 200g Jambon, 100g Champignon, 4 Oeufs, 100g Olive.'),('Margherita','200g Jambon, 100g Gruyère, 150g Champignon, 200g Mozzarella');

INSERT INTO oc_pizza.commande(
client_id, date, deja_payee, heure_livree, livreur_id, statut_en_preparation, statut_livree, statut_prete,type_paiement)
VALUES(
	1, '2019-07-16', TRUE, '18:00:50', (SELECT oc_pizza.employe.employe_id FROM oc_pizza.employe  WHERE oc_pizza.employe.nom = 'Bond'), FALSE, TRUE, FALSE, 'Paypal'),
( 2, '2019-07-17', TRUE, NULL, (SELECT oc_pizza.employe.employe_id FROM oc_pizza.employe  WHERE oc_pizza.employe.nom = 'Brosnan'), FALSE, FALSE, TRUE, 'Espèce'),
( 3, '2019-07-17', FALSE, NULL, (SELECT oc_pizza.employe.employe_id FROM oc_pizza.employe  WHERE oc_pizza.employe.nom = 'Brosnan'), TRUE, FALSE, FALSE, 'CB comptoir'),
( 4, '2019-07-17', FALSE, NULL, (SELECT oc_pizza.employe.employe_id FROM oc_pizza.employe  WHERE oc_pizza.employe.nom = 'Brosnan'), TRUE, FALSE, FALSE, 'Espèce');

	INSERT INTO oc_pizza.ingredient_requis(
stock_id, ingredient_requis, quantite_requise, nom_pizza_id)
VALUES(
	(SELECT oc_pizza.stock_ingredient.stock_id FROM oc_pizza.stock_ingredient  WHERE oc_pizza.stock_ingredient.nom_ingredient = 'Champignons' AND oc_pizza.stock_ingredient.nom_pizzeria_id = 'OCPizza du Lac'),'Champignons','100','Reine'),
	((SELECT oc_pizza.stock_ingredient.stock_id FROM oc_pizza.stock_ingredient  WHERE oc_pizza.stock_ingredient.nom_ingredient = 'Chèvre' AND oc_pizza.stock_ingredient.nom_pizzeria_id = 'OCPizza du Lac'),'Chèvre','250','Reine'),
	((SELECT oc_pizza.stock_ingredient.stock_id FROM oc_pizza.stock_ingredient  WHERE oc_pizza.stock_ingredient.nom_ingredient = 'Sauce Tomate' AND oc_pizza.stock_ingredient.nom_pizzeria_id = 'OCPizza du Lac'),'Sauce Tomate','300','Calzone'),
	((SELECT oc_pizza.stock_ingredient.stock_id FROM oc_pizza.stock_ingredient  WHERE oc_pizza.stock_ingredient.nom_ingredient = 'Jambon' AND oc_pizza.stock_ingredient.nom_pizzeria_id = 'OCPizza du Lac'),'Jambon','200','Margherita'),
	((SELECT oc_pizza.stock_ingredient.stock_id FROM oc_pizza.stock_ingredient  WHERE oc_pizza.stock_ingredient.nom_ingredient = 'Gruyère' AND oc_pizza.stock_ingredient.nom_pizzeria_id = 'OCPizza du Lac'),'Gruyère','150','Reine'),
	((SELECT oc_pizza.stock_ingredient.stock_id FROM oc_pizza.stock_ingredient  WHERE oc_pizza.stock_ingredient.nom_ingredient = 'Olive' AND oc_pizza.stock_ingredient.nom_pizzeria_id = 'OCPizza du Lac'),'Olive','50','Margherita'),
	((SELECT oc_pizza.stock_ingredient.stock_id FROM oc_pizza.stock_ingredient  WHERE oc_pizza.stock_ingredient.nom_ingredient = 'Mozzarella' AND oc_pizza.stock_ingredient.nom_pizzeria_id = 'OCPizza du Lac'),'Mozzarella','150','4 Fromages'),
	((SELECT oc_pizza.stock_ingredient.stock_id FROM oc_pizza.stock_ingredient  WHERE oc_pizza.stock_ingredient.nom_ingredient = 'Bleu' AND oc_pizza.stock_ingredient.nom_pizzeria_id = 'OCPizza du Lac'),'Bleu','100','4 Fromages');
	
INSERT INTO oc_pizza.ligne_commande(
date, quantite, numero_commande_id, nom_pizza_id)
VALUES(
	'2019-07-16', 2 , 1, 'Reine'),
	('2019-07-17', 1 , 2, '4 Fromages'),
	('2019-07-17', 2 , 3, 'Calzone'),
	('2019-07-17', 1 , 4, 'Margherita');
	

