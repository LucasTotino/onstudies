<?php


// Iniciando a conexão com o DB
include('../funcoes/conexao.php');

    

?>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Perfil OnStudies</title>

    <!-- Links CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous" />
    <link rel="stylesheet" href="/site-pi/css/styles.css" />
</head>

<body>

    <!-- Checagem de login e adição de menu -->
    <?php
    include('../funcoes/protect.php');
    include('../utils/menu.php');
    
    $lista = sprintf("SELECT * FROM usuarios WHERE id = $_SESSION[id]");

    $dados = $mysqli->query($lista) or die("Falha ao conectar ao banco de dados: " . $mysqli->error);

    $linha = mysqli_fetch_assoc($dados);

    $total = mysqli_num_rows($dados);

    if(isset($linha['id'])){
    $nome = $linha['nome'];
    $cpf = $linha['cpf'];
    $nascimento = $linha['data_nascimento'];
    $celular = $linha['celular'];
    $email = $linha['email'];
    $cep = $linha['cep'];
    $logradouro = $linha['logradouro'];
    $numLogradouro = $linha['numero'];
    $complemento = $linha['complemento'];
    $bairro = $linha['bairro'];
    $cidade = $linha['cidade'];
    $estado = $linha['estado'];
    $qualificacao = $linha['qualificacao'];

    $senha = $linha['senha'];
    }

    ?>

    <!-- Criação do Container -->
    <div class="container-1">
        <div class="row m-2 justify-content-center">
            Página de Perfil
        </div>
        <table class="table table-dark">
            <tbody>
                <tr>
                    <td style="width: 20%;">
                        <table class="table table-dark">
                            <tr>
                                <td>
                                    <div class="box-foto">
                                        <img src="../imagens/user_default.png" style="width: 100%; height:auto;" id="preview" name="preview">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <button id="photo-select">
                                        <input type="file" id="fotoPerfil" style="display: none;"></input>Alterar Foto</button>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td style="width: 80%;">
                        <table class="table table-dark">
                            <thead>
                                <tr>
                                    <th>
                                        Dados
                                    </th>
                                </tr>
                            </thead>
                            <tr>
                                <td>
                                    <form action="/site-pi/usuarios/iu_usuario.php" method="POST"><!-- Inicio Formulário -->
                                        <div class="form-group">
                                            <!-- Nome, CPF e Data Nascimento -->
                                            <div class="form-row justify-content-center mt-2">
                                                <div class="col-sm-6">
                                                    <label for="nome">Nome Completo</label>
                                                    <input type="text" value="<?= $nome ?>" class="form-control" id="nome" name="nome" readonly>
                                                </div>
                                                <div class="col-sm-3">
                                                    <label for="cpf">CPF</label>
                                                    <input type="text"  class="form-control" id="cpf" name="cpf" maxlength="14" onkeypress="mascara('###.###.###-##', this)" value="<?= $cpf ?>" readonly>
                                                </div>
                                                <div class="col-sm-2">
                                                    <label for="nascimento">Nascimento</label>
                                                    <input type="date" value="<?= $nascimento ?>" class="form-control" id="nascimento" name="nascimento" readonly>
                                                </div>
                                            </div>

                                            <!-- Celular e Email -->
                                            <div class="form-row justify-content-center mt-2">
                                                <div class="col-sm-3">
                                                    <label for="celular">Celular</label>
                                                    <input type="celular" class="form-control" value="<?= $celular ?>" id="celular" name="celular" maxlength="15" onkeypress="mascara('(##) #####-####', this)" readonly>
                                                </div>
                                                <div class="col-sm-4">
                                                    <label for="email">Email</label>
                                                    <input type="email" class="form-control" value="<?= $email ?>" id="email" name="email" autocomplete="on" readonly>
                                                </div>
                                            </div>

                                            <!-- Endereço -->
                                            <div class="row justify-content-center mt-2">
                                                <div class="col-sm-2">
                                                    <label for="cep">CEP</label>
                                                    <input type="text" class="form-control" value="<?= $cep ?>" id="cep" name="cep" maxlength="9" onkeypress="mascara('#####-###', this)" readonly>
                                                </div>
                                                <div class="col-sm-5">
                                                    <label for="logradouro">Logradouro</label>
                                                    <input type="text" class="form-control" value="<?= $logradouro ?>" id="logradouro" name="logradouro" readonly>
                                                </div>
                                                <div class="col-sm-2">
                                                    <label for="numLogradouro">Número</label>
                                                    <input type="number" class="form-control" value="<?= $numLogradouro ?>" id="numLogradouro" name="numLogradouro" readonly>
                                                </div>
                                                <div class="col-sm-2">
                                                    <label for="complemento">Complemento</label>
                                                    <input type="text" class="form-control" id="complemento" value="<?= $complemento ?>" name="complemento" readonly>
                                                </div>
                                            </div>
                                            <div class="row justify-content-center mt-2">
                                                <div class="col-sm-3">
                                                    <label for="bairro">Bairro</label>
                                                    <input type="text" class="form-control" id="bairro" value="<?= $bairro ?>" name="bairro" readonly>
                                                </div>
                                                <div class="col-sm-4">
                                                    <label for="cidade">Cidade</label>
                                                    <input type="text" class="form-control" id="cidade" value="<?= $cidade ?>" name="cidade" readonly>
                                                </div>
                                                <div class="col-sm-1">
                                                    <label for="estado">Estado</label>
                                                    <div class="input-group">
                                                        <select class="custom-select" id="estado" value="<?= $estado ?>" name="estado" readonly>
                                                            <option></option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-row justify-content-center mt-2">
                                                <div class="col-sm-2">
                                                    <label for="aluno"><input type="radio" value="<?= $qualificacao ?>" id="aluno" name="qualificacao" readonly> Aluno</label>
                                                </div>
                                                <div class="col-sm-2">
                                                    <label for="professor"><input type="radio" value="<?= $qualificacao ?>" id="professor" name="qualificacao" readonly> Professor</label>
                                                </div>
                                                <div class="col-sm-2">
                                                    <label for="ambos"><input type="radio" value="<?= $qualificacao ?>" id="ambos" name="qualificacao" readonly> Ambos</label>
                                                </div>
                                            </div>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </tbody>
        </table>

    </div>

    <!-- Links Bundle JS -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
    <script type="text/javascript" src="../js/script.js"></script>
    <!-- Rodapé -->
    <footer>
        <?php
        include_once('../utils/footer.php');
        ?>
    </footer>

</body>

</html>