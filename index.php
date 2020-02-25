<?php

$query = require 'PDO/BD.php';

$materiasconcategoria = $query->materiasconcategorias('materias','categorias');

$tutores = $query->selectAll('tutores');

require 'index.view.php';