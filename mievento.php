<?php
   
    if (isset($_POST['buscar'])) {
        
        $input = $_POST['busqueda_Evento'];

       
       $codigoEvento=BuscarEvento($input);

    }

    function BuscarEvento($texto) {
        include './Funciones/conexion.php';
        $sql="SELECT id_evento FROM evencur.evento where id_evento=".$texto.";";
        $result = $con->query($sql);
        $fila = $result->fetch_assoc();
        if (is_array($fila)) {
          $idCliente = $fila['id_evento'];
          if($idCliente>0){
            return $idCliente;
          }
      } else {
          return 0;
      }
        
      
        
    }
    ?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="style/estilo_menu.css">
    <link rel="stylesheet" href="style/estilos_mievento.css">
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
  <div id="contenido_busqueda" class="contenido_busqueda">
    <form action="" method="post">
      <label for=""></label>
      <input type="text" class="busqueda_Evento" name="busqueda_Evento" placeholder="Codigo del evento" required>
      
      <button id="Btn_buscar" class="btnBuscar" name="buscar">Buscar </button>
    </form>
      <p class="recomendacion">Para validar tu evento, realizar cancelaciones, reprogramación, dejar un comentario ingresa el código de tu evento.</p>
  </div>
  <div class="comentario" id="comentario">

  </div>

</section>



<script src="scripts/script_mievento.js"></script>
<script>
  let codigoEvento=<?php echo ($codigoEvento); ?>;
  if(codigoEvento>0){
    estructuraFormulario();
  }else{
    alert("Ingreasa un codigo de evento valido");
  }

</script>




</body>
</html>