const Sequelize = require('sequelize');
const db = require('../config/db');
const Product = require('./Product');
const User = require('./User');



const Order = db.define('order', {
    id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    quantity_orders: {
        type: Sequelize.INTEGER,
        allowNull: false
    },
    total: {
        type: Sequelize.DECIMAL,
    },
    estado: {
        type: Sequelize.STRING(60),
        allowNull: false
    }
});


Order.belongsTo(User);
Order.belongsTo(Product);


module.exports = Order;