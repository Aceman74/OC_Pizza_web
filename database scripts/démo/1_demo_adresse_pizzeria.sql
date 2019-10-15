SELECT oc_pizza.pizzeria.nom_pizzeria_id AS "Pizzeria",oc_pizza.pizzeria.horaires, oc_pizza.pizzeria.distance_livraison, oc_pizza.adresse.*
FROM oc_pizza.pizzeria
INNER JOIN oc_pizza.adresse ON oc_pizza.adresse.nom_pizzeria_id = oc_pizza.pizzeria.nom_pizzeria_id
WHERE oc_pizza.adresse.nom_pizzeria_id = oc_pizza.pizzeria.nom_pizzeria_id AND oc_pizza.adresse.client_id IS NULL;