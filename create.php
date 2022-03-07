<?php
require 'banco.php';
//Acompanha os erros de validação

// Processar so quando tenha uma chamada post
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nomeErro = null;
    $mensagemErro = null;
    $emailErro = null;

    if (!empty($_POST['mensagem'])) {
        $mensagem = $_POST['mensagem'];
    } else {
        $mensagemErro = 'Por favor digite uma mensagem!';
        $validacao = False;
    }

    if (!empty($_POST)) {
        $validacao = True;
        $novoUsuario = False;
        if (!empty($_POST['nome'])) {
            $nome = $_POST['nome'];
        } else {
            $nomeErro = 'Por favor digite o seu nome!';
            $validacao = False;
        }


        if (!empty($_POST['email'])) {
            $email = $_POST['email'];
            if (!filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)) {
                $emailErro = 'Por favor digite um endereço de email válido!';
                $validacao = False;
            }
        } else {
            $emailErro = 'Por favor digite um endereço de email!';
            $validacao = False;
        }
    }

//Inserindo no Banco:
    if ($validacao) {
        $pdo = Banco::conectar();
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        $sql = "INSERT INTO sugestao (nome, email, mensagem) VALUES(?,?,?)";
        $q = $pdo->prepare($sql);
        $q->execute(array($nome, $email, $mensagem));
        Banco::desconectar();
        header("Location: create.php");
    }
}
?>


<!DOCTYPE html>
<html lang="pt-br">

<head>

       <!-- required meta tags -->
    <meta charset="utf-8">
    
    <meta name="description" content="Building modern responsive website with html5, css3, jQuery & bootstrap framework">
    <meta name="keywords" content="HTML5, CSS3, jQuery, Bootstrap, Web Design, Web Development, Responsive website, Modern website">
    
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- title -->
    <title>Drogaria plus</title>

    <!-- favicon -->
    <link rel="shortcut icon" href="img/favicon.ico">

    <!-- google fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:300,300i,400,400i,700,700i" rel="stylesheet">

    <!-- fontawesome -->
    <link rel="stylesheet" href="css/font-awesome/css/font-awesome.min.css">

    <!-- bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap/bootstrap.min.css">

    <!-- animate CSS -->


    <!-- magnific-popup CSS -->
    <link rel="stylesheet" href="css/magnific-popup/magnific-popup.css">

    <!-- owl carousel CSS -->
    <link rel="stylesheet" href="css/owl-carousel/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl-carousel/owl.theme.default.min.css">

    <!-- style CSS -->
    
    <link rel="stylesheet" href="stylerama.css">

    <!-- responsive CSS -->
    <link rel="stylesheet" href="css/responsive.css">

</head>

<body>

    <header>

        <nav class="navbar navbar-fixed-top">

            <div class="container-fluid">

                <div class="vesco-nav-wrapper">


                    <div class="collapse navbar-collapse" id="vesco-menu">
                    <ul class="nav navbar-nav">
                    <li><a class="smooth-scroll" href="index.php">Home</a></li>
                            <li><a class="smooth-scroll" href="ramal.php">Ramais</a></li>
                            <li><a class="smooth-scroll" href="sistema Unimed\index.php">Planos Unimed</a></li>
                            <li><a class="smooth-scroll" href="v2\index.php">Portal Plus</a></li>
                            <li><a href="helpdesk\index.php">HelpDesk</a></li>
                            <li><a class="smooth-scroll" href="create.php">Sugestão</a></li>
                        </ul>
                    </div>

                </div>

            </div>
        </nav>

    </header>

    </section>
<section class="sugestao">
    <div class="container">
        <div clas="span10 offset1">
            <div class="card">
                <div class="card-header">
                    <h3 class="well"> Sugestão </h3>
                </div>
                <div class="card-body">
                    <form class="form-horizontal" action="create.php" method="post">

                        <div class="control-group  <?php echo !empty($nomeErro) ? 'error ' : ''; ?>">
                            <label class="control-label">Nome</label>
                            <div class="controls">
                                <input size="50" class="form-control" name="nome" type="text" placeholder="Nome"
                                    value="<?php echo !empty($nome) ? $nome : ''; ?>">
                                <?php if (!empty($nomeErro)): ?>
                                    <span class="text-danger"><?php echo $nomeErro; ?></span>
                                <?php endif; ?>
                            </div>
                        </div>

                        <div class="control-group <?php !empty($emailErro) ? '$emailErro ' : ''; ?>">
                            <label class="control-label">Email</label>
                            <div class="controls">
                                <input size="40" class="form-control" name="email" type="text" placeholder="Email"
                                    value="<?php echo !empty($email) ? $email : ''; ?>">
                                <?php if (!empty($emailErro)): ?>
                                    <span class="text-danger"><?php echo $emailErro; ?></span>
                                <?php endif; ?>
                            </div>
                        </div>
                        <div class="control-group <?php echo !empty($mensagemErro) ? 'error ' : ''; ?>">
                            <label class="control-label">Mensagem</label>
                            <div class="controls">
                                <input size="35" class="form-control" name="mensagem" type="text" placeholder="mensagem"
                                    value="<?php echo !empty($mensagem) ? $mensagem : ''; ?>">
                                <?php if (!empty($mensagemErro)): ?>
                                    <span class="text-danger"><?php echo $mensagemErro; ?></span>
                                <?php endif; ?>
                            </div>
                        </div>
                        <div class="form-actions">
                            <br/>
                            <button type="submit" class="btn btn-success">Adicionar</button>

                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

    </section>
        <footer>

        <div id="contact">

            <div class="container">

                <div class="row">

                    <div class="col-md-6">
                        <div id="contact-left">

                            <h3>Drogaria Plus</h3>
                            <p>Atendimento humanizado <strong>
                                Disciplina</strong>, <strong>Ética</strong> & <strong>
                                    Respeito</strong> Transparência, 
                                    Confiança e Aprendizado contínuo.</p>

                            <div id="contact-info">

                                <address>
                                    <strong>St. Campinas:</strong><br>
                                    <p>Praça Joaquim Lúcio<br>
                                        Goiânia - GO, Cep 74510-010</p>
                                </address>
                                <address>
                                    <strong>Flamboyant Shopping Center:</strong><br>
                                    <p>Térreo II, F, Av. Dep. Jamel Cecílio, 3300 - Sala 277<br>
                                        Goiânia - GO, Cep 74810-900</p>
                                </address>
                                <address>
                                    <strong>St. Eldorado:</strong><br>
                                    <p>Av. Milão - Res. Celina Park<br>
                                        Goiânia - GO, Cep 74373-270</p>
                                </address>
                                <address>
                                    <strong>St. Campinas:</strong><br>
                                    <p>Avenida 24 de outurbro<br>
                                        Goiânia - GO, Cep 74510-010</p>
                                </address>
                                
                            </div>
                            <ul class="social-list">
                                <li><a target="2" href="https://www.facebook.com/drogariaplus/" class="social-icon icon-gray"><i class="fa fa-facebook"></i></a></li>
                                <li><a target="2" href="https://www.instagram.com/drogariaplus/" class="social-icon icon-gray"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
                                <li><a target="2" href="https://api.whatsapp.com/send?phone=556235332000" class="social-icon icon-gray"><i class="fa fa-whatsapp"></i></a></li>
                                <li><a target="2" href="https://www.linkedin.com/company/drogaria-plus/" class="social-icon icon-gray"><i class="fa fa-linkedin" aria-hidden="true"></i></a></li>
                            </ul>

                        </div>
                    </div>
                    <div class="col-md-6">
                        <div id="contact-right">
                            <div class="jumbotron">
                                <h1 class="display-4">Controle Interno</h1>
                                <p class="lead">Este é um simples sistema para facilitar informaçãoes.</p>
                                <hr class="my-4">
                                <p>Ele contém toda lista de ramais, PBM atualizados, Arquivos em FTP.</p>

                            </div>

                        </div>
                    </div>

                </div>
            </div>

        </div>

        <div id="footer-bottom">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">

                        <div id="footer-copyrights">
                            <p>Copyrights &copy; 2022 Todos direitos reservados</p>
                        </div>

                    </div>
                    <div class="col-md-6 hidden-sm hidden-xs">
                        <div id="footer-menu">
                            <ul>
                                <p>Developer DrogariaPlus</p>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <a href="#home" id="back-to-top" class="btn btn-sm btn-blue btn-back-to-top smooth-scroll hidden-sm hidden-xs" title="home" role="button">
            <i class="fa fa-angle-up"></i>
        </a>

    </footer>
<!-- jQuery -->
<script src="js/jquery.js"></script>

<!-- bootstrap JS -->
<script src="js/bootstrap/bootstrap.min.js"></script>

<!-- WOW JS -->
<script src="js/wow/wow.min.js"></script>

<!-- magnific-popup JS -->
<script src="js/magnific-popup/jquery.magnific-popup.min.js"></script>

<!-- owl carousel JS -->
<script src="js/owl-carousel/owl.carousel.min.js"></script>

<!-- counter -->
<script src="js/counter/jquery.waypoints.min.js"></script>
<script src="js/counter/jquery.counterup.min.js"></script>

<!-- easing -->
<script src="js/easing/jquery.easing.1.3.js"></script>
<!-- custom JS -->
<script src="js/custom.js"></script>

    <!-- Latest compiled and minified JavaScript -->
    <script src="assets/js/bootstrap.min.js"></script>
    </div>
</body>

</html>
