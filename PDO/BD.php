<?php

require 'BD/conexion.php';

require 'BD/Querys.php';

$pdo = Conexion::make();

return new QueryBuilder(

    Conexion::make()
);