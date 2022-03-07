<!DOCTYPE html>
<html lang="pt-br">
<head>
    <title>aniversario</title>
    <link rel="stylesheet" type="text/css" href="styles.css" async>
    <script src="scripts.js"></script>
</head>

<body>
<div id="conteudo">
    <h2>Menu Aniversario</h2>
    <div id="msg-php" class="no-display"></div>

    <form method="POST" enctype="multipart/form-data" onSubmit="salvarForm(); return false;" id="frmCrud">
    <fieldset>
        <legend>Nome:</legend>
        <input id="nome" type=text class=input-text required placeholder="nome completo" size=20 name=nome onFocus="inputOn(this)" onBlur="inputOff(this)"/>
        <legend>Frase:</legend>
        <input id="email" type=text class=input-text required placeholder="Frase de Parabéns" size=30 name=email onFocus="inputOn(this)" onBlur="inputOff(this)"/>
        <legend>Função extra (value = 0):</legend>
        <input id="telefone" type=text class=input-text required placeholder="Numero do funcionario(Opcional = (0))" size=10 name=telefone print="0" onBlur="inputOff(this)"/>
    </fieldset>
    <fieldset>
        <legend>Foto:</legend>
        <input type=file id="foto" name=foto class=input-text accept="image/png, image/jpeg"/>
        <img id="image" class=thumb />
    </fieldset>
    <input id="id" type=hidden value="-1" />
    <input id="nomeFoto" type=hidden value="" />
    <input type=reset class=button id="btnLimpar" value="Limpar" />
    <input type=submit class=button id="btnSalvar" value="Salvar" />
    </form>
</div>
<div id="lista">
    <script type="text/javascript">carregarLista();</script>
</div>
</body>
</html>