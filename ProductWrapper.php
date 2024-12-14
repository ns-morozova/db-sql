<?php
class ProductWrapper extends BaseDatabaseWrapper
{
    public function __construct(PDO $pdo)
    {
        parent::__construct($pdo, 'product');
    }
}