const { Notification } = require('electron');
const { getConnection } = require('../models/database');

const listarPacientes = async () => {
    try {
        const conn = await getConnection();
        const query = await conn.query(
            'SELECT * FROM paciente',
            (error, results, fields) => {
                if (error) {
                    console.log(error);
                    throw error;
                }
                console.log(results);
                console.log(query.sql);
                return results;
            }
        );
    } catch (error) {
        console.log(error);
    }
};

const crearPaciente = (paciente) => {
    try {
        const conn = getConnection();
        conn.query(
            {
                sql: 'INSERT INTO paciente SET ?',
                values: paciente
            },
            (error, results, fields) => {
                if (error) {
                    console.log(error);
                    throw error;
                }
                console.log(results);
                console.log(fields);

                new Notification({
                    title: 'NutriCare',
                    body: `${paciente.txt_nombre} guardado exitosamente`
                }).show();
            }
        );
    } catch (error) {
        console.log(error);
    }
};

module.exports = { listarPacientes, crearPaciente };
