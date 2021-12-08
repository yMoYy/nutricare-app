const { ipcRenderer } = require('electron');

const listaPacientes = document.getElementById('lista-pacientes');

const listarPacientes = () => {
    ipcRenderer.send('listar-pacientes');
};
listarPacientes();

const renderPacientes = (pacientes) => {
    listaPacientes.innerHTML = '';
    pacientes.forEach((paciente) => {
        listaPacientes.innerHTML += `
            <div>
                ${paciente.nombre}
            </div>
        `;
    });
};
