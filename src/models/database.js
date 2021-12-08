const mysql = require('promise-mysql');

const getConnection = async () => {
    const connection = await mysql.createConnection({
        host: 'localhost',
        user: 'root',
        password: '1234',
        database: 'nutricare_app'
    });

    console.log('successful connection: ' + connection.threadId);
    return connection;
};

module.exports = { getConnection };
