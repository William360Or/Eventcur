<?php

$datos = json_decode(file_get_contents("php://input"), true);

if ($datos) {
    $codCliente= $datos['codCliente'];
    $codEvento = $datos['codEvento'];
    $tipEvento = $datos['tipEvento'];
    $comentario=$datos['comentario'];


     echo "codigo cliente: $codCliente, codigo evento: $codEvento, tipo de evento: $tipEvento, comentario: $comentario";
     genearComentarioDB($codCliente,$codEvento,$tipEvento,$comentario);
     
} else {
    echo "No se recibieron datos";
}


function genearComentarioDB($codCliente,$codEvento,$tipEvento,$comentario){
    require './funciones.php';
    $idCliente=$codCliente;
    $idEvento=$codEvento;
    $idTipoEvento=$tipEvento;
    $comentarios=$comentario;

    AgregarComentario($idCliente,$idEvento,$idTipoEvento,$comentarios);

    


}


?>