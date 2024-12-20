<?php
require './Funciones/funciones.php';
   
  $miEvento;
   
    if (isset($_POST['buscar'])) {
      
        
        $input = $_POST['busqueda_Evento'];

       
       $datosEvento=BuscarEvento($input);

       $evento=json_decode($datosEvento,true);

       if (isset($evento[0])) {
        $arrayEvento=$evento[0];      
        $miEvento=new evento($arrayEvento['id_evento'],$arrayEvento['id_cliente'],$arrayEvento['id_tipoEvento']);
        $idEvento=$miEvento->ObtenerIdEvento();
        $idCliente=$miEvento->ObtenerIdCliente();
        $idTipoEvento=$miEvento->ObtenerIdTipoEvento();
      } else {
        $idEvento=0;
        $idCliente=0;
        $idTipoEvento=0;
      }


       

    }

    function BuscarEvento($texto) {
        require './Funciones/conexion.php';
        $sql="SELECT id_evento, id_cliente, id_tipoEvento FROM evencur.evento where id_evento=".$texto.";";
        $result = $con->query($sql);
        $eventos= array();
        if($result->num_rows>0){
            while ($row = $result->fetch_assoc()) {
                $eventos[] = $row;
            }
        }
        $con->close();    
        return json_encode($eventos);

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
          <a href="eventos.php?evento=cumpleaños">Cumpleaños</a>
          <a href="eventos.php?evento=Quince_años">15 años</a>
          <a href="eventos.php?evento=grado">Grados</a>
          </div>
        </div>
        <div class="column">
          <h3>Corporativos</h3>
          <div class="opciones">
          <a href="eventos.php?evento=conferencias">Conferencias</a>
          <a href="eventos.php?evento=Reuniones_Corporativas">Reuniones Corporativas</a>
          <a href="eventos.php?evento=Fiesta_de_fin_de_año">Fiestas de fin de año</a>
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
    <form action="" class="comentario_form">
    <label for=""></label>
    <textarea name="comentario" class="comentario_Evento" id="comentarios" placeholder="Cuentanos tu experiencia" required></textarea>
    <button id="btn_enviar" class="btnEnviar" name="enviar">Enviar </button>
    </form>

  </div>

</section>



<script src="scripts/script_mievento.js"></script>
<script>
  let codigoEvento=<?php echo ($idEvento); ?>;
  let codigoCliente;
  let codigoTipoEvento;
  if(codigoEvento>0 ){   
    codigoCliente=<?php echo ($idCliente); ?>;
    codigoTipoEvento=<?php echo ($idTipoEvento); ?>;
    console.log(codigoEvento +""+ codigoCliente +""+codigoTipoEvento)
    mostarComentario();
  }else{
    alert("Ingreasa un codigo de evento valido");
  }

  document.getElementById('btn_enviar').addEventListener('click',function(){
    event.preventDefault();
    let comentario=document.getElementById('comentarios').value
    validarComentario(codigoCliente,codigoEvento,codigoTipoEvento,comentario)
    
    window.location.href = "../mievento.php";

})


</script>




</body>
</html>