-- Создание таблицы магазина
CREATE TABLE shop (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    address TEXT NOT NULL
);

-- Создание таблицы продуктов
CREATE TABLE product (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    price REAL NOT NULL,
    count INTEGER NOT NULL,
    shop_id INTEGER,
    FOREIGN KEY (shop_id) REFERENCES shop(id)
);

-- Создание таблицы клиентов
CREATE TABLE client (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    phone TEXT NOT NULL,
    birthday DATE
);

-- Создание таблицы заказов
CREATE TABLE "order" (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    created_at DATETIME NOT NULL,
    client_id INTEGER,
    shop_id INTEGER,
    FOREIGN KEY (client_id) REFERENCES client(id),
    FOREIGN KEY (shop_id) REFERENCES shop(id)
);

-- Создание таблицы соответствий продуктов и заказов
CREATE TABLE order_product (
    order_id INTEGER,
    product_id INTEGER,
    price REAL NOT NULL,
    FOREIGN KEY (order_id) REFERENCES "order"(id),
    FOREIGN KEY (product_id) REFERENCES product(id),
    PRIMARY KEY (order_id, product_id)
);