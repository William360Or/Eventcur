<?php
//Datos de conexion
$servidor="localhost";
$usuario="root";
$clave="123456*";
$nombreDB="evencur";

//crear conexion
$con=new mysqli($servidor,$usuario,$clave,$nombreDB);

if($con->connect_error){
    die("Fallo la conexion a la bd".$con->connect_error);
}
?>