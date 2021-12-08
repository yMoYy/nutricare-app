const { app } = require('electron');

const { createWindow } = require('./main');

require('./models/database');

require('electron-reload')(__dirname);

app.whenReady().then(() => {
    createWindow();
    app.on('activate', () => {
        if (BrowserWindow.getAllWindows().length === 0) createWindow()
    });
});

app.on('window-all-closed', () => {
    if (process.platform !== 'darwin') app.quit()
});