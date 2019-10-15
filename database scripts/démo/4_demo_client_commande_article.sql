SELECT oc_pizza.client.prenom AS "Prenom", oc_pizza.client.nom AS "Nom", oc_pizza.client.client_id AS "Numero Commande", oc_pizza.commande.*, oc_pizza.ligne_commande.*, oc_pizza.pizza.*
FROM oc_pizza.client
INNER JOIN oc_pizza.commande ON oc_pizza.commande.client_id = oc_pizza.client.client_id
INNER JOIN oc_pizza.ligne_commande ON oc_pizza.commande.numero_commande_id = oc_pizza.ligne_commande.numero_commande_id
INNER JOIN oc_pizza.pizza ON oc_pizza.pizza.nom_pizza_id = oc_pizza.ligne_commande.nom_pizza_id;