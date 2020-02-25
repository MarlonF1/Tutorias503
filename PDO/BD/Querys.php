<?php


class QueryBuilder
{

    protected $pdo;

    public function __construct($pdo)
    {
        
        $this->pdo = $pdo;
    }

    public function selectAll($table)
    {

        $statement = $this->pdo->prepare("select * from {$table}");

        $statement->execute();

        return $statement->fetchAll(PDO::FETCH_CLASS);
    }

    public function materiasconcategorias($table1,$table2)
    {

        $statement = $this->pdo->prepare("select * from {$table1} as m inner join {$table2} as c on m.id_categoria=c.id_categoria");

        $statement->execute();

        return $statement->fetchAll(PDO::FETCH_CLASS);


    }
}