<?php

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

require 'PHPMailer\src\Exception.php';
require 'PHPMailer\src\PHPMailer.php';
require 'PHPMailer\src\SMTP.php';


 function EnviarCotizacion($email,$nombre,$tipoEvento,$mensaje){
    $mail = new PHPMailer(true);

    try {
        // Configuración del servidor SMTP
        $mail->SMTPDebug = SMTP::DEBUG_SERVER; 
        $mail->isSMTP();
        $mail->Host = 'smtp.gmail.com'; 
        $mail->SMTPAuth = true;
        $mail->Username = 'williamolaya93@gmail.com'; 
        $mail->Password = 'spke nejf gulg bqbm'; 
        $mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;
        $mail->Port =465;
        $mail->CharSet = 'UTF-8';

        // Destinatarios
        $mail->setFrom('williamolaya93@gmail.com', 'Casa de eventos eventCur');
        $mail->addAddress($email, $nombre); // Correo del usuario

        // Contenido del correo
        $mail->isHTML(true);
        $mail->Subject = 'Cotizacion de evento '.$tipoEvento;
        $mail->Body    = $mensaje;

        if ($mail->send()) {
            // Redirigir a la página de confirmación o agradecimiento después de enviar el correo
            // Cambia esta URL por la página de tu preferencia
             // Detener la ejecución del script
            echo'<script type="text/javascript">
        alert("¡Su cotización ha sido enviada al correo electronico registrado!");
        window.location.href="../index.php";
        </script>';
        exit();
        } else {
            echo "Hubo un error al enviar el correo.";
        }
        
        
    } catch (Exception $e) {
        echo "Hubo un error al enviar el correo: {$mail->ErrorInfo}";
    }
 }
    
    
    
?>



