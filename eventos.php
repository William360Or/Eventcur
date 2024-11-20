<?php
 include './Funciones/funciones.php';
 if (isset($_GET['evento'])) {
  $evento = $_GET['evento']; 
  $datosphp= CargarComentarios($evento); 
} else {
  echo "No se pasó el valor.";
}
?>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EventCur</title>
    <link rel="stylesheet" href="style/estilo_menu.css">
    <link rel="stylesheet" href="style/estilos_eventos.css">
    
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


<section class="galeria">
  <h2 id="galeria_titulo" class="galeria_titulo">mi titulo</h2>
  <div id="galeria_imagenes" class="galeria_imagenes">    
  </div>
  <a href=personaliza.php class="banner__btn--personaliza">Personaliza y cotiza tu evento</a>
</section>
<section class="comentario">
  <h3 class="comentario_titulo">Comentarios</h3>
  <div id="comentario_tarjetas" class="comentario_tarjetas">
      
  </div>

  
</section>

<script src="scripts/script_eventos.js"></script>
 

 <script>
  let datosp=<?php echo ($datosphp); ?>;  
  GeneraComentarios(datosp)
 </script>





</body>
</html>