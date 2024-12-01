const contenedorComentario=document.getElementById('comentario');
const contenidoBusqueda=document.getElementById('contenido_busqueda');
contenedorComentario.style.display="none";

function mostarComentario(){
    contenedorComentario.style.display="block";
    contenidoBusqueda.style.display="none";

    /*const estructuraComentario=`
<input type="hidden" name="id_cliente" value="<?php $idCliente ?>">
    <input type="hidden" name="id_evento" value="<?php $idEvento ?>">

    `
contenedorComentario.insertAdjacentHTML('beforeend', estructuraComentario );*/
}




function validarComentario(codigoCliente,codigoEvento,tipoEvento,comentario){
    
    console.log("datos desde la funcion "+codigoCliente+""+codigoEvento+""+tipoEvento+""+comentario);
    const datos = {
        codCliente: codigoCliente,
        codEvento: codigoEvento,
        tipEvento: tipoEvento,
        comentario: comentario
    };

    // Enviamos los datos con fetch
    fetch('Funciones/validarComentario.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(datos) // Convertimos el objeto a JSON
    })
    .then(response => response.text())
    .then(data => console.log("Respuesta del servidor:", data))
    .catch(error => console.error('Error:', error));
}