const mysql = require('mysql');

const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'root',
    database: 'nutricare_app'
});

const getConnection = () => {
    connection.connect(function(err) {
        if (err) {
          console.error('error connecting: ' +err);
          return;
        }
        console.log('successful connection: ' + connection.threadId);
    });
    return connection;
}

module.exports = { getConnection }