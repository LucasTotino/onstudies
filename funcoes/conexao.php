<?php
//login no banco de dados
$user = 'root';
$password = '';
$database = 'onstudies';
$host = 'localhost';

$mysqli = new mysqli($host, $user, $password, $database);

if($mysqli->error) {
    die("Falha ao conectar ao banco de dados: " . $mysqli->error);
}
