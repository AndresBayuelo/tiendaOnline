class Cliente {

    constructor(cedula, nombre, fechanac, genero, email){
        this.cedula = cedula;
        this.nombre = nombre;
        this.fechanac = fechanac;
        this.genero = genero;
        this.email = email;
    }

}

module.exports = { Cliente } 