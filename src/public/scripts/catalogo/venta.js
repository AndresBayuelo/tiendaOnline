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

    $('#ciudad').on('change', function (){
        $.get( '/catalogo/listarProductosCiudad', {idciudad: $('#ciudad').val()} )
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

    $('#buscar').on('click', function (){
        event.preventDefault();
        if($('#ciudad').val()) {
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
        }else mensage('Error', "Campo ciudad requerido", '/img/system-error-icon.png');
    });

    function listarProductos(productos){
        $('#items').empty();
        let formgroup = null;
        let li = null;
        for(let i=0; i<productos.length; i++){
            let item = $('<div class="col mt-4"></div>');
            item.append('<div class="card"></div>');
            item.children(".card").append('<img src="'+productos[i].imagen+'" class="card-img-top mx-auto d-block" alt="..." style="height: 250px; width:auto;">');
            item.children(".card").append('<div class="card-body"></div>');
            item.children(".card").children(".card-body").append('<h5 class="card-title">'+productos[i].nombre+'</h5>');
            item.children(".card").append('<ul class="list-group list-group-flush"></ul>');
            item.children(".card").children(".list-group-flush").append('<li class="list-group-item"></li>');
            item.children(".card").children(".list-group-flush").children("li").append('REF '+productos[i].referencia+', Marca '+productos[i].marca+', Unidad de medida '+productos[i].medida+'');
            li = $('<li class="list-group-item"></li>');
            formgroup = $('<div class="form-group row"></div>');
            formgroup.append('<label for="colFormLabelSm" class="col-sm-4 col-form-label col-form-label-sm">Cantidad</label>');
            formgroup.append('<div class="col-sm-8"></div>');
            formgroup.children('div').append('<input type="number" class="form-control form-control-sm" id="colFormLabelSm" value="'+productos[i].ciudad[0].cantidad+'">');
            li.append(formgroup);
            formgroup = $('<div class="form-group row"></div>');
            formgroup.append('<label for="colFormLabelSm" class="col-sm-4 col-form-label col-form-label-sm">Valor</label>');
            formgroup.append('<div class="col-sm-8"></div>');
            formgroup.children('div').append('<input type="number" class="form-control form-control-sm" id="colFormLabelSm" name="precio" value="'+productos[i].ciudad[0].precio+'">');
            li.append(formgroup);
            item.children(".card").children(".list-group-flush").append(li);
            li = $('<li class="list-group-item"></li>');
            li.append('<form action="#"></form>');
            formgroup = $('<div class="form-group row"></div>');
            formgroup.append('<label for="colFormLabelSm" class="col-sm-4 col-form-label col-form-label-sm">Valor</label>');
            formgroup.append('<div class="col-sm-8"></div>');
            formgroup.children('div').append('<input type="number" class="form-control form-control-sm" id="colFormLabelSm" name="cantidad" value="1">');
            li.children('form').append(formgroup);
            formgroup = $('<div class="form-group row"></div>');
            formgroup.append('<div class="col-sm-12 text-right"></div>');
            formgroup.children('div').append('<button type="button" class="btn btn-link">Agregar</button>');
            li.children('form').append(formgroup);
            item.children(".card").children(".list-group-flush").append(li);
            $('#items').append(item);
        }
    }

});