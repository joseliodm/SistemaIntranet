<?php include 'filesLogic.php';?>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="utf-8">
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="uploadpdf.css">
    <title>Drogaria plus</title>
    <link rel="stylesheet" type="text/css" href="styles.css" async>
    <!-- favicon -->
    <link rel="shortcut icon" href="img/favicon.ico">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="shortcut icon" href="\images\favicon.ico">

    <!-- google fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:300,300i,400,400i,700,700i" rel="stylesheet">
    <link href="css/personalizado.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="styles.css" async>
    <!-- favicon -->
    <link rel="shortcut icon" href="img/favicon.ico">

    <!-- google fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:300,300i,400,400i,700,700i" rel="stylesheet">

    <!-- fontawesome -->
    <link rel="stylesheet" href="css/font-awesome/css/font-awesome.min.css">

    <!-- bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap/bootstrap.min.css">

    <!-- animate CSS -->
    <link rel="stylesheet" href="css/animate/animate.css">

    <!-- magnific-popup CSS -->
    <link rel="stylesheet" href="css/magnific-popup/magnific-popup.css">

    <!-- owl carousel CSS -->
    <link rel="stylesheet" href="css/owl-carousel/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl-carousel/owl.theme.default.min.css">

    <!-- style CSS -->
    <link rel="stylesheet" href="css/style.css">

    <!-- responsive CSS -->
    <link rel="stylesheet" href="css/responsive.css">

    <script src="scripts.js"></script>
</head>

<body>

        <div class="pos-f-t">
            <div class="collapse" id="navbarToggleExternalContent">
                <div class="bg-dark p-4">
                <a class="smooth-scroll" href="../index.php">Home</a>
                <a class="smooth-scroll" href="../ramal.php">Ramais</a>
                <a class="smooth-scroll" href="../sistema Unimed\index.php">Planos Unimed</a>
                <a class="smooth-scroll" href="../v2\index.php">Portal Plus</a>
                <a class="smooth-scroll" href="../create.php">Sugestão</a>
                </div>
            </div>
            <nav class="navbar navbar-dark bg-dark">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarToggleExternalContent" aria-controls="navbarToggleExternalContent" aria-expanded="false" aria-label="Toggle navigation" >
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-justify" viewBox="0 0 16 16">
                 <path fill-rule="evenodd" d="M2 12.5a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5zm0-3a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5zm0-3a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5zm0-3a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5z"/>
                </svg>
                </button>
            </nav>
        </div>
       

        <div class="container">
          <div class="jumbotron">
            <div class="row1">
                <h2>HelpDesk</h2>
            </div>
          </div>
            </br>
            <div class="row">
                <p>
                    <a href="create.php" class="btn btn-success">Adicionar</a>
                </p>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th scope="col">Id</th>
                            <th scope="col">Nome</th>
                            <th scope="col">Tipo de Defeito</th>
                            <th scope="col">Nome da Loja</th>
                            <th scope="col">IP</th>
                            <th scope="col">Ação</th>
                        </tr>
                    </tbody>
                </div>  
                                  
                        <?php
                        include 'banco.php';
                        $pdo = Banco::conectar();
                        $sql = 'SELECT * FROM pessoa ORDER BY id DESC';

                        foreach($pdo->query($sql)as $row)
                        {
                            echo '<tr>';
			                      echo '<th scope="row">'. $row['id'] . '</th>';
                            echo '<td>'. $row['nome'] . '</td>';
                            echo '<td>'. $row['endereco'] . '</td>';
                            echo '<td>'. $row['telefone'] . '</td>';
                            echo '<td>'. $row['email'] . '</td>';
                            echo '<td width=250>';
                            echo '<a class="btn btn-primary" href="read.php?id='.$row['id'].'">Info</a>';
                            echo ' ';
                            echo '<a class="btn btn-warning" href="update.php?id='.$row['id'].'">Atualizar</a>';
                            echo ' ';
                            echo '<a class="btn btn-danger" href="delete.php?id='.$row['id'].'">Excluir</a>';
                            echo '</td>';
                            echo '</tr>';
                        }
                        Banco::desconectar();
                        ?>
                    </tbody>
                </table>
            </div>
        </div>
        <div id="containner">
                        <div class="container">
                            <div class="row">
                                <form action="index.php" method="post" enctype="multipart/form-data" >
                                <h3>Upload de Arquivos</h3>
                                <input type="file" name="myfile"> <br>
                                <button type="submit" name="save">upload</button>
                                </form>
                            </div>
                        </div>
                    
                        <div class="download">
                            <table>
                            <thead>
                                <th>ID</th>                             
                                <th>/Nome do Arquivo</th>
                                <th>/Tamanho (KB)</th>
                                <th>/Downloads</th>
                            </thead>
                            <tbody>
                            <?php foreach ($files as $file): ?>
                                <tr>
                                <td><?php echo $file['id']; ?></td>
                                <td><?php echo $file['name']; ?></td>
                                <td><?php echo floor($file['size'] / 9000000) . ' KB'; ?></td>
                                <td><?php echo $file['downloads']; ?></td>
                                <td><a href="downloads.php?file_id=<?php echo $file['id'] ?>">Download</a></td>
                                </tr>
                            <?php endforeach;?>

                            </tbody>
                            </table>
                        </div>


        
    <script src="https://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <!-- Latest compiled and minified JavaScript -->
 
    <!-- jQuery -->
    

    <!-- bootstrap JS -->
    <script src="js/bootstrap/bootstrap.min.js"></script>
   
</body>

</html>
