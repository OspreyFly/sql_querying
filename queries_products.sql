--Part 3: Products Querying--
--1--
INSERT INTO products (name, price, can_be_returned)
VALUES ('chair', 44.00, false);
--2--
INSERT INTO products (name, price, can_be_returned)
VALUES ('stool', 25.99, true);
--3--
INSERT INTO products (name, price, can_be_returned)
VALUES ('table', 124.00, false);
--4--
SELECT *
FROM products;
--5--
SELECT name
FROM products;
--6--
SELECT name, price
FROM products;
--7--
INSERT INTO products (name, price, can_be_returned)
VALUES ('coffee', 8.00, false);
--8--
SELECT * FROM products
WHERE can_be_returned = true;
--9--
SELECT * FROM products
WHERE price < 44;
--10--
SELECT * FROM products
WHERE 
    (price >= 22.50) 
  AND 
    (price <= 99.99);
--11--
UPDATE products
SET price = price - 20
WHERE name <> 'coffee';
--12--
DELETE FROM products
WHERE price < 25.00;
--13--
UPDATE products
SET price = price + 20;
--14--
UPDATE products
SET can_be_returned = true;


--Part 4: Google Play Store Querying--
--Table Name: analytics
--Columns:
 --id
 --rating
 --reviews
 --min_installs
 --price
 --last_updated
 --android_version
 --current_version
 --app_name
 --category
 --content_rating
 --genres
 --size

 --1--
 SELECT * 
 FROM analytics
 WHERE id = 1880;
 --2--
 SELECT id, app_name
 FROM analytics
 WHERE last_updated = '2018-08-01';
 --3--
SELECT category, COUNT(*) as count
FROM analytics
GROUP BY category
ORDER BY category;
--4--
SELECT app_name, reviews
FROM analytics
ORDER BY reviews DESC
LIMIT 5;
--5--
SELECT app_name, reviews
FROM analytics
WHERE rating >= 4.8
ORDER BY reviews DESC
LIMIT 1;
--6--
SELECT category, AVG(rating) AS avg_rating
FROM analytics
GROUP BY category
ORDER BY avg_rating DESC;
--7--
SELECT app_name, price, rating
FROM analytics
WHERE rating < 3
ORDER BY price DESC
LIMIT 1;
--8--
SELECT app_name, rating, reviews, min_installs
FROM analytics
WHERE min_installs <= 50 AND rating > 0
ORDER BY rating DESC;
--9--
SELECT app_name, rating
FROM analytics
WHERE rating < 3 AND reviews >= 10000;
--10--
SELECT app_name, reviews
FROM analytics
WHERE price >= 0.10 AND price <= 1.00
ORDER BY reviews DESC
LIMIT 10; 
--11--
SELECT app_name, last_updated
FROM analytics
ORDER BY last_updated DESC
LIMIT 1;
--12--
SELECT app_name, price
FROM analytics
ORDER BY price DESC, app_name DESC
LIMIT 1;
--13--
SELECT SUM(reviews) AS all_reviews
FROM analytics;
--14--
SELECT category, COUNT(*) AS cat_count
FROM analytics
GROUP BY category
HAVING COUNT(*) > 300;
--15--
SELECT app_name, reviews, min_installs, (min_installs/reviews) AS proportion
FROM analytics
WHERE reviews > 100000
ORDER BY proportion DESC
LIMIT 20;
