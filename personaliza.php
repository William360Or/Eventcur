<?php
   include './Funciones/funciones.php';
   $listTipoEvento=CargarTiposEvento();
   $fechareservada=CargarFechasEventos();

   echo "<script>console.log('".$listTipoEvento."')</script"
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
    <form method="post" action="Funciones/procesarFormulario.php">
    <p class="titulo_subCategoria">Fecha y tipo de evento</p>
      <div class="tipo_Fecha">
      
        <div>
          <label for="tipo_fecha--opcion">Evento</label><br>
          <select id="tipo_fecha--opcion" name="tipoEvento" class="box" required>     
            <option value="" disabled selected>Elige una opción</option>
          </select>
        </div>
        <div>
           <label for="tipo_fecha--fecha">Fecha</label><br>
           <input type="date" id="form_fecha" name="fecha" class="box" required>
           <button id="tipo_fecha--btnPersonalizar">Personalizar </button>
        </div>
        
       <!-- <a href="#" class="tipo_fecha--btnPersonalizar" id="tipo_fecha--btnPersonalizar">Personalizar</a> -->    
      </div>
  

   
      
        <!-- Datos de contacto -->
    <section id="formulario" >
    <p class="titulo_subCategoria">Datos de contacto</p>
      <div class="datos" id="datos">

        <div>
        <label for="datos__nombre">Nombre</label><br>
        <input type="text" id="datos__nombre" class="box" name="nombre" placeholder="Ingresa tu nombre" required><br>
        </div>

        <div>
        <label for="datos__apellido">Apellido</label><br>
        <input type="text" id="datos_nombre" class="box" name="apellido" placeholder="Ingresa tu apellido" required><br>
        </div>

        <div>
        <label for="datos__email">E-mail</label><br>
        <input type="email" name="email" id="datos__email" class="box" placeholder="Ingresa tu correo" required>
        </div>

        <div>
        <label for="datos__telefono">Telefono</label><br>
        <input type="tel" name="telefono" class="box" id="datos__telefono" placeholder="Ingresa tu telefono" required>
        </div>
      </div>

      <div class="formulario_titulo">
        <h2>Personalización del evento</h2>
      </div>
      
      <p  class="titulo_subCategoria">Detalles</p>
      
      <div class="detalles">
        
      <div>
       <label for="detalles_numInvitados">Número de invitados</label><br>
        <input type="number" name="numInvitados" id="detalles_numInvitados" placeholder="200" class="detalles_numInvitados" required><br>
      </div>  

      <div>
      <label for="">Duración del evento</label><br>
        <select id="detalles_duracion" name="duracion" class="detalles_duracion" required>     
          <option value="" disabled selected>0</option>
       </select>
       <br>
      </div>

      <div>
      <label for="detalles_hora">Hora del evento</label><br>
      <input type="time" id="detalles_hora" name="hora" class="detalles_hora" required><br>
      </div>
     
      </div>
  <div id="servicios"></div>
   

  <div class="cotizacion">
    <button type="submit" class="cotizacion--btn">Generar Cotización </button>
    </div>
    </section>
    
    

    </form>

</section>


<script src="/scripts/script_personaliza.js"></script>
<script>

  let tipoEvento=<?php echo ($listTipoEvento); ?>;
  let fechaReservada=<?php echo($fechareservada); ?>;
  console.log(tipoEvento)
  BloquearCalendario();
  GeneraListaEventos(tipoEvento);
  FechasReservadas(fechaReservada);
  
</script>
</body>
</html>