SELECT oc_pizza.employe.nom_pizzeria_id AS "Pizzeria", oc_pizza.employe.prenom AS "Prenom", oc_pizza.employe.nom AS "Nom", oc_pizza.identifiant.*
FROM oc_pizza.employe
INNER JOIN oc_pizza.identifiant ON oc_pizza.identifiant.identifiant_id = oc_pizza.employe.identifiant_id
WHERE oc_pizza.identifiant.identifiant_id = oc_pizza.employe.identifiant_id ;

/*     -- Client Identifiant --
SELECT oc_pizza.client.prenom AS "Prenom", oc_pizza.client.nom AS "Nom", oc_pizza.identifiant.*
FROM oc_pizza.client
INNER JOIN oc_pizza.identifiant ON oc_pizza.identifiant.identifiant_id = oc_pizza.client.identifiant_id
WHERE oc_pizza.identifiant.identifiant_id = oc_pizza.client.identifiant_id ;
*/