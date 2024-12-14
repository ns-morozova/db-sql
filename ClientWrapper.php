<?php
class ClientWrapper extends BaseDatabaseWrapper
{
    public function __construct(PDO $pdo)
    {
        parent::__construct($pdo, 'client');
    }
}