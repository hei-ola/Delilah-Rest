const Sequelize = require('sequelize');
const db = require('../config/db');


const Product = db.define('product', {

    id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    picture: {
        type: Sequelize.STRING(60)
    },
    title: {
        type: Sequelize.STRING(60),
        allowNull: false
    },
    cost: {
        type: Sequelize.INTEGER,
        allowNull: false
    }
});

module.exports = Product;