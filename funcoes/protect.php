<?php
//Se a sessão não estiver iniciada
if (!isset($_SESSION)) {
    session_start();
}
?>

<!-- Vinculação do CSS de estilos -->
<link rel="stylesheet" href="../css/styles.css" />

<?php

// Se a sessão não localizar id
if (!isset($_SESSION['id'])) {
    die("<div class=\"container-1\">Você não pode acessar esta página porque não está logado.<p><a href=\"../usuarios/login.php\">Entrar</a></p></div>");
}
?>