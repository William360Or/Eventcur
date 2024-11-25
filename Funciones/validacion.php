<?php


$data = json_decode(file_get_contents("php://input"), true);
$opcionSeleccionada = $data['opcion'];

// Guardar la opción en una variable o realizar algún procesamiento
$respuesta=CargarOpciones($opcionSeleccionada);

// Devolver una respuesta en formato JSON
header('Content-Type: application/json');
echo json_encode($respuesta);


function CargarOpciones($opcionSeleccionada){
    include 'conexion.php';
    /*$servidor="localhost";
    $usuario="root";
    $clave="123456*";
    $nombreDB="evencur";*/
    
    //crear conexion
    $con=new mysqli($servidor,$usuario,$clave,$nombreDB);
    
    if($con->connect_error){
        die("Fallo la conexion a la bd".$con->connect_error);
    }

   // $sql="select op.opcsubcat_servicio opt from opcion_sub_categoria op join tipo_evento ev on op.id_tipoEvento = ev.id_tipoEvento where ev.tip_evento='".$opcionSeleccionada."'";
   $sql="select op.opcsubcat_servicio opcion, subcat.subcat_servicio subCategoria from opcion_sub_categoria op  
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
    


    $con->close();
return $optservicio;
}

?>