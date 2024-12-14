<?php

abstract class BaseDatabaseWrapper implements DatabaseWrapper
{
    protected $pdo;
    protected $tableName;

    public function __construct(PDO $pdo, string $tableName)
    {
        $this->pdo = $pdo;
        $this->tableName = $tableName;
    }

    public function insert(array $tableColumns, array $values): array
    {
        $columns = implode(', ', $tableColumns);
        $placeholders = implode(', ', array_fill(0, count($values), '?'));

        $stmt = $this->pdo->prepare("INSERT INTO {$this->tableName} ({$columns}) VALUES ({$placeholders})");
        $stmt->execute($values);

        $id = $this->pdo->lastInsertId();
        return $this->find((int)$id);
    }

    public function update(int $id, array $values): array
    {
        $setClause = implode(' = ?, ', array_keys($values)) . ' = ?';
        $stmt = $this->pdo->prepare("UPDATE {$this->tableName} SET {$setClause} WHERE id = ?");
        $stmt->execute(array_merge(array_values($values), [$id]));

        return $this->find($id);
    }

    public function find(int $id): array
    {
        $stmt = $this->pdo->prepare("SELECT * FROM {$this->tableName} WHERE id = ?");
        $stmt->execute([$id]);
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    public function delete(int $id): bool
    {
        $stmt = $this->pdo->prepare("DELETE FROM {$this->tableName} WHERE id = ?");
        return $stmt->execute([$id]);
    }

    public function get(array $filters): array
    {
        $whereClause = implode(' AND ', array_map(function($key) {
            return "{$key} = ?";
        }, array_keys($filters)));

        $stmt = $this->pdo->prepare("SELECT * FROM {$this->tableName} WHERE {$whereClause}");
        $stmt->execute(array_values($filters));
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
}