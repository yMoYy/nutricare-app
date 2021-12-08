const { ipcRenderer } = require('electron');
const Paciente = require('../models/Paciente');

const formulario = document.getElementById('paciente_formulario');
const nombre = document.getElementById('nombre');
const aPaterno = document.getElementById('apellido_paterno');
const aMaterno = document.getElementById('apellido_materno');
const genero = document.getElementById('genero');
const edoCivil = document.getElementById('edo_civil');
const celular = document.getElementById('celular');
const correo = document.getElementById('correo');
const fecha = document.getElementById('fecha_nacimiento');

formulario.addEventListener('submit', (e) => {
    e.preventDefault();
    // const paciente = {
    //     txt_nombre: nombre.value,
    //     txt_apellido_paterno: aPaterno.value,
    //     txt_apellido_materno: aMaterno.value,
    //     txt_genero: genero.value,
    //     txt_edo_civil: edoCivil.value,
    //     int_celular: celular.value,
    //     txt_correo: correo.value,
    //     d_fecha_nacimiento: fecha.value
    // }
    const paciente = new Paciente(
        nombre.value,
        aPaterno.value,
        aMaterno.value,
        genero.value,
        edoCivil.value,
        celular.value,
        correo.value,
        fecha.value
    );
    console.log(paciente);
    ipcRenderer.send('listar-pacientes', paciente);
});

