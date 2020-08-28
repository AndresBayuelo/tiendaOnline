
$( document ).ready(function() {

    function mensage(titulo, texto, urlicon){
        $('.msgs').empty();
        let msg = $('<div class="toast" style="position: absolute; top: 0; right: 0;" data-autohide="false"><div>');
        msg.append('<div class="toast-header"></div>');
        msg.children('.toast-header').append('<img src="'+urlicon+'" class="rounded mr-2" alt="...">');
        msg.children('.toast-header').append('<strong class="mr-auto">'+titulo+'</strong>');
        msg.children('.toast-header').append('<button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close"></button>');
        msg.children('.toast-header').children('button').append('<span aria-hidden="true">&times</span>');
        msg.append('<div class="toast-body">'+texto+'</div>');
        $('.msgs').append(msg);
        $('.toast').toast('show');
    }

    let ciudades = {};

    $.get( '/ciudades/listar', {} )
    .done(function( data ) {
      if (data.exe.hasOwnProperty('errorNum')){
        mensage('Error', data.exe.desc, '/img/system-error-icon.png');
        console.error(data);
      }else{
        for(let i=0; i<data.exe.objects.length; i++){
          $('#ciudad').append("<option value='"+data.exe.objects[i].id+"'>"+data.exe.objects[i].nombre+"</option>");
        }
        ciudades = data.exe.objects;
        console.log(data);
      }
    }).fail(function() {
      console.error( "error" );
    });

  $.get( '/categorias/listar', {} )
    .done(function( data ) {
      if (data.exe.hasOwnProperty('errorNum')){
        mensage('Error', data.exe.desc, '/img/system-error-icon.png');
        console.error(data);
      }else{
        for(let i=0; i<data.exe.objects.length; i++){
          if(data.exe.objects[i].categorias){
            $('#categoria').append("<option value='"+data.exe.objects[i].id+"'>"+data.exe.objects[i].nombre+"</option>")
            for(let j=0; j<data.exe.objects[i].categorias.length; j++){
              $('#categoria').append("<option value='"+data.exe.objects[i].categorias[j].id+"'>&nbsp;&nbsp;"+data.exe.objects[i].categorias[j].nombre+"</option>")
            }
          }
        }
        console.log(data);
      }
    }).fail(function() {
      console.error( "error" );
    });

    $('#buscar').on('click', function (){
        event.preventDefault();
        $.get( '/catalogo/listarProductosCriterios', $(this).parent().serialize() )
            .done(function( data ) {
            if (data.exe.hasOwnProperty('errorNum')){
                mensage('Error', data.exe.desc, '/img/system-error-icon.png');
                console.error(data);
            }else{
                listarProductos(data.exe.objects);
                console.log(data);
            }
            }).fail(function() {
                console.error( "error" );
            });
    });

    function listarProductos(productos){
        $('#items').empty();
        let formgroup = null;
        for(let i=0; i<productos.length; i++){
            let item = $('<div class="col mt-4"></div>');
            item.append('<div class="card"></div>');
            item.children(".card").append('<img src="'+productos[i].imagen+'" class="card-img-top mx-auto d-block" alt="..." style="height: 250px; width:auto;">');
            item.children(".card").append('<div class="card-body"></div>');
            item.children(".card").children(".card-body").append('<h5 class="card-title">'+productos[i].nombre+'</h5>');
            item.children(".card").append('<ul class="list-group list-group-flush"></ul>');
            item.children(".card").children(".list-group-flush").append('<li class="list-group-item"></li>');
            item.children(".card").children(".list-group-flush").children("li").append('REF '+productos[i].referencia+', Marca '+productos[i].marca+', Unidad de medida '+productos[i].medida+'');
            let extcs = $('<li class="list-group-item">Existencias</li>');
            for(let j=0; j<productos[i].ciudad.length; j++){
                let subitem = $('<div class="card mt-3"></div>');
                subitem.append('<div class="card-body"></div>');
                subitem.children(".card-body").append('<h6 class="card-title">'+productos[i].ciudad[j].nombre+'</h6>');
                subitem.children(".card-body").append('<form action="#"></form>');
                formgroup = $('<div class="form-group row"></div>');
                formgroup.append('<label for="colFormLabelSm" class="col-sm-4 col-form-label col-form-label-sm">Cantidad</label>');
                formgroup.append('<div class="col-sm-8"></div>');
                formgroup.children('div').append('<input type="number" class="form-control form-control-sm" id="colFormLabelSm" value="'+productos[i].ciudad[j].cantidad+'">');
                subitem.children(".card-body").children("form").append(formgroup);
                formgroup = $('<div class="form-group row"></div>');
                formgroup.append('<label for="colFormLabelSm" class="col-sm-4 col-form-label col-form-label-sm">Valor</label>');
                formgroup.append('<div class="col-sm-8"></div>');
                formgroup.children('div').append('<input type="number" class="form-control form-control-sm" id="colFormLabelSm" value="'+productos[i].ciudad[j].precio+'">');
                subitem.children(".card-body").children("form").append(formgroup);
                formgroup = $('<div class="form-group row"></div>');
                formgroup.append('<div class="col-sm-12 text-right"></div>');
                formgroup.children('div').append('<a href="#" class="card-link">Editar</a>');
                subitem.children(".card-body").children("form").append(formgroup);
                subitem.children(".card-body").append('<ul class="list-group"></ul>');
                subitem.children(".card-body").children('ul').append('<li class="list-group-item">Proveedores</li>')
                let listProv = $('<ul class="list-group mt-3"></ul>');
                for(let k=0; k<productos[i].ciudad[j].proveedor.length; k++){
                    let subsubitem = $('<li class="list-group-item"></li>');
                    subsubitem.append('<form action="#" class="row"></form>');
                    subsubitem.children('.row').append('<div class="col-6">'+productos[i].ciudad[j].proveedor[k].nombre+'</div>');
                    subsubitem.children('.row').append('<div class="col-6"><a href="#" class="card-link">Eliminar</a></div>');
                    listProv.append(subsubitem);
                }
                listProv.append('<form action="#"></form>');
                formgroup = $('<div class="form-group row mt-3"></div>');
                formgroup.append('<label for="colFormLabelSm" class="col-sm-4 col-form-label col-form-label-sm">Proveedor</label>');
                formgroup.append('<div class="col-sm-8"></div>');
                formgroup.children('div').append('<select class="custom-select custom-select-sm" id="validatedInputGroupSelect"></select>');
                formgroup.children('select').append('<option value="">Choose...</option>');
                listProv.children('form').append(formgroup);
                formgroup = $('<div class="form-group row"></div>');
                formgroup.append('<div class="col-sm-12 text-right"></div>');
                formgroup.children('div').append('<a href="#" class="card-link">Agregar</a>');
                listProv.children('form').append(formgroup);
                subitem.children(".card-body").children('ul').children('li').append(listProv);
                extcs.append(subitem);
            }

            extcs.append('<form action="#"></form>');
            formgroup = $('<div class="form-group row mt-3"></div>');
            formgroup.append('<label for="colFormLabelSm" class="col-sm-4 col-form-label col-form-label-sm">Ciudad</label>');
            formgroup.append('<div class="col-sm-8"></div>');
            formgroup.children('div').append('<select class="custom-select custom-select-sm" id="validatedInputGroupSelect"></select>');
            formgroup.children('div').children('select').append('<option value="">Elegir...</option>');
            for(let i=0; i<ciudades.length; i++){
                formgroup.children('div').children('select').append("<option value='"+ciudades[i].id+"'>"+ciudades[i].nombre+"</option>");
            }
            extcs.children('form').append(formgroup);
            formgroup = $('<div class="form-group row"></div>');
            formgroup.append('<div class="col-sm-12 text-right"></div>');
            formgroup.children('div').append('<a href="#" class="card-link">Agregar</a>');
            extcs.children('form').append(formgroup);
            item.children(".card").children(".list-group-flush").append(extcs);
            $('#items').append(item);
        }
    }
  

});