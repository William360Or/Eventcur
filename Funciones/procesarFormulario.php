<?php


// Verificar si se enviaron datos por POST
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Capturar todos los valores enviados en el formulario
    $datos = $_POST;

    $opcionEvento=$_POST['tipoEvento'];

    // datos de contacto


    $nombre=$_POST['nombre'];
    $apellido=$_POST['apellido'];
    $email=$_POST['email'];
    $telefono=$_POST['telefono'];

    //detalles del evento

    $numInvitados=$_POST['numInvitados'];
    $duracion =$_POST['duracion'];
    $fecha=$_POST['fecha'];
    $hora=$_POST['hora'];


    $datosConPrecios=CargarPrecios($opcionEvento);

    $idSubCategoria=array();
    $idOpcionsubcategoria=array();
    $nombres_concepto = array();
    $valor_concepto=array();
    $acumulado_concepto=array();

    $invitacion=array();
    $valor_invitacion=array();
    $acumulado_invitacion=array();
   
    foreach ($_POST as $campo => $valor) {
        // Agregar el nombre del campo al array
        $encontrado = false;
      
        foreach ($datosConPrecios as $item) {
            if ($item['opcion'] === $valor) {
                
                array_push($nombres_concepto, $item['opcion']);
                array_push($valor_concepto, $item['opcsubcat_precio']);
                array_push($acumulado_concepto, $numInvitados*$item['opcsubcat_precio']);
                array_push($idSubCategoria, $item['idsubcategoria']);
                array_push($idOpcionsubcategoria, $item['idopcion']);
                
                $encontrado = true;
                break;
            }
        }
        foreach ($datosConPrecios as $item) {
            $campo_modificado = str_replace('_', ' ', $campo);
            if ($item['opcion'] === $campo_modificado) {
                
                if($item['subCategoria']==="Tipo de invitaciones y recuerdos"){
                    array_push($invitacion, $item['opcion']);
                    array_push($valor_invitacion, $item['opcsubcat_precio']);
                    array_push($acumulado_invitacion,$numInvitados*$item['opcsubcat_precio']);
                    array_push($idSubCategoria, $item['idsubcategoria']);
                    array_push($idOpcionsubcategoria, $item['idopcion']);
                }else{
                    array_push($nombres_concepto, $item['opcion']);
                    array_push($valor_concepto, $item['opcsubcat_precio']);
                    array_push($idSubCategoria, $item['idsubcategoria']);
                    array_push($idOpcionsubcategoria, $item['idopcion']);}
                
                $encontrado = true;
                break; 
            }
        }
    }

// actualizar evento en la base de datos
AgregarCliente($nombre,$apellido,$email,$telefono);

  $idtablaClientetipoEvento=ObtenerIds($opcionEvento, 1, 0);
    
  AgregarEvento($idtablaClientetipoEvento[0],$idtablaClientetipoEvento[1],$fecha,$hora,$numInvitados);
$idUnicoEvento=CodigoEvento();
  $idtablaEvento=ObtenerIds($opcionEvento, 2, $idtablaClientetipoEvento[0]);
  

for($i=0; $i< count($nombres_concepto);$i++){
   $idsubcat=$idSubCategoria[$i];
   $idopcionsubcat=$idOpcionsubcategoria[$i];
   $valorconcep=$valor_concepto[$i];
    if($i<count($acumulado_concepto)){
        $acumuladovalor=$acumulado_concepto[$i];
       
       AgregarEventoServicio($idtablaEvento,$idsubcat,$idopcionsubcat,$numInvitados,$acumuladovalor);
        
    }else{
       
       AgregarEventoServicio($idtablaEvento,$idsubcat,$idopcionsubcat,1,$valorconcep);
        
    }
   
}

for($i=0; $i< count($invitacion);$i++){
    $idsubcat=$idSubCategoria[$i];
   $idopcionsubcat=$idOpcionsubcategoria[$i];
   $acumuladovalor=$acumulado_invitacion[$i];

    if($i<count($acumulado_invitacion)){
       
        AgregarEventoServicio($idtablaEvento,$idsubcat,$idopcionsubcat,$numInvitados,$acumuladovalor);
        
    }else{
        
        AgregarEventoServicio($idtablaEvento,$idsubcat,$idopcionsubcat,1,$acumuladovalor);
        
    }

}



//estructura del mensaje de correo

$ValorTotal=0;
    $tableHTML = '<table border="1" cellspacing="0" cellpadding="10" style="width: 50%; border-collapse: collapse; font-family: Arial, sans-serif; text-align: left;">
    <thead>
    <tr style="background-color: #f2f2f2;">
        <th style=" border: 1px solid #ddd;">Producto o Servicio</th>
        <th style=" border: 1px solid #ddd;">Precio Unitario (COP)</th>
        <th style="border: 1px solid #ddd;">Precio Total (COP)</th>
    </tr>
    </thead>
<tbody>';

for($i=0; $i< count($nombres_concepto);$i++){
    $tableHTML .= '<tr>';
    
    if($i<count($acumulado_concepto)){
        
        $tableHTML .= '<td style="border: 1px solid #ddd;">' . htmlspecialchars($nombres_concepto[$i]) . '</td>';
        $tableHTML .= '<td style="border: 1px solid #ddd;">' . number_format($valor_concepto[$i], 0, ',', '.') . '</td>';
        $tableHTML .= '<td style="border: 1px solid #ddd;">' . number_format($acumulado_concepto[$i], 0, ',', '.') . '</td>';
        $ValorTotal +=$acumulado_concepto[$i];
    }else{
    
        $tableHTML .= '<td style="border: 1px solid #ddd;">' . htmlspecialchars($nombres_concepto[$i]) . '</td>';
        $tableHTML .= '<td style="border: 1px solid #ddd;">' . number_format($valor_concepto[$i], 0, ',', '.') . '</td>';
        $tableHTML .= '<td style="border: 1px solid #ddd;">' . number_format($valor_concepto[$i], 0, ',', '.') . '</td>';
        $ValorTotal += $valor_concepto[$i];
    }
    $tableHTML .='</tr>';
}

for($i=0; $i< count($invitacion);$i++){
    $tableHTML .= '<tr>';
    
    if($i<count($acumulado_invitacion)){
        
        $tableHTML .= '<td style="border: 1px solid #ddd;">' . htmlspecialchars($invitacion[$i]) . '</td>';
        $tableHTML .= '<td style="border: 1px solid #ddd;">' . number_format($valor_concepto[$i], 0, ',', '.') . '</td>';
        $tableHTML .= '<td style="border: 1px solid #ddd;">' . number_format($acumulado_invitacion[$i], 0, ',', '.') . '</td>';
        $ValorTotal +=$acumulado_invitacion[$i];
    }else{
    
        $tableHTML .= '<td style="border: 1px solid #ddd;">' . htmlspecialchars($nombres_concepto[$i]) . '</td>';
        $tableHTML .= '<td style="border: 1px solid #ddd;">' . number_format($valor_concepto[$i], 0, ',', '.') . '</td>';
        $tableHTML .= '<td style="border: 1px solid #ddd;">' . number_format($valor_concepto[$i], 0, ',', '.') . '</td>';
        $ValorTotal += $valor_concepto[$i];
    }
    $tableHTML .='</tr>';
}




$tableHTML .='</tbody></table>';

    $mensaje=" Gracias por comunicarse con nosotros, a continuación se relacionan los conceptos de la cotizacion para el evento ".$opcionEvento."<br>
        Datos de contacto:<br>
        Nombre y apellido: ".$nombre." ".$apellido. "<br>"."
        Email: ".$email."<br>"."
        Telefono: ".$telefono."<br><br><br>"
        ;

    $mensaje.="Datos del Evento <br>".
    "Tipo de Evento:  ".$opcionEvento."<br>".
    "Numero de invitados:   ".$numInvitados."<br>".
    "Duración del evento en horas: ".$duracion."<br>".
    "Fecha del evento:  ".$fecha."<br>".
    "Hora del evento:  ".$hora."<br><br>".
    "Codigo del Evento: <strong>".$idUnicoEvento."</strong><br><br>" ;
    $mensaje .="<br>".$tableHTML;
    $mensaje .="<br>"."El valor total es de: <h3>$".number_format($ValorTotal)."</h3>";
    $mensaje .="<br><br> <strong>La siguiente cotización tiene una vigencia de 30 dias luego de este periodo tendra que solicitar una nueva por nuestro portal web</strong>";

    
  EnviarEmail( $email,$nombre,$opcionEvento,$mensaje);
    
}


// funciones consultas sql 
function AgregarCliente($nombre,$apellido,$email,$telefono ){
    include 'conexion.php';
    $sql="INSERT INTO cliente (cli_nombre, cli_apellido,cli_email,cli_telefono) VALUES ('$nombre','$apellido', '$email', '$telefono')";
    $con->query($sql);
}

function CodigoEvento(){
    include 'conexion.php';
    $sql="SELECT id_cliente FROM evencur.cliente order by id_cliente desc limit 1;";
        $result = $con->query($sql);
        $fila = $result->fetch_assoc();
        $idCliente = $fila['id_cliente'];
    return $idCliente;
}


function AgregarEvento($idCliente,$idTipoEvento,$fecha,$hora,$totalInvitados){
    include 'conexion.php';
    $sql="INSERT INTO evento (id_cliente, id_tipoEvento, eve_fecha, eve_hora, eve_totalinvitados) VALUES ('$idCliente', '$idTipoEvento', '$fecha', '$hora', '$totalInvitados');";
    $con->query($sql);
}

function AgregarEventoServicio($idEvento,$idSubcategoria,$idOpcionsubcategoria,$cantida,$precioToatal){
    include 'conexion.php';
    $sql="INSERT INTO evento_servicio (id_evento, id_subCategoriaServicio, id_opcionSubCategoria, eveser_cantidad, eveser_precioTotal) VALUES ('$idEvento', '$idSubcategoria', '$idOpcionsubcategoria', '$cantida', '$precioToatal');";
    $con->query($sql);
    
}

function ObtenerIds($tipoEvento, $busqueda, $idCliente){
    include 'conexion.php';
   
    $idTablas= array();
    if($busqueda==1){
        $sql="SELECT id_cliente FROM evencur.cliente order by id_cliente desc limit 1;";
        $result = $con->query($sql);
        $fila = $result->fetch_assoc();
        $idCliente = $fila['id_cliente'];
       // echo "El primer valor del cleinte es: " .  $idCliente;
    
        $sql="SELECT id_tipoEvento FROM evencur.tipo_evento where tip_evento='".$tipoEvento."';";
        $result = $con->query($sql);
        $fila = $result->fetch_assoc();
        $idEvento = $fila['id_tipoEvento'];
       // echo "El primer valor del cleinte es: " .  $idEvento;
    
        
        array_push($idTablas,$idCliente);
        array_push($idTablas,$idEvento);
    
        return $idTablas;
    } else if($busqueda==2){
        $sql="select id_evento from evento where id_cliente=".$idCliente." order by id_evento desc limit 1;";
        $result = $con->query($sql);
        $fila = $result->fetch_assoc();
        $idEvento = $fila['id_evento'];
        return $idEvento;

    }

   


}

function CargarPrecios($opcionSeleccionada){
    include 'conexion.php';
    $sql="select subcat.id_subCategoriaServicio idsubcategoria,op.id_opcionSubCategoria idopcion,op.opcsubcat_servicio opcion, subcat.subcat_servicio subCategoria, op.opcsubcat_precio from opcion_sub_categoria op  
        join sub_categoria_servicio subcat 
        on op.id_subCategoriaServicio = subcat.id_subCategoriaServicio
        join tipo_evento ev 
        on op.id_tipoEvento = ev.id_tipoEvento
        where ev.tip_evento='".$opcionSeleccionada."'";
        $result = $con->query($sql);
    $optservicio= array();
    if($result->num_rows>0){
    while ($row = $result->fetch_assoc()) {
        $optservicio[] = $row;
    }
    }
    return $optservicio;
}

function EnviarEmail($emails,$nombres,$opcionEventos,$mensajes){
    include('../envio.php') ;
    EnviarCotizacion($emails,$nombres,$opcionEventos,$mensajes);
}
?>