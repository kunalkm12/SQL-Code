use sakila;
SELECT I1.film_id, F1.length, AVG(datediff(R1.return_date, R1.rental_date)) as avg_days FROM rental R1
INNER JOIN inventory I1 ON R1.inventory_id = I1.inventory_id
INNER JOIN film F1 ON I1.film_id = F1.film_id
GROUP BY I1.film_id