<?php
declare(strict_types=1);

include 'autoload.php';

try {
    $pdo = new PDO('sqlite:database/sample.db');

    // Работа с таблицей магазинов
    $shopWrapper = new ShopWrapper($pdo);
    $newShop = $shopWrapper->insert(['name', 'address'], ['Магазин Лучший5', 'Совсем недалеко.']);
    print_r($newShop);

    $updatedShop = $shopWrapper->update($newShop['id'], ['name' => 'Рыбов продают10']);
    print_r($updatedShop);


    $foundShop = $shopWrapper->find($newShop['id']);
    print_r($foundShop);

    $deleted = $shopWrapper->delete($newShop['id']);
    echo $deleted ? "Shop deleted successfully" : "Failed to delete shop";

    // Получение списка магазинов с фильтрацией
    $filteredShops = $shopWrapper->get(['name' => 'Shop 1']);
    print_r($filteredShops);

    // Аналогичная работа с другими таблицами
    $productWrapper = new ProductWrapper($pdo);
    $orderWrapper = new OrderWrapper($pdo);
    $clientWrapper = new ClientWrapper($pdo);

    // Пример работы с клиентами
    $newClient = $clientWrapper->insert(['name', 'phone', 'birthday'], ['John Doe', '1234567890', '1990-01-01']);
    print_r($newClient);

    $updatedClient = $clientWrapper->update($newClient['id'], ['phone' => '0987654321']);
    print_r($updatedClient);

    $foundClient = $clientWrapper->find($newClient['id']);
    print_r($foundClient);

    $deletedClient = $clientWrapper->delete($newClient['id']);
    echo $deletedClient ? "Client deleted successfully" : "Failed to delete client";

    // Получение списка клиентов с фильтрацией
    $filteredClients = $clientWrapper->get(['name' => 'Client 1']);
    print_r($filteredClients);

} catch (PDOException $e) {
    echo "Ошибка: " . $e->getMessage();
}