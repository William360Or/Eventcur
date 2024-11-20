<?php

function CargarComentarios($evento){
    /*revisar comentarios por evento filtrando por la db*/
    include './Funciones/conexion.php';
    $sql="select id_prueba, fecha from prueba limit 10;";
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
    $fechaActual = date('d-m-Y');
    $sql="select fecha, count(*) Total from prueba where fecha>".$fechaActual." group by fecha";
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

?>