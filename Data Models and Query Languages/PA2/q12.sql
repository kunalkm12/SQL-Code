use sakila;
SELECT Tabfin.film_id, Tabfin.difference as to_breakeven FROM
(
SELECT Tab2.*, SUM(P1.amount) as paid, (Tab2.replacement_cost-SUM(P1.amount)) as difference FROM
(
SELECT Tab1.*, R1.rental_id FROM
(
SELECT F1.film_id, F1.replacement_cost, I1.inventory_id FROM film F1
INNER JOIN inventory I1
ON F1.film_id = I1.film_id
) Tab1
INNER JOIN rental R1 ON Tab1.inventory_id = R1.inventory_id
) Tab2
INNER JOIN payment P1 ON Tab2.rental_id = P1.rental_id
GROUP BY Tab2.film_id
HAVING SUM(P1.amount)<Tab2.replacement_cost
ORDER BY difference
LIMIT 5 OFFSET 5
) Tabfin
ORDER BY Tabfin.film_id 
