<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/stylos.css">
    <title>Formulario de inicio</title>

</head>

<body>
    <header>
        <h1>FORO DE CORREDORES POPULARES DE ZARAGOZA</h1>
    </header>
    <div class="principal">
        <h2>Ingresa tu nombre de usuario y contraseña</h2>
        <!-- El usuario ya esta logado -->
        <h3>Ya estoy logado</h3>
        <table>
            <tr>
                <th>USUARIO</th>
                <th>CONTRASEÑA</th>
            </tr>
            <!-- Creo formulario, con metodo post para envio de usuario y contraseña -->
            <form action="compruebausuario.php" method="post">
                <tr>
                    <td>
                        <!-- Campo para el usuario -->
                        <input type="text" name="usuario" id="usuario">
                    </td>
                    <td>
                        <!-- Campo para la contraseña -->
                        <input type="password" name="pw" id="pw">
                    </td>
                </tr>
                <tr>
                    <!-- Boton de envío -->
                    <td colspan="2"> <input type="submit" value="Acceder al foro" id="btn_submit"></td>
                </tr>
            </form>
        </table>
        
        <!-- Si el usuario no está logado lo envio a la página para nuevo usuario -->
        <h3>Aun no estoy logado</h3>
        <button id="btn_logar" onclick="location.href = 'nuevousuario.php'">
            Quiero logarme</button>
    </div>
    <?php
    include('footer.php');
    ?>
</body>

</html>