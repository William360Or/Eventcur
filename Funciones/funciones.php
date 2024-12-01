<?php

class evento {
    public  $idEvento;
    public $idCliente;
    public $idTipoEvento;

    public function __construct($idEvento, $idCliente, $idTipoEvento) {
        $this->idEvento = $idEvento;  
        $this->idCliente = $idCliente;
        $this->idTipoEvento=$idTipoEvento;
    }

    public function ObtenerIdEvento() {
        return  $this->idEvento;
    }
    public function ObtenerIdCliente() {
        return  $this->idEvento;
    }

    public function ObtenerIdTipoEvento() {
        return  $this->idTipoEvento;
    }
}




function CargarComentarios($evento){
    /*revisar comentarios por evento filtrando por la db*/
    
    include './Funciones/conexion.php';
    $sql="select cli.cli_nombre nombre,cli.cli_apellido apellido,com.com_comentario comentario from comentario com 
            join cliente cli on com.id_cliente=cli.id_cliente
            join tipo_evento tevento on com.id_tipoEvento=tevento.id_tipoEvento
            where tevento.tip_evento='".$evento."' order by id_comentario desc limit 10";
    $result = $con->query($sql);
    $comentarios= array();
    if($result->num_rows>0){
        while ($row = $result->fetch_assoc()) {
            $comentarios[] = $row;
        }
    }
    $con->close();

    
    return json_encode($comentarios);
}

function CargarTiposEvento(){
    include './Funciones/conexion.php';
    $sql="select tip_evento from tipo_evento order by tip_evento asc;";
    $result = $con->query($sql);
    $tipoEventos= array();
    if($result->num_rows>0){
        while ($row = $result->fetch_assoc()) {
            $tipoEventos[] = $row;
        }
    }
    $con->close();    
    return json_encode($tipoEventos);
}

function CargarFechasEventos(){
    include './Funciones/conexion.php';
    $fechaActual = date('y-m-d');
    $sql="select eve_fecha, count(*) Total from evento where eve_fecha>".$fechaActual." group by eve_fecha";
    $result = $con->query($sql);
    $fechaReservada= array();
    if($result->num_rows>0){
        while ($row = $result->fetch_assoc()) {
            $fechaReservada[] = $row;
        }
    }
   
    $con->close();    
    return json_encode($fechaReservada);
   
}

function AgregarComentario($idCliente,$idEvento,$idTipoEvento,$comentario){
    require 'conexion.php';
    $fechaActual=date('Y-m-d');    
    $sql="INSERT INTO comentario (id_cliente, id_evento, id_tipoEvento, com_comentario, com_fecha) VALUES ('$idCliente', '$idEvento','$idTipoEvento' , '$comentario', '$fechaActual');";
    $con->query($sql);
}


?>
