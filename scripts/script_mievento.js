const contenedorComentario=document.getElementById('comentario');
const contenidoBusqueda=document.getElementById('contenido_busqueda');
contenedorComentario.style.display="none";

function estructuraFormulario(){
    contenedorComentario.style.display="block";
    contenedorComentario.innerHTML="";
    contenidoBusqueda.style.display="none";

    const estructuraComentario=`
    <form action="" method="post" class="comentario_form">
  <label for=""></label>
  <textarea name="busqueda_Evento" class="comentario_Evento" id="comentario" placeholder="Cuentanos tu experiencia" required></textarea>
  <button id="btn_enviar" class="btnEnviar" name="Enviar">Enviar </button>
</form>`
contenedorComentario.insertAdjacentHTML('beforeend', estructuraComentario );
}