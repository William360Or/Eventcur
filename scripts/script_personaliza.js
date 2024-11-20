
function GeneraListaEventos(listaEventos){
    const opcionesEvento=document.getElementById('form_eventofecha--opcion');
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
    console.log(fechamin)
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


