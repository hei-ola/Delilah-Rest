const Sequelize = require('sequelize');
const db = require('../config/db');


const Rols = db.define('rols', {

    id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    rols: {
        type: Sequelize.STRING(30)
    }
});


module.exports = Rols;