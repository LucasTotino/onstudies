<?php

//Conexão com o banco de dados
include('../funcoes/conexao.php');

$msgErro = '';
?>
<!DOCTYPE html>
<html lang="pt">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login OnStudies</title>

    <!-- Link CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous" />
    <link rel="stylesheet" href="/site-pi/css/styles.css" />

</head>

<body>
    <!-- Incluindo o Menu -->
    <header>
        <?php
        include('../utils/menu.php');
        ?>
    </header>

    <main>
        <?php
        if (isset($_POST['email']) || isset($_POST['senha'])) {

            if (strlen($_POST['email']) == 0) {
                echo "<p><br>Preencha seu e-mail</p>";
            } else if (strlen($_POST['senha']) == 0) {
                echo "<p><br>Preencha sua senha</p>";
            } else {

                $email = $mysqli->real_escape_string($_POST['email']);
                $senha = $mysqli->real_escape_string($_POST['senha']);

                $sql_code = "SELECT * FROM usuarios WHERE email = '$email' AND senha = '$senha'";
                $sql_query = $mysqli->query($sql_code) or die("Falha na execução do código SQL: " . $mysqli->error);

                $quantidade = $sql_query->num_rows;

                if ($quantidade == 1) {

                    $usuario = $sql_query->fetch_assoc();

                    if (!isset($_SESSION)) {
                        session_start();
                    }

                    $_SESSION['id'] = $usuario['id'];
                    $_SESSION['nome'] = $usuario['nome'];

                    header("Location: ../usuarios/dashboard.php");
                } else {
                    $msgErro = "<p><br>Falha ao logar! E-mail ou senha incorretos</p>";
                }
            }
        }
        ?>
        <div class="container">
            <div class="row justify-content-center">
                <div class="box mt-3" style="width: 30%;">
                    <!-- Inicio Container Principal -->
                    <div class="container-1" style="padding: 0; margin: 0;">
                        <img class="logo-login mt-3" src="/site-pi/imagens/Logo 2.png" style="width: 20%;">
                        <!-- Inicio Formulário -->
                        <form action="" method="POST">
                            <div class="form-group">
                                <!-- Email e Senha -->
                                <div class="row justify-content-center mt-2">
                                    <div class="col-sm-8">
                                        <label for="email">Username/Email</label>
                                        <input type="email" class="form-control" id="email" name="email" aria-describedby="emailHelp">
                                    </div>
                                </div>
                                <div class="row justify-content-center mt-2">
                                    <div class="col-sm-8">
                                        <label for="senha">Senha</label>
                                        <input type="password" class="form-control" id="senha" name="senha">
                                    </div>
                                </div>

                                <!-- Botão de Login e verificação -->
                                <div class="form-row justify-content-center">
                                    <div class="col-sm-4 mt-3">
                                        <button type="submit" class="btn btn-primary" onclick="window.opener.location.href='/site-pi/utils/menu.php'">Entrar</button>

                                    </div>
                                    <!-- Botão de cadastro -->
                                    <div class="col-sm-4 mt-3">
                                        <a href="/site-pi/usuarios/iu_usuario.php" style="color: white;"><button type="button" class="btn btn-secondary">Cadastrar</button></a>
                                    </div>

                                </div>
                                <!-- Botão de cadastro -->
                                <div class="row justify-content-center">
                                    <div class="col-sm-8 mt-2">
                                        <a href="redefinicao_senha.php" style="color: white;"><small>Esqueci a Senha</small></a>
                                    </div>
                                </div>
                                <div class="form-row justify-content-center mt-1">
                                    <div class="col-sm-4"><?= $msgErro ?>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <!-- Links Bundle JS -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

    <!-- Rodapé -->
    <footer>
        <?php
        include_once('../utils/footer.php');
        ?>
    </footer>
</body>

</html>