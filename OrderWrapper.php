<?php
class OrderWrapper extends BaseDatabaseWrapper
{
    public function __construct(PDO $pdo)
    {
        parent::__construct($pdo, '"order"');
    }
}