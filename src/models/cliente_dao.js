const cnx = require('../modules/conexion');

class ClienteDAO {

    constructor(credenciales){
        this.credenciales = credenciales;
    }

    async registrar(cliente){

        const sentencia = async function(conexion){
            return await conexion.execute(
                `INSERT INTO cli (i_tipoident, k_numident, n_nombre, f_fechanacimiento, i_genero, o_email, n_nombreusuario) 
                VALUES (:tipoident, :numident, :nombre, TO_DATE(:fecnac, 'YYYY-MM-DD'), :genero, :mail, :nusuario)`,
                [cliente.tipoident, cliente.numident, cliente.nombre, cliente.fechanac, cliente.genero, cliente.email, cliente.usuario],
                { autoCommit: true }
            );
        };
         
        return {exe: await cnx.run(this.credenciales, sentencia)};
        
    }

    async consultarClienteUsuario(){

        const nusuario = this.credenciales.username;

        const sentencia = async function(conexion){
            return await conexion.execute(
                `SELECT k_idcliente, k_numident, i_tipoident, n_nombre, f_fechanacimiento, i_genero, o_email
                FROM cli WHERE n_nombreusuario = :nusuario`,
                [nusuario]
            );
        };

        return {exe: await cnx.run(this.credenciales, sentencia)};

    }

}

module.exports = { ClienteDAO }
