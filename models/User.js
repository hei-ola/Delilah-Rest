const Sequelize = require('sequelize');
const db = require('../config/db');
const bcryptjs = require('bcryptjs');


const User = db.define('user', {

    id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    name: {
        type: Sequelize.STRING(30),
        allowNull: false
    },
    lastname: {
        type: Sequelize.STRING(60),
        allowNull: false
    },
    email: {
        type: Sequelize.STRING(60),
        allowNull: false,
        unique: { args: true, msg: 'user registred' },
        validate: { isEmail: { msg: 'add email validation' } }
    },
    password: {
        type: Sequelize.STRING(60),
        allowNull: false
    },
    phone: {
        type: Sequelize.INTEGER,
        allowNull: false
    },
    adress: {
        type: Sequelize.STRING(60),
        allowNull: false
    },
    rol: Sequelize.STRING
}, {
    hooks: {
        beforeCreate(user) {
            user.password = bcryptjs.hashSync(user.password, bcryptjs.genSaltSync(12), null);
        }
    }
});

module.exports = User;