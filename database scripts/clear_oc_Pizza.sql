----- [TRUNCATE] supprime le contenu de la table et [RESTART IDENTITY] remet a zero la sequence d'incrémentation liée ----
TRUNCATE oc_pizza.recette RESTART IDENTITY CASCADE ;
TRUNCATE oc_pizza.ligne_commande RESTART IDENTITY CASCADE;
TRUNCATE oc_pizza.commande RESTART IDENTITY CASCADE;
TRUNCATE oc_pizza.adresse RESTART IDENTITY CASCADE;
TRUNCATE oc_pizza.client RESTART IDENTITY CASCADE;
TRUNCATE oc_pizza.employe RESTART IDENTITY CASCADE;
TRUNCATE oc_pizza.type_employe RESTART IDENTITY CASCADE;
TRUNCATE oc_pizza.identifiant RESTART IDENTITY CASCADE;
TRUNCATE oc_pizza.ingredient_requis RESTART IDENTITY CASCADE;
TRUNCATE oc_pizza.stock_ingredient RESTART IDENTITY CASCADE;
TRUNCATE oc_pizza.pizzeria RESTART IDENTITY CASCADE;
TRUNCATE oc_pizza.pizza RESTART IDENTITY CASCADE;