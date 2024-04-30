import { Sequelize } from "sequelize";


// postgres
const sequelize = new Sequelize({
    dialect: "postgres",
    username: "postgres",
    password: "mnbjkl123",
    database: "localizatec",
    host: "localhost",
    port: 5432,
    logging: false,
});

async function connect() {
    try {
        await sequelize.authenticate();
        console.log("\x1b[92m[PostgresSQL] La conexion a la base de datos exitosa \x1b[39m");
        sequelize.sync();
    } catch (error) {
        console.error("Unable to connect to the database:", error);
    }
}

connect();

export default sequelize;