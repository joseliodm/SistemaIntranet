<?php
	include_once("conexao.php");
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
    <link rel="stylesheet" href="css/styleindex.css">

    <!-- responsive CSS -->
    <link rel="stylesheet" href="css/responsive.css">

    <script src="scripts.js"></script>

</head>

<body data-spy="scroll" data-target=".navbar-fixed-top" data-offset="65">
    <header>

        <nav class="navbar navbar-fixed-top">

            <div class="container-fluid">

                <div class="vesco-nav-wrapper">

                    <div class="navbar-header">

                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#vesco-menu">
                            <span class="sr-only">Drogaria plus</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                       </button>

                     
                    </div>

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

    <!-- Home -->


    <section id="about">

        <div id="about-bg-diagonal" class="bg-parallax"></div>

        <div class="container">

            <div class="row">

                <div class="col-md-4">

                    <div id="about-content-box">

                        <div id="about-content-box-outer">

                            <div id="about-content-box-inner">

                                <div class="content-title wow animated fadeInDown" data-wow-duration="1s" data-wow-delay=".5s">
                                    <h3>Redes sociais</h3>
                                    <ul class="social-list">
                                        <li><a target="2" href="https://www.facebook.com/drogariaplus/" class="social-icon icon-gray"><i class="fa fa-facebook"></i></a></li>
                                        <li><a target="2" href="https://www.instagram.com/drogariaplus/" class="social-icon icon-gray"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
                                        <li><a target="2" href="https://api.whatsapp.com/send?phone=556235332000" class="social-icon icon-gray"><i class="fa fa-whatsapp"></i></a></li>
                                        <li><a target="2" href="https://www.linkedin.com/company/drogaria-plus/" class="social-icon icon-gray"><i class="fa fa-linkedin" aria-hidden="true"></i></a></li>
                                        
                                    </ul>
                                    <div class="content-title-underline"></div>
                                </div>

                                <div id="about-desc" class="wow animated fadeInDown" data-wow-duration="1s" data-wow-delay=".5s">
                                    <p>
                                        Fundada em 1978 em Goiânia, Goiás, a Drogaria Plus faz parte do cotidiano da família goianiense há 40 anos. Desde sua fundação, a drogaria trabalha 24h, sempre para melhor servir seus clientes, além de contar com um grande mix de produtos.
                        
                                        Começamos como Drogaria Primavera, depois Primavera Plus e, atualmente, com o nome Drogaria Plus. São duas lojas para sua escolha, uma no Setor Campinas, e outra no Flamboyant Shopping.</p>
                                </div>

                            </div>

                        </div>


                    </div>

                </div>

            </div>
        </div>

    </section>

    <section>
	<div class="espaco-topo">
			<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
				<ol class="carousel-indicators">
					<?php
						$controle_ativo = 2;		
						$controle_num_slide = 1;
						$result_carousel = "SELECT * FROM carrouses	 ORDER BY id ASC";
						$resultado_carousel = mysqli_query($conn, $result_carousel);
						while($row_carousel = mysqli_fetch_assoc($resultado_carousel)){ 
							if($controle_ativo == 2){ ?>
								<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li><?php
								$controle_ativo = 1;
							}else{ ?>
								<li data-target="#carousel-example-generic" data-slide-to="<?php echo $controle_num_slide; ?>"></li><?php
								$controle_num_slide++;
							}
						}
					?>						
				</ol>

				<!-- Wrapper for slides -->
				<div class="carousel-inner" role="listbox">
					<?php
						$controle_ativo = 2;						
						$result_carousel = "SELECT * FROM carrouses ORDER BY id ASC";
						$resultado_carousel = mysqli_query($conn, $result_carousel);
						while($row_carousel = mysqli_fetch_assoc($resultado_carousel)){ 
							if($controle_ativo == 2){ ?>
								<div class="item active">
									<img src="imagens/carousel/<?php echo $row_carousel['imagen_carousel']; ?>" alt="<?php echo $row_carousel['nome']; ?>">
								</div><?php
								$controle_ativo = 1;
							}else{ ?>
								<div class="item">
									<img src="imagens/carousel/<?php echo $row_carousel['imagen_carousel']; ?>" alt="<?php echo $row_carousel['nome']; ?>">
								</div> <?php
							}
						}
					?>					
				</div>
			</div>
		</div>
    </section>

    <section id="team">

        <div class="content-box">
            <div class="content-title wow animated fadeInDown" data-wow-duration="1s" data-wow-delay=".5s">
                <h3> Aniversariantes da Semana<br> <br> Parabéns </h3>
            <div class="content-title-underline"></div>
        </div>


         <div class="container">
                <div class="row wow animated fadeInUp" data-wow-duration="1s" data-wow-delay=".5s">
                    <div class="col-md-12">
                        <div id="lista">
                            <script type="text/javascript">carregarLista();</script>
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
                                <p class="lead">Este é um simples sistema para facilitar informações.</p>
                                <hr class="my-4">
                                <p>Ele contém toda lista de ramais, PBM atualizados, Arquivos em FTP.</p>
                                <a class="btn btn-primary btn-lg" href="create.php" role="button">Sugestão</a>
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
</body>

</html>