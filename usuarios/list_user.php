<?php
include('../funcoes/conexao.php');
?>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Usuários</title>

    <!-- Links CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous" />
    <link rel="stylesheet" href="/site-pi/css/styles.css" />
</head>

<body>

    <!-- Checagem de login e adição de menu -->
    <?php
    include('../funcoes/protect.php');
    include('../utils/menu.php');
    ?>

    <!-- Criação do Container -->
    <div class="container-1 mb-5">

        <!-- Mensagem de Apresentação -->
        <div class="row mt-3 justify-content-center">
            <?php
            $lista = sprintf("SELECT nome, email FROM usuarios");

            $dados = $mysqli->query($lista) or die("Falha ao conectar ao banco de dados: " . $mysqli->error);

            $linha = mysqli_fetch_assoc($dados);

            $total = mysqli_num_rows($dados);

            ?>
            <div class="container-2">
                <table class="table table-dark table-bordered">
                    <thead>
                        <tr>
                            <th scope="col">Nome</th>
                            <th scope="col">Email</th>
                            <th scope="col">Modificar</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        // se o número de resultados for maior que zero, mostra os dados
                        if ($total > 0) {
                            // inicia o loop que vai mostrar todos os dados
                            do {
                        ?>
                                <tr>
                                    <td><?= $linha['nome'] ?></td>
                                    <td><?= $linha['email'] ?></td>
                                    <td>
                                        <button name="aicionar" type="submit" class="btn btn-success">Alterar</button>
                                        <button type="delete" name="excluir" class="btn btn-danger">Deletar</button>
                                    </td>
                                </tr>
                        <?php
                                // finaliza o loop que vai mostrar os dados
                            } while ($linha = mysqli_fetch_assoc($dados));
                            // fim do if
                        }
                        ?>
                    </tbody>
                </table>
            </div>
        </div>

    </div>

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