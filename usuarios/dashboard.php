<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Painel</title>

    <!-- Links CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous" />
    <link rel="stylesheet" href="/onstudies/css/styles.css" />
</head>

<body>
    <header>
        <!-- Checagem de login e adição de menu -->
        <?php
        include('../funcoes/protect.php');
        include('../utils/menu.php');
        ?>
    </header>
    <main>
        <!-- Criação do Container -->
        <div class="container-1">

            <!-- Mensagem de Apresentação -->
            <div class="row mt-3 justify-content-center">

                <?php
                echo "<p>Bem Vindo <b>" . $_SESSION['nome'] . "</b> !!!</p>";
                ?>
            </div>

            <div class="row justify-content-center">
                <img class="logo-login m-3" src="/onstudies/imagens/Painel.png" style="width: 10%;">
            </div>

            <div class="row justify-content-center m-3">
                <div class="col-sm-12">
                    <a href="/onstudies/usuarios/list_user.php" style="color: white;">Acessar a Lista de Usuários</a>
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