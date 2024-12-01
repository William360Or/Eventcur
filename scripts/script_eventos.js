const parametro=new URLSearchParams(window.location.search);
const evento=parametro.get("evento");

    const imagenesPorEvento={
        matrimonio:[
            "img/matrimonio/matrimonio1.jpg",
            "img/matrimonio/matrimonio2.jpg",
            "img/matrimonio/matrimonio3.jpg",
            "img/matrimonio/matrimonio4.jpg",
            "img/matrimonio/matrimonio5.jpg",
            "img/matrimonio/matrimonio6.jpg",
            "img/matrimonio/matrimonio7.jpg",
            "img/matrimonio/matrimonio8.jpg"
            
            
        ],
        cumpleaños:[
            "img/cumple/cumple1.jpg",
            "img/cumple/cumple2.jpg",
            "img/cumple/cumple3.jpg",
            "img/cumple/cumple4.jpg",
            "img/cumple/cumple5.jpg",
            "img/cumple/cumple6.jpg",
            "img/cumple/cumple7.jpg",
            "img/cumple/cumple8.jpg",
        ],

        Quince_años:[
            "img/quince/quince1.jpg",
            "img/quince/quince2.jpg",
            "img/quince/quince3.jpg",
            "img/quince/quince4.jpg",
            "img/quince/quince5.jpg",
            "img/quince/quince6.jpg",
            "img/quince/quince7.jpg",
            "img/quince/quince8.jpg"

        ],
        grado:[
            "img/grado/grado1.jpg",
            "img/grado/grado2.jpg",
            "img/grado/grado3.jpg",
            "img/grado/grado4.jpg",
            "img/grado/grado5.jpg",
            "img/grado/grado6.jpg",
            "img/grado/grado7.jpg",
            "img/grado/grado8.jpg"


        ],
        conferencias:[
            "img/conferencias/conf1.jpg",
            "img/conferencias/conf2.jpg",
            "img/conferencias/conf3.jpg",
            "img/conferencias/conf4.jpg",
            "img/conferencias/conf5.jpg",
            "img/conferencias/conf6.jpg",
            "img/conferencias/conf7.jpg",
            "img/conferencias/conf8.jpg"
        ],
        Reuniones_Corporativas:[
            "img/reunionescorp/reucorp1.jpg",
            "img/reunionescorp/reucorp2.jpg",
            "img/reunionescorp/reucorp3.jpg",
            "img/reunionescorp/reucorp4.jpg",
            "img/reunionescorp/reucorp5.jpg",
            "img/reunionescorp/reucorp6.jpg",
            "img/reunionescorp/reucorp7.jpg",
            "img/reunionescorp/reucorp8.jpg"
        ],
        Fiesta_de_fin_de_año:[
            "img/fiestafin/finanio1.jpg",
            "img/fiestafin/finanio2.jpg",
            "img/fiestafin/finanio3.jpg",
            "img/fiestafin/finanio4.jpg",
            "img/fiestafin/finanio5.jpg",
            "img/fiestafin/finanio6.jpg",
            "img/fiestafin/finanio7.jpg",
            "img/fiestafin/finanio8.jpg",
        ]

    }

function CambiarFotos(){    
    
    switch (evento){
        case 'matrimonio':
           GeneraGaleria("Matrimonios");
        break
        case 'cumpleaños':
            GeneraGaleria("Cumpleaños");
        break
        case 'Quince_años':
            GeneraGaleria("15 Años");
        break
        case 'grado':
            GeneraGaleria("Grados");
        break
        case 'conferencias':
            GeneraGaleria("Conferencias");
        break
        case'Reuniones_Corporativas':
        GeneraGaleria("Reuniones Corporativas");
        break
        case 'Fiesta_de_fin_de_año':
            GeneraGaleria("Fiestas de Fin de Año");
        break

    }
}

function cambiarComentarios(datosJson){
    const contenedorComentario=document.getElementById('comentario_tarjetas');
    contenedorComentario.innerHTML="";
    
    for(let i=0; i<10; i++){
        const divcomentario=document.createElement("div");
        divcomentario.classList.add("tarjeta");
        const titulo =document.createElement("h3");
        titulo.textContent=datosJson[i].nombre +" "+ datosJson[i].apellido;
        const coment= document.createElement("p");
        coment.textContent=datosJson[i].comentario;

        divcomentario.appendChild(titulo);
        divcomentario.appendChild(coment);

        contenedorComentario.appendChild(divcomentario);
    }
}


function GeneraGaleria(tilutoEvento){
    const contenedorFotos=document.getElementById('galeria_imagenes');
    const tiluto=document.getElementById('galeria_titulo');
    tiluto.innerHTML=tilutoEvento;
            imagenesPorEvento[evento].forEach((ruta)=>{
                const img =document.createElement("img");
                img.src=ruta;
                img.alt=evento;
                img.classList.add("galeria_imagenes--imagen");
                contenedorFotos.appendChild(img);
            })
}

function GeneraComentarios(datosJson){
   
    switch(evento){
        case 'matrimonio':
           
           cambiarComentarios(datosJson);
           
        break
        case 'cumpleaños':
            cambiarComentarios(datosJson);
        break
        case 'Quince_años':
            cambiarComentarios(datosJson);
        break
        case 'grado':
            cambiarComentarios(datosJson);
        break
        case 'conferencias':
            cambiarComentarios(datosJson);
        break
        case'Reuniones_Corporativas':
            cambiarComentarios(datosJson);
        break
        case 'Fiesta_de_fin_de_año':
            cambiarComentarios(datosJson);
        break

    }

    
}


CambiarFotos();
