<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="style/estilo_menu.css">
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

<h1>mi evento</h1>
   
</body>
</html>