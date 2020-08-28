const modelProducto = require('../models/producto');
const productoDAO = require('../models/producto_dao');

const path = require("path");

const registroProducto = async (req, res) => {
    res.render('catalogo/registroproducto');
};

const crearProducto = async (req, res) => {

    let result = {exe: {}};
    let user = {};
    if(req.session.usuario){
        user = req.session.usuario;
    }else{
        user = {username: 'clisrrfs', password: 'secreta'};
    }

    const {ref, nombre, marca, ctg, unidmed} = req.body;
    const img = req.files.img;

    if (path.extname(img.name).toLowerCase() === ".jpg") {
        img.mv('./public/img/upload/prod/' + ref + '.jpg', function(err) {
            if (err) result.exe = {errorNum: true, error: err};
        });
    }else result.exe = {errorNum: true, error: "Solo los archivos .jpg son permitidos!"};

    if( !result.exe.errorNum ){
        let producto = new modelProducto.Producto(ref, nombre, marca, ctg, unidmed, './img/upload/prod/' + ref + '.jpg');
        const productodao = new productoDAO.ProductoDAO(user);
        result = await productodao.registrar(producto);
    }

    console.log(result);
    res.send(result);

};

const consultarProductosCiudad = async (req, res) => {

    let credenciales = {};
    if(req.session.usuario)
        credenciales = req.session.usuario;
    else
        credenciales = {username: 'clisrrfs', password: 'secreta'};

    const productodao = new productoDAO.ProductoDAO(credenciales);

    let result = await productodao.consultarProductos(req.query.idciudad, null, null, null);

    if(result.exe.rows){
        result.exe.objects = formatearCosultaProductos(result.exe.rows);
    }

    console.log(result);
    res.send(result);

};

const consultarProductosCriterios = async (req, res) => {

    let credenciales = {};
    if(req.session.usuario)
        credenciales = req.session.usuario;
    else
        credenciales = {username: 'clisrrfs', password: 'secreta'};

    const {ciudad, producto, categoria, criterioOrden} = req.query;

    const productodao = new productoDAO.ProductoDAO(credenciales);

    let result = await productodao.consultarProductos(ciudad, producto, categoria, criterioOrden);

    if(result.exe.rows){
        result.exe.objects = formatearCosultaProductos(result.exe.rows);
    }

    console.log(result);
    res.send(result);

};

const formatearCosultaProductos = (rows) => {
    let productos = [];
    for(let i=0; i<rows.length; i++){
        if(i > 0){
            if(rows[i][0] == rows[i-1][0]){
                if (rows[i][11]){
                    if (rows[i][11] == rows[i-1][11]){
                        if (rows[i][13]){
                            if (rows[i][13] != rows[i-1][13]) productos[productos.length-1].ciudad[productos[productos.length-1].ciudad.length-1].proveedor.push({id: rows[i][13],nombre: rows[i][14]});
                        }
                    }else{
                        productos[productos.length-1].ciudad.push({
                            id: rows[i][11],
                            nombre: rows[i][12],
                            cantidad: rows[i][9],
                            precio: rows[i][10],
                            idinv: rows[15]
                        });
                        if (rows[i][13]) productos[productos.length-1].ciudad[productos[productos.length-1].ciudad.length-1].proveedor = [{id: rows[i][13],nombre: rows[i][14]}];
                        else productos[productos.length-1].ciudad[productos[productos.length-1].ciudad.length-1].proveedor = [];
                    }
                }
            }else productos.push(formatearCosultaProductosExt(rows[i]));
        }else productos.push(formatearCosultaProductosExt(rows[i]));
    }
    return productos;
};

const formatearCosultaProductosExt = (row) => {
    let producto = new modelProducto.Producto(
        row[0],
        row[1], 
        row[2], 
        {
            id: row[3], 
            nombre: row[4], 
            categoria: {
                id: row[5], 
                nombre: row[6]
            }
        }, 
        row[7], row[8]);
    if (row[11]) {
        producto.ciudad = [{
            id: row[11],
            nombre: row[12],
            cantidad: row[9],
            precio: row[10],
            idinv: row[15]
        }];
        if (row[13]) producto.ciudad[producto.ciudad.length-1].proveedor = [{id: row[13],nombre: row[14]}];
        else producto.ciudad[producto.ciudad.length-1].proveedor = [];
    }else producto.ciudad = [];
    return producto;
};

module.exports = { registroProducto, crearProducto, consultarProductosCiudad, consultarProductosCriterios }