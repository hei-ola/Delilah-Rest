const Sequelize = require('sequelize');
const db = require('../config/db');
const Product = require('./Product');


const Orderdet = db.define('orderdt', {
    id_pedido: {
        type: Sequelize.INTEGER
    },
    quantity_orders: {
        type: Sequelize.INTEGER
    },
    total: {
        type: Sequelize.DECIMAL
    }
});



Orderdet.belongsTo(Product);



module.exports = Orderdet;