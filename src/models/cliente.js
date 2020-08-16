class Cliente {

    constructor(tipoident, numident, nombre, fechanac, genero, email){
        this.tipoident = tipoident;
        this.numident = numident;
        this.nombre = nombre;
        this.fechanac = fechanac;
        this.genero = genero;
        this.email = email;
    }

}

module.exports = { Cliente } 