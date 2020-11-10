use sakila;
SELECT * FROM
(
SELECT C1.customer_id, I1.film_id, R1.rental_date FROM rental R1
INNER JOIN customer C1 ON R1.customer_id = C1.customer_id
INNER JOIN inventory I1 ON R1.inventory_id = I1.inventory_id AND C1.store_id = I1.store_id
ORDER BY C1.customer_id, R1.rental_date, R1.return_date
) Tab1
INNER JOIN
(
SELECT C1.customer_id, I1.film_id, R1.rental_date FROM rental R1
INNER JOIN customer C1 ON R1.customer_id = C1.customer_id
INNER JOIN inventory I1 ON R1.inventory_id = I1.inventory_id AND C1.store_id = I1.store_id
ORDER BY C1.customer_id, R1.rental_date, R1.return_date
) Tab2
ON Tab1.customer_id = Tab2.customer_id
