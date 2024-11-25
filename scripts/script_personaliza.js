const seccionFormulario =document.getElementById('formulario');
seccionFormulario.style.display="none";



function GeneraListaEventos(listaEventos){
    const opcionesEvento=document.getElementById('tipo_fecha--opcion');
    for(let i=0; i<listaEventos.length; i++){
        const option =document.createElement("option");
            option.value=listaEventos[i].tip_evento;
            option.textContent=listaEventos[i].tip_evento;
            opcionesEvento.appendChild(option);
    }

}

function BloquearCalendario(){
    const fecha=document.getElementById('form_fecha');
    const fechaActual=new Date();
    const anio=fechaActual.getFullYear();
    const mes=String(fechaActual.getMonth()+1).padStart(2,'0');
    const dia=String(fechaActual.getDate()).padStart(2,'0');    
    const fechamin=`${anio}-${mes}-${dia}`;
    fecha.setAttribute('min',fechamin);

}

function FechasReservadas(fechaReservada){
    const calendario=document.getElementById('form_fecha');
    let fechasbloq=[]

    for(let i=0; i<fechaReservada.length;i++){
        if(fechaReservada[i].Total=="4"){
            fechasbloq.push(fechaReservada[i].fecha);
        }
    }

    calendario.addEventListener('input', ()=>{
        const fechaSeleccionada=calendario.value;

        if(fechasbloq.includes(fechaSeleccionada)){
            alert("La fecha seleccionada no esta disponible seleccione otra fecha");
            calendario.value='';
        }
    })


}

function GeneraListaHoras(){
    const duracion=document.getElementById('detalles_duracion');
    for(let i=1; i<=24; i++){
        const horaOpcion=document.createElement("option");
        horaOpcion.value=i;
        if(i==1){
            horaOpcion.textContent=`${i} Hora`;
        }else{
            horaOpcion.textContent=`${i} Horas`;
        }        
        duracion.appendChild(horaOpcion);
    }
}

// cargar estructura formulario


function estructuraFormulario(tipoEvento){
    const contenedorCatering=document.getElementById('servicios');
    contenedorCatering.innerHTML="";

    const estructuraFamiliar=`
    <p class="titulo_subCategoria">Catering</p>

      <div class="catering" id="catering">
      <div>
<label for="catering_entrada">Entradas</label><br>
<select name="entradas" id="catering_entrada" class="catering_entrada">
</select><br>
</div>

<div>
  <label for="catering_platoPrincipal">Plato Principal</label><br>
  <select name="platoPrincipal" id="catering_platoPrincipal" class="catering_platoPrincipal">
  </select><br>
</div>


<div>
  <label for="catering_postre">Postres</label><br>
  <select name="postre" id="catering_postre" class="catering_postre">
  <option value="" disabled selected>Elige una opción</option>
   </select><br>
</div>

<div>
<label for="catering_bebidaConAlcohol">Bebidas con Alcohol</label><br>
<select name="bebidaConnAlcohol" id="catering_bebidaConAlcohol" class="catering_bebidaConAlcohol">
  <option value="" disabled selected>Elige una opción</option>
</select><br>
</div>

<div>
<label for="catering_bebidaSinAlcohol">Bebidas sin Alcohol</label><br>
<select name="bebidaSinAlcohol" id="catering_bebidaSinAlcohol" class="catering_bebidaSinAlcohol">
  <option value="" disabled selected>Elige una opción</option>
</select>
</div> 
        
         
      </div>

 <!-- Servicios de entretenimiento-->

      <div class="entretenimiento">
       <p class="titulo_subCategoria">Entretenimiento</p>
        <p class="titulo_subCategoria">Musical</p>
        <div class="entretenimiento_musical" id="entretenimiento_musical">       
        </div>
       <p class="entretenimiento_terminos"> La duración estándar para todos los eventos musicales es de dos horas. Si deseas extender el tiempo de música, puedes hacerlo por un costo adicional por cada hora extra según la categoría musical seleccionada.</p>

        <p class="titulo_subCategoria">Interactivo</p>
        <div class="entretenimiento_interactivo" id="entretenimiento_interactivo">         
        </div>
      </div>      
      
  <!-- Servicios de Decoracion y fotografia-->

   <div class="decoracion_fotografia">
      <div class="decoracion" id="decoracion">   
      </div> 

      <div class="fotografia" id="fotografia">
     </div>   

     <div class="recuerdos" id="recuerdos"></div>

   </div>
   
    
    `

    const estructuraCorporativa=`
         <p class="titulo_subCategoria">Catering</p>

<div class="catering" id="catering">
<div>
    <label for="catering_entrada">Coffee breaks</label><br>
    <select name="Coffeebreak" id="catering_Coffeebreaks" class="catering_entrada">
  </select><br>
</div>

<div>
<label for="catering_platoPrincipal">Desayunos</label><br>
<select name="desayuno" id="catering_Desayunos" class="catering_platoPrincipal">
</select><br>
</div>

<div>
<label for="catering_platoPrincipal">Almuerzos</label><br>
<select name="almuerzo" id="catering_Almuerzos" class="catering_platoPrincipal">
</select><br>
</div>

<div>
<label for="catering_platoPrincipal">Cenas</label><br>
<select name="cenas" id="catering_Cenas" class="catering_platoPrincipal">
</select><br>
</div>

<div>
<label for="catering_Snacks">Snacks</label><br>
<select name="snacks" id="catering_Snacks" class="catering_postre">
<option value="" disabled selected>Elige una opción</option>
</select><br>
</div>

<div>
<label for="catering_bebidaConAlcohol">Estaciones de bebidas</label><br>
<select name="catering_Estacionesdebebidas" id="catering_Estacionesdebebidas" class="catering_bebidaConAlcohol">
<option value="" disabled selected>Elige una opción</option>
</select><br>
</div>  
   
</div>

<!-- Servicios de tecnologia y audivisuales-->


<!-- Servicios de Decoracion y fotografia-->

<div class="Espaciosdecoracion">
    <div class="tecnologia_Audivisuales" id="tecnologia_audivisuales"></div>    
    <div class="decoracion" id="decoracion_espacios"> </div>  
    <div class="logistica" id="logistica"></div>  
</div>
    `


    switch(tipoEvento){
        case "Matrimonio": 
            contenedorCatering.insertAdjacentHTML('beforeend', estructuraFamiliar );
            break

        case "15 Años":
            contenedorCatering.insertAdjacentHTML('beforeend', estructuraFamiliar );
         break

        case "Cumpleaños":
            contenedorCatering.insertAdjacentHTML('beforeend', estructuraFamiliar );
         break

         case "Grado":
            contenedorCatering.insertAdjacentHTML('beforeend', estructuraFamiliar );
         break
         case "Fiesta de fin de año":
            contenedorCatering.insertAdjacentHTML('beforeend', estructuraFamiliar );
            break
         case "Conferencias":
            contenedorCatering.insertAdjacentHTML('beforeend', estructuraCorporativa );
         break
         case "Reuniones Corporativas":
            contenedorCatering.insertAdjacentHTML('beforeend', estructuraCorporativa );
         break
    }
}




// funcion para servicios
function CargarServicios(listaServicios, tipoevento){
   
    const entradas=document.getElementById('catering_entrada');
    const platoprin=document.getElementById('catering_platoPrincipal');
    const postres=document.getElementById('catering_postre');
    const bebidasconalcohol=document.getElementById('catering_bebidaConAlcohol');
    const bebidasinalcohol=document.getElementById('catering_bebidaSinAlcohol');
    const coffeebreak=document.getElementById('catering_Coffeebreaks');
    const desayunos=document.getElementById('catering_Desayunos')
    const almuerzos=document.getElementById('catering_Almuerzos');
    const cenas=document.getElementById('catering_Cenas');
    const snacks=document.getElementById('catering_Snacks');
    const estacionbebidas=document.getElementById('catering_Estacionesdebebidas');

    const musical=document.getElementById('entretenimiento_musical');
    const interactivo=document.getElementById('entretenimiento_interactivo');
    const decoracion=document.getElementById('decoracion');
    const fotografia=document.getElementById('fotografia');
    const recuerdos=document.getElementById('recuerdos');

    const tecnologiayaudivisuales=document.getElementById('tecnologia_audivisuales');
    const decoracionespacios=document.getElementById('decoracion_espacios');
    const logistica=document.getElementById('logistica');

    if(tipoevento=="Matrimonio" || tipoevento=="15 Años" || tipoevento=="Cumpleaños" || tipoevento=="Fiesta de fin de año" || tipoevento=="Grado" ){
        musical.innerHTML="";
        entradas.innerHTML="";
        interactivo.innerHTML="";
        decoracion.innerHTML="";
        fotografia.innerHTML="";
        recuerdos.innerHTML="";
        platoprin.innerHTML="";
        postres.innerHTML="";
        bebidasconalcohol.innerHTML="";
        bebidasinalcohol.innerHTML="";

        const tituloDecoracion=document.createElement("p");
        tituloDecoracion.textContent="Decoración";
        tituloDecoracion.classList.add('titulo_subCategoria');
        decoracion.appendChild(tituloDecoracion);
    
        const tituloFotografia=document.createElement("p");
        tituloFotografia.textContent="Fotografia y Video";
        tituloFotografia.classList.add('titulo_subCategoria');
        fotografia.appendChild(tituloFotografia);

        const tituloRecuerdos=document.createElement("p");
        tituloRecuerdos.textContent="Invitaciones y recuerdos";
        tituloRecuerdos.classList.add('titulo_subCategoria');
        recuerdos.appendChild(tituloRecuerdos);
    }else{
        coffeebreak.innerHTML="";
        almuerzos.innerHTML="";
        snacks.innerHTML="";
        estacionbebidas.innerHTML="";
        tecnologiayaudivisuales.innerHTML="";
        decoracionespacios.innerHTML="";
        logistica.innerHTML="";
        desayunos.innerHTML="";
        cenas.innerHTML="";

        const tituloTecnologia=document.createElement("p");
        tituloTecnologia.textContent="Tecnologia y audiovisuales";
        tituloTecnologia.classList.add('titulo_subCategoria');
        tecnologiayaudivisuales.appendChild(tituloTecnologia);

        const tituloDecoracionEspacio=document.createElement("p");
        tituloDecoracionEspacio.textContent="Decoracion de espacios";
        tituloDecoracionEspacio.classList.add('titulo_subCategoria');
        decoracionespacios.appendChild(tituloDecoracionEspacio);

        const tituloLogistica=document.createElement("p");
        tituloLogistica.textContent="Logística y Organización";
        tituloLogistica.classList.add('titulo_subCategoria');
        logistica.appendChild(tituloLogistica);



    }
    
    
    const selectores=document.querySelectorAll('select');

    selectores.forEach(select => {

        if (select.id === 'tipo_fecha--opcion' || select.id==='detalles_duracion') return;        

    const opcionDefault=document.createElement("option");
    opcionDefault.value="";
    opcionDefault.disabled=true;
    opcionDefault.selected=true;
    opcionDefault.textContent="Elige una opcion";
    select.insertBefore(opcionDefault, select.firstChild);
    })


    for(let i=0; i<listaServicios.length; i++){

        switch(listaServicios[i].subCategoria)  {
            case "Entradas":
                const option =document.createElement("option");
                option.value=listaServicios[i].opcion;
                option.textContent=listaServicios[i].opcion;
                entradas.appendChild(option);
            break
            case "Plato principal":
                const optionPlatoprin =document.createElement("option");
                optionPlatoprin.value=listaServicios[i].opcion;
                optionPlatoprin.textContent=listaServicios[i].opcion;
                platoprin.appendChild(optionPlatoprin);
                break
            case "Postres":
                const optionpostre =document.createElement("option");
                optionpostre.value=listaServicios[i].opcion;
                optionpostre.textContent=listaServicios[i].opcion;
                postres.appendChild(optionpostre);
                break
            case "Bebidas con alcohol":
                const optionconalcohol =document.createElement("option");
                optionconalcohol.value=listaServicios[i].opcion;
                optionconalcohol.textContent=listaServicios[i].opcion;
                bebidasconalcohol.appendChild(optionconalcohol);
                break
            case "Bebidas sin alcohol":
                const optionsinalcohol =document.createElement("option");
                optionsinalcohol.value=listaServicios[i].opcion;
                optionsinalcohol.textContent=listaServicios[i].opcion;
                bebidasinalcohol.appendChild(optionsinalcohol);
                break
            case "Musical":
            const contenedorOpcion=document.createElement("div")
            contenedorOpcion.classList.add('entretenimiento_musical--opcion')
            const checkmusical=document.createElement("input");
            checkmusical.type="checkbox";
            checkmusical.name=listaServicios[i].opcion;

            const labelMusical=document.createElement("label");
            labelMusical.for="";
            labelMusical.textContent=listaServicios[i].opcion;

            const horasMusical=document.createElement("select");
            horasMusical.classList.add('horas_musical');
            horasMusical.id="musical_"+listaServicios[i].opcion;
            horasMusical.name=listaServicios[i].opcion+" adicional";

            const opcionMusicaldef=document.createElement("option");
            opcionMusicaldef.value='';
            opcionMusicaldef.disabled=true;
            opcionMusicaldef.selected=true;
            opcionMusicaldef.textContent='0 Horas Adicionales';
            horasMusical.appendChild(opcionMusicaldef);
            for(let j=1; j<=24; j++){
                const opcionMusical=document.createElement("option");
                opcionMusical.value=j;
                if(j==1){
                    opcionMusical.textContent=`${j} Hora Adicional`;
                }else{
                    opcionMusical.textContent=`${j} Horas Adicionales`;
                }        
                horasMusical.appendChild(opcionMusical);
            }
            
            contenedorOpcion.appendChild(checkmusical);
            contenedorOpcion.appendChild(labelMusical);
            contenedorOpcion.appendChild(horasMusical);

            musical.appendChild(contenedorOpcion);
            
            break
            case "Interactivo":
                const opcionInteractiva=document.createElement("div");
                opcionInteractiva.classList.add('entretenimiento_interactivo--opcion')
                const checkInteractiva=document.createElement("input");
                checkInteractiva.type="checkbox";
                checkInteractiva.name=listaServicios[i].opcion;

                const labelinteractiva=document.createElement("label");
                labelinteractiva.for="";
                labelinteractiva.textContent=listaServicios[i].opcion;

                opcionInteractiva.appendChild(checkInteractiva);
                opcionInteractiva.appendChild(labelinteractiva);

                interactivo.appendChild(opcionInteractiva);

                break
            case "Tipo de decoracion":
                const opcionDecoracion=document.createElement("div");
                opcionDecoracion.classList.add('decoracion--opcion')

                const checkDecoracion=document.createElement("input");
                checkDecoracion.type="checkbox";
                checkDecoracion.name=listaServicios[i].opcion;

                const labelDecoracion=document.createElement("label");
                labelDecoracion.for="";
                labelDecoracion.textContent=listaServicios[i].opcion;

                opcionDecoracion.appendChild(checkDecoracion);
                opcionDecoracion.appendChild(labelDecoracion);

                decoracion.appendChild(opcionDecoracion);
            break
            case "Tipo de fotografia y video":
                const opcionFotografia=document.createElement("div");
                opcionFotografia.classList.add('decoracion--opcion')

                const checkFotografia=document.createElement("input");
                checkFotografia.type="checkbox";
                checkFotografia.name=listaServicios[i].opcion;

                const labelFotografia=document.createElement("label");
                labelFotografia.for="";
                labelFotografia.textContent=listaServicios[i].opcion;

                opcionFotografia.appendChild(checkFotografia);
                opcionFotografia.appendChild(labelFotografia);

                fotografia.appendChild(opcionFotografia);
            break
            case "Tipo de invitaciones y recuerdos":
                const opcionRecuerdo=document.createElement("div");
                opcionRecuerdo.classList.add('decoracion--opcion')

                const checkRecuerdo=document.createElement("input");
                checkRecuerdo.type="checkbox";
                checkRecuerdo.name=listaServicios[i].opcion;

                const labelRecuerdo=document.createElement("label");
                labelRecuerdo.for="";
                labelRecuerdo.textContent=listaServicios[i].opcion;

                opcionRecuerdo.appendChild(checkRecuerdo);
                opcionRecuerdo.appendChild(labelRecuerdo);

                recuerdos.appendChild(opcionRecuerdo);
            break
            // servicios corporativos
            case "Coffee break":
                const optioncoffee =document.createElement("option");
                optioncoffee.value=listaServicios[i].opcion;
                optioncoffee.textContent=listaServicios[i].opcion;
                coffeebreak.appendChild(optioncoffee);
                break
            case "Desayunos":
                const optionDesayuno =document.createElement("option");
                optionDesayuno.value=listaServicios[i].opcion;
                optionDesayuno.textContent=listaServicios[i].opcion;
                desayunos.appendChild(optionDesayuno);
            break
            case "Cenas":
                const optionCenas =document.createElement("option");
                optionCenas.value=listaServicios[i].opcion;
                optionCenas.textContent=listaServicios[i].opcion;
                cenas.appendChild(optionCenas);            
            break
            case "Almuerzos":
                const optionalmuerzo =document.createElement("option");
                optionalmuerzo.value=listaServicios[i].opcion;
                optionalmuerzo.textContent=listaServicios[i].opcion;
                almuerzos.appendChild(optionalmuerzo);
                break
            case "Snacks":
                const optionsnacks =document.createElement("option");
                optionsnacks.value=listaServicios[i].opcion;
                optionsnacks.textContent=listaServicios[i].opcion;
                snacks.appendChild(optionsnacks);
                break
            case "Estaciones de bebidas":
                const optionestacionbebida =document.createElement("option");
                optionestacionbebida.value=listaServicios[i].opcion;
                optionestacionbebida.textContent=listaServicios[i].opcion;
                estacionbebidas.appendChild(optionestacionbebida);
                break
            case "Tipo de Tecnologia audivisual":
                const opcionTecnologia=document.createElement("div");
                opcionTecnologia.classList.add('decoracion--opcion')

                const checkTecnologia=document.createElement("input");
                checkTecnologia.type="checkbox";
                checkTecnologia.name=listaServicios[i].opcion;

                const labelTecnologia=document.createElement("label");
                labelTecnologia.for="";
                labelTecnologia.textContent=listaServicios[i].opcion;

                opcionTecnologia.appendChild(checkTecnologia);
                opcionTecnologia.appendChild(labelTecnologia);

                tecnologiayaudivisuales.appendChild(opcionTecnologia)
                break
            case "Decoracion de espacios":
                const opcionDecoracionespacio=document.createElement("div");
                opcionDecoracionespacio.classList.add('decoracion--opcion');

                const checkDecoracionespacio=document.createElement("input");
                checkDecoracionespacio.type="checkbox";
                checkDecoracionespacio.name=listaServicios[i].opcion;

                const labelDecoracionespacio=document.createElement("label");
                labelDecoracionespacio.for="";
                labelDecoracionespacio.textContent=listaServicios[i].opcion;

                opcionDecoracionespacio.appendChild(checkDecoracionespacio);
                opcionDecoracionespacio.appendChild(labelDecoracionespacio);

                decoracionespacios.appendChild(opcionDecoracionespacio);

                break
            case"Tipo de Logistica y Organización":
            const opcionLogistica=document.createElement("div");
            opcionLogistica.classList.add('decoracion--opcion');

            const checkLogistica=document.createElement("input");
            checkLogistica.type="checkbox";
            checkLogistica.name=listaServicios[i].opcion;

            const labelLogistica=document.createElement("label");
            labelLogistica.for="";
            labelLogistica.textContent=listaServicios[i].opcion;

            opcionLogistica.appendChild(checkLogistica);
            opcionLogistica.appendChild(labelLogistica);

            logistica.appendChild(opcionLogistica);
            break

        }          
    }

}

const btnPersonaliza=document.getElementById('tipo_fecha--btnPersonalizar')
btnPersonaliza.addEventListener("click", function(event){
    event.preventDefault();
    const tipoEvento=document.getElementById('tipo_fecha--opcion');
    const opcionSeleccionada=tipoEvento.value; 
    const fecha=document.getElementById("form_fecha");
    const fechaSeleccionada=fecha.value

    if(!opcionSeleccionada==""){
        fetch('Funciones/validacion.php',{
            method:'POST',
            headers: {
              'Content-Type': 'application/json',
            },
            body: JSON.stringify({ opcion: opcionSeleccionada }),
        })
        .then((response)=>response.json())
        .then((data)=>{
            estructuraFormulario(opcionSeleccionada);
            CargarServicios(data, opcionSeleccionada)
            
        })
        .catch((error) => console.error('Error:', error));
    }


    if(fechaSeleccionada && opcionSeleccionada){
        seccionFormulario.style.display==="none"
        seccionFormulario.style.display="block";
        seccionFormulario.scrollIntoView({behavior:"smooth"})
        
    }else {
        alert("Seleccione un Evento y una fecha valida");
        
    }
        
    


    

})

GeneraListaHoras();
