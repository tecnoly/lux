module.exports = {
    type: "mysql",
    host: process.env.DB_HOST || "localhost",
    port: process.env.DB_PORT || 3306,
    username: process.env.DB_USER || "mysql",
    password: process.env.DB_PASSWORD || "mysql",
    database: process.env.DB_NAME || "lux",
    charset: "utf8",
    driver: "mysql",
    synchronize: process.env.NODE_ENV !== "production",
    entities:[
        "**/**.entity.ts",
        '**/**.entity.js',
    ],
    logging: "error",
    migrations: [
        "migration/*.ts", 
        "migration/*.js",
    ],
    cli: {
        migrationsDir: "migration"
    },
    connectTimeout: 3000
};
