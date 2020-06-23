const oracledb = require('oracledb');

async function run(credentials, statement) {

  let connection;

  try {

    connection = await oracledb.getConnection(  {
      user          : credentials.username,
      password      : credentials.password,
      connectString : "localhost:1521/XE"
    });

    return result = await statement(connection);

  } catch (err) {
    return err;
  } finally {
    if (connection) {
      try {
        await connection.close();
      } catch (err) {
        return err;
      }
    }
  }
}

module.exports = { run }