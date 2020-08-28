const cnx = require('../modules/conexion');

class ProductoDAO{

    constructor(credenciales){
        this.credenciales = credenciales;
    }

    async consultarProductos(ciudad, producto, categoria, criterioOrden){

        let consulta = `SELECT prod.k_idreferenciaunica, prod.n_nombre, prod.n_marca, prod.k_idcategoria, ctgh.n_nombre, ctgh.k_idcategoriapadre, ctgp.n_nombre, prod.n_unidadmedida, prod.l_imagen, inv.q_cantidad, inv.v_precio, ciu.k_idciudad, ciu.n_nombre, prov.k_idproveedor, prov.n_nombre, inv.k_idinventario
        FROM prod, ctg ctgh, ctg ctgp, inv, ciu, invprov, prov 
        WHERE prod.k_idcategoria = ctgh.k_idcategoria AND ctgh.k_idcategoriapadre = ctgp.k_idcategoria AND inv.k_idreferenciaunica(+) = prod.k_idreferenciaunica  AND ciu.k_idciudad(+) = inv.k_idciudad AND invprov.k_idinventario(+) = inv.k_idinventario AND prov.k_idproveedor(+) = invprov.k_idproveedor`
        let variables = {};

        if(ciudad!=null){
            consulta += ` AND inv.k_idciudad = :idciu`;
            variables.idciu = {val: ciudad };
        }

        if(producto!=null){
            consulta += ` AND UPPER(prod.n_nombre) LIKE CONCAT(CONCAT('%',:nprod),'%')`;
            variables.nprod = {val: producto.toUpperCase()};
        }

        if(categoria!=null){
            consulta += ` AND (prod.k_idcategoria = :idctg OR ctgh.k_idcategoriapadre = :idctg)`;
            variables.idctg = {val: categoria};
        }

        if(criterioOrden=='nombre'){
            consulta += ` ORDER BY prod.n_nombre`;
        }

        if(criterioOrden=='precio'){
            consulta += ` ORDER BY inv.v_precio`;
        }
        
        if(criterioOrden=='marca'){
            consulta += ` ORDER BY prod.n_marca`;
        }

        const sentencia = async function(conexion){
            return await conexion.execute(
                consulta,
                variables
            );
        };

        return {exe: await cnx.run(this.credenciales, sentencia)};

    }

    async registrar(producto){

        const sentencia = async function(conexion){
            return await conexion.execute(
                `INSERT INTO prod (k_idreferenciaunica, n_nombre, n_marca, k_idcategoria, n_unidadmedida, l_imagen) 
                VALUES (:ref, :nombre, :marca, :ctg, :unidmed, :img)`,
                [producto.referencia, producto.nombre, producto.marca, producto.categoria, producto.medida, producto.imagen],
                { autoCommit: true }
            );
        };
         
        return {exe: await cnx.run(this.credenciales, sentencia)};
        
    }

}

module.exports = { ProductoDAO }