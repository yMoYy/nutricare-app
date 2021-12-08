class Paciente {
    constructor(nombre, aPaterno, aMaterno, genero, edoCivil, celular, correo, fecha) {
        this.txt_nombre = nombre;
        this.txt_apellido_paterno = aPaterno;
        this.txt_apellido_materno = aMaterno;
        this.txt_genero = genero;
        this.txt_edo_civil = edoCivil;
        this.int_celular = celular;
        this.txt_correo = correo;
        this.d_fecha_nacimiento = fecha;
    }

    // get nombre() { return this.nombre; }

    // set nombre(nombre) { this.nombre = nombre; }

    // get aPaterno() { return this.aPaterno; }

    // set aPaterno(aPaterno) { this.aPaterno = aPaterno; }

    // get aMaterno() { return this.aMaterno; }

    // set aMaterno(aMaterno) { this.aMaterno = aMaterno; }

    // get genero() { return this.genero; }

    // set genero(genero) { this.genero = genero; }

    // get edoCivil() { return this.edoCivil; }

    // set edoCivil(edoCivil) { this.edoCivil = edoCivil; }

    // get celular() { return this.celular; }

    // set celular(celular) { this.celular = celular; }

    // get correo() { return this.correo; }

    // set correo(correo) { this.correo = correo; }

    // get fecha() { return this.fecha; }

    // set fecha(fecha) { this.fecha = fecha; }
}

module.exports = Paciente