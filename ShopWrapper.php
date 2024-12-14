<?php
class ShopWrapper extends BaseDatabaseWrapper
{
    public function __construct(PDO $pdo)
    {
        parent::__construct($pdo, 'shop');
    }
}