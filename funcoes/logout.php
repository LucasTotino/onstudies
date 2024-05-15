<?php

//Se a sessão não tiver sido iniciada
if(!isset($_SESSION)) {
    session_start();
}

//Destruição da sessão (logout)
session_destroy();

//Página para onde volta quando é feito o logout
header("Location: ../index.php");
?>