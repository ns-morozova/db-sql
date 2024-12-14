-- Заполнение таблицы магазинов
INSERT INTO shop (name, address) VALUES ('Shop 1', 'Address 1');
INSERT INTO shop (name, address) VALUES ('Shop 2', 'Address 2');
INSERT INTO shop (name, address) VALUES ('Shop 3', 'Address 3');
INSERT INTO shop (name, address) VALUES ('Shop 4', 'Address 4');
INSERT INTO shop (name, address) VALUES ('Shop 5', 'Address 5');

-- Заполнение таблицы продуктов
INSERT INTO product (name, price, count, shop_id) VALUES ('Product 1', 9.0, 100, 1);
INSERT INTO product (name, price, count, shop_id) VALUES ('Product 2', 14.0, 150, 2);
INSERT INTO product (name, price, count, shop_id) VALUES ('Product 3', 21.0, 200, 3);
INSERT INTO product (name, price, count, shop_id) VALUES ('Product 4', 25.0, 250, 4);
INSERT INTO product (name, price, count, shop_id) VALUES ('Product 5', 30.0, 300, 5);

-- Заполнение таблицы клиентов
INSERT INTO client (name, phone, birthday) VALUES ('Client 1', '1234567890', '1990-01-01');
INSERT INTO client (name, phone, birthday) VALUES ('Client 2', '0987654321', '1991-02-02');
INSERT INTO client (name, phone, birthday) VALUES ('Client 3', '1122334455', '1992-03-03');
INSERT INTO client (name, phone, birthday) VALUES ('Client 4', '6677889900', '1993-04-04');
INSERT INTO client (name, phone, birthday) VALUES ('Client 5', '5566778899', '1994-05-05');

-- Заполнение таблицы заказов
INSERT INTO "order" (created_at, client_id, shop_id) VALUES ('2024-12-01 10:00:00', 1, 1);
INSERT INTO "order" (created_at, client_id, shop_id) VALUES ('2024-01-02 11:00:00', 2, 2);
INSERT INTO "order" (created_at, client_id, shop_id) VALUES ('2024-12-03 12:00:00', 3, 3);
INSERT INTO "order" (created_at, client_id, shop_id) VALUES ('2024-12-04 13:00:00', 4, 4);
INSERT INTO "order" (created_at, client_id, shop_id) VALUES ('2024-12-05 14:00:00', 5, 5);

-- Заполнение таблицы соответствий продуктов и заказов
INSERT INTO order_product (order_id, product_id, price) VALUES (1, 1, 10.0);
INSERT INTO order_product (order_id, product_id, price) VALUES (2, 2, 15.0);
INSERT INTO order_product (order_id, product_id, price) VALUES (3, 3, 20.0);
INSERT INTO order_product (order_id, product_id, price) VALUES (4, 4, 25.0);
INSERT INTO order_product (order_id, product_id, price) VALUES (5, 5, 30.0);