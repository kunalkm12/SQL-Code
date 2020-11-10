use sakila;
SELECT P1.rental_id, P1.payment_id FROM payment P1
WHERE P1.amount <= ALL (
SELECT P2.amount
FROM payment P2
WHERE P1.payment_id != P2.payment_id
)
ORDER BY P1.rental_id;