SELECT  oc_pizza.client.prenom AS "Prenom", oc_pizza.client.nom AS "Nom", oc_pizza.adresse.*
FROM oc_pizza.client
INNER JOIN oc_pizza.adresse ON oc_pizza.adresse.client_id = oc_pizza.client.client_id
WHERE oc_pizza.adresse.client_id = oc_pizza.client.client_id ;