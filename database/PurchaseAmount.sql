SELECT c.name, SUM(op.price) AS total_purchases
FROM client c
JOIN "order" o ON c.id = o.client_id
JOIN order_product op ON o.id = op.order_id
WHERE o.created_at BETWEEN DATE(c.birthday, '-3 days') AND DATE(c.birthday, '+3 days')
GROUP BY c.id;