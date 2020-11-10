use sakila;
SELECT Tab1.customer_id, SUM(P1.amount) as total, COUNT(*) as n_rent FROM
(
SELECT C1.customer_id, R1.rental_id FROM rental R1
INNER JOIN customer C1
ON R1.customer_id = C1.customer_id
) Tab1
INNER JOIN
payment P1 ON Tab1.rental_id = P1.rental_id
GROUP BY Tab1.customer_id
HAVING total > 100
ORDER BY Tab1.customer_id