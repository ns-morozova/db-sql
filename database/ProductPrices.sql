SELECT o.id AS order_id, p.name AS product_name, op.price AS order_price, p.price AS current_price, (op.price - p.price) AS price_difference
FROM "order" o
JOIN order_product op ON o.id = op.order_id
JOIN product p ON op.product_id = p.id
WHERE op.price != p.price;