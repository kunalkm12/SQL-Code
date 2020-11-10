use sakila;
UPDATE customer SET active = 0 WHERE first_name = 'MARIA' AND last_name = 'MILLER';
SELECT email, active from customer WHERE first_name = 'MARIA' AND last_name = 'MILLER';