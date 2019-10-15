SELECT oc_pizza.pizza.nom_pizza_id AS "Pizza", oc_pizza.ingredient_requis.*, oc_pizza.recette.*
FROM oc_pizza.pizza
INNER JOIN oc_pizza.recette ON oc_pizza.pizza.nom_pizza_id = oc_pizza.recette.nom_pizza_id
INNER JOIN oc_pizza.ingredient_requis ON oc_pizza.pizza.nom_pizza_id = oc_pizza.ingredient_requis.nom_pizza_id
ORDER BY pizza.nom_pizza_id ASC;