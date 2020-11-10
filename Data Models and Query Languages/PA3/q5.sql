use sakila;
WITH RECURSIVE tab1 as
(
SELECT T1.id as c1, T2.id as c2, ROUND((ST_Distance_Sphere(T1.location, T2.location) * .000621371192),2) as distance FROM 
(
SELECT cus1.customer_id as id, add1.location as location
FROM customer cus1, address add1
WHERE cus1.address_id = add1.address_id 
AND 
(
ST_X(add1.location)>-180 AND ST_X(add1.location)<= 180
)
AND 
ST_Y(add1.location) <=90
) T1
INNER JOIN
(
SELECT cus1.customer_id as id, add1.location as location
FROM customer cus1, address add1
WHERE cus1.address_id = add1.address_id 
AND 
(
ST_X(add1.location)>-180 AND ST_X(add1.location)<= 180
)
AND ST_Y(add1.location) <=90
) T2

WHERE T1.id < T2.id
HAVING distance < 20 AND distance !=0
),


tab2 as 
(
SELECT c1, c2, distance FROM tab1
UNION ALL
SELECT B.c1, A.c2, B.distance + A.distance 
FROM tab2 A, tab1 B
WHERE A.c1 = B.c2
)


SELECT A.c1 as c1, A.c2 as c2, min(A.distance) as distance FROM tab2 A 
WHERE NOT EXISTS 
(
SELECT * FROM tab2 B WHERE A.c1 = B.c2
) 
GROUP BY A.c1, A.c2 ORDER BY A.c1, A.c2