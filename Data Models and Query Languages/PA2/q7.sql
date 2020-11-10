use sakila;
SELECT Tab1.actor_name, COUNT(DISTINCT(FC1.category_id)) as ncat
FROM 
(
SELECT A1.actor_id as AID, F1.film_id as FID, CONCAT(first_name, " ", last_name) AS actor_name FROM actor A1
INNER JOIN film_actor F1
ON A1.actor_id = F1.actor_id
) Tab1
INNER JOIN film_category FC1
ON Tab1.FID = FC1.film_id
GROUP BY Tab1.actor_name
ORDER BY Tab1.actor_name