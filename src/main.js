const { BrowserWindow, ipcMain } = require('electron');
const path = require('path');
const { listarPacientes, crearPaciente } = require('./controllers/paciente');

const createWindow = () => {
    const win = new BrowserWindow({
        width: 1200,
        height: 700,
        webPreferences: {
            nodeIntegration: true,
            contextIsolation: false,
            preload: path.join(__dirname, 'preload.js')
        }
    });

    win.loadFile('src/index.html');
};
ipcMain.on('listar-pacientes', async () => {
    await listarPacientes();
});

ipcMain.on('crear-paciente', (event, paciente) => {
    console.log(paciente);
    crearPaciente(paciente);
});

module.exports = { createWindow };
