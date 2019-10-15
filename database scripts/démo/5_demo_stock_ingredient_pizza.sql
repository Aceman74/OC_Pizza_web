SELECT oc_pizza.stock_ingredient.nom_ingredient AS "Ingredient", oc_pizza.stock_ingredient.quantite_totale AS "Quantité", oc_pizza.stock_ingredient.nom_pizzeria_id AS "Pizzeria", oc_pizza.ingredient_requis.*, oc_pizza.pizza.*
FROM oc_pizza.stock_ingredient
INNER JOIN oc_pizza.ingredient_requis ON oc_pizza.ingredient_requis.ingredient_requis = oc_pizza.stock_ingredient.nom_ingredient
INNER JOIN oc_pizza.pizza ON oc_pizza.ingredient_requis.nom_pizza_id = oc_pizza.pizza.nom_pizza_id
ORDER BY nom_pizzeria_id ASC;