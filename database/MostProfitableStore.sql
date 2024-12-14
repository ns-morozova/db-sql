SELECT s.name, SUM(op.price) AS total_revenue
FROM shop s
JOIN "order" o ON s.id = o.shop_id
JOIN order_product op ON o.id = op.order_id
GROUP BY s.id
ORDER BY total_revenue DESC
LIMIT 1;