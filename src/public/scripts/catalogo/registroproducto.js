
$( document ).ready(function() {

    $.get( '/categorias/listar', {} )
        .done(function( data ) {
            if (data.exe.hasOwnProperty('errorNum')){
                console.error(data);
            }else{
                for(let i=0; i<data.exe.objects.length; i++){
                    if(data.exe.objects[i].categorias){
                        $('#ctg').append("<option value=''>"+data.exe.objects[i].nombre+"</option>")
                        for(let j=0; j<data.exe.objects[i].categorias.length; j++){
                            $('#ctg').append("<option value='"+data.exe.objects[i].categorias[j].id+"'>&nbsp;&nbsp;"+data.exe.objects[i].categorias[j].nombre+"</option>")
                        }
                    }
                }
                console.log(data);
            }
        }).fail(function() {
            console.error( "error" );
        });

    $('#registrar').on('click', function(){

        event.preventDefault();

        let formData = new FormData($('form')[0]);
        /*let img = $('#img')[0].files[0];
        formData.append('img',img);*/

        $.ajax({
            type: "POST",
            url: $('form').attr( "action" ),
            data: formData,
            success: function( data ) {
                $('.alert').parent().parent().remove();
                let _alert = $('<div class="row"></div>');
                _alert.prepend('<div class="col-12"></div>');
                if (data.exe.hasOwnProperty('errorNum')){
                    _alert.find('div').prepend('<div class="alert alert-danger" role="alert">'+data.exe.desc+'</div>');
                    $('form').prepend(_alert);
                    console.error(data);
                }else{
                    _alert.find('div').prepend('<div class="alert alert-success" role="alert"> Producto registrado </div>');
                    $('form').prepend(_alert);
                    console.log(data);
                    setTimeout(function(){ location.href ="/"; },5000);
                }
            },
            error: function (e) {
                console.error( "error" );
            },
            processData: false,
            contentType: false
          });
        
    });

});