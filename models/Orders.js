const Sequelize = require('sequelize');
const db = require('../config/db');
const Orderdet = require('./Orderdet');
const User = require('./User');



const Order = db.define('order', {
    id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    total: {
        type: Sequelize.DECIMAL,
    },
    formpag: {
        type: Sequelize.STRING(60)
    },
    estado: {
        type: Sequelize.STRING(60),
        allowNull: false
    }
});

Order.belongsTo(User);
Order.hasMany(Orderdet, { foreignKey: 'id_pedido' });


module.exports = Order;