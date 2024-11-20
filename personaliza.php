<?php
   include './Funciones/funciones.php';
   $listTipoEvento=CargarTiposEvento();
   $fechareservada=CargarFechasEventos();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Personaliza tu Evento</title>
    <link rel="stylesheet" href="style/estilo_menu.css">
    <link rel="stylesheet" href="style/estilos_personaliza.css">
</head>
<body>
<nav class="menu">
  <ul>
    <li><a href="index.php">Home</a></li>
    <li class="dropdown">
      <a href="">Eventos</a>
      <div class="mega-menu">
        <div class="column">
          <h3>Familiares</h3>
          <div class="opciones">
          <a href="eventos.php?evento=matrimonio">Matrimonios</a>
          <a href="eventos.php?evento=cumple">Cumpleaños</a>
          <a href="eventos.php?evento=quince">15 años</a>
          <a href="eventos.php?evento=grado">Grados</a>
          </div>
        </div>
        <div class="column">
          <h3>Corporativos</h3>
          <div class="opciones">
          <a href="eventos.php?evento=conferencia">Conferencias</a>
          <a href="eventos.php?evento=reucorporativa">Reuniones Corporativas</a>
          <a href="eventos.php?evento=finanio">Fiestas de fin de año</a>
          </div>
        </div>
  
      </div>
    </li>
    <li><a href="mievento.php">Mi Evento</a></li>
  </ul>
</nav>
<section class="banner">
  <div class="banner_elementos">
    <div class="banner_imagenes">
      <img src="img/corporativo1.jpg" alt="evento corporativo" class="banner_imagenes--img" >
      <img src="img/matrimonio1.jpg" alt="evento matrimonio" class="banner_imagenes--img">
      <img src="img/fiesta1.jpg" alt="evento fiesta" class="banner_imagenes--img">
    </div>
    <h2 class="banner__titulo">PERSONALIZA TU EVENTO</h2>
  </div>
</section>
<section class="formulario">
<!-- Formulario de fecha y tipo de evento -->    
    <form action="">
      <div class="formuario_tipoFecha">
        <p>Fecha y tipo de evento</p>
        <label for="form_eventofecha--opcion">Selecciona una opción de evento:</label>
        <select id="form_eventofecha--opcion" name="form_eventofecha" required>     
          <option value="" disabled selected>Elige una opción</option>
       </select>
        <label for="form_fecha">Fecha:</label>
        <input type="date" id="form_fecha" required>
        <a href="#" class="form_eventofecha--btn">Personalizar</a>
      </div>
      
        <!-- Datos de contacto -->
      <div class="formulario_datos">
      <p>Datos de contacto</p>
      <label for="formulario__nombre">Nombre:</label>
      <input type="text" id="formulario__nombre" placeholder="Ingresa tu nombre" required>
      <label for="formulario__apellido">Apellido:</label>
      <input type="text" id="formulario_nombre" placeholder="Ingresa tu apellido" required>
      <label for="formulario__email">E-mail:</label>
      <input type="email" name="email" id="formulario__email" placeholder="Ingresa tu correo" required>
      </div>

      <h2 class="formulario_titulo">Personalización del evento</h2>

      <div class="formulario_detalles">
        <p>Detalles</p>
        <label for="form_numInvitados">Número de invitados</label>
        <input type="number" name="numInvitados" id="form_numInvitados" placeholder="200" required>
      </div>
      

    </form>


  
</section>


<script src="scripts/script_personaliza.js"></script>
<script>
  let tipoEvento=<?php echo ($listTipoEvento); ?>;
  let fechaReservada=<?php echo($fechareservada); ?>;
  BloquearCalendario();
  GeneraListaEventos(tipoEvento);
  FechasReservadas(fechaReservada)
  

</script>
</body>
</html>