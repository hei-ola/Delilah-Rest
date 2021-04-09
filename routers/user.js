const express = require('express');
const router = express.Router();
const User = require('../models/User');
const Rols = require('../models/Rols');
const { validateJWT, validateRoles } = require('../middlewares/validate-jwt');



router.get('/', [validateJWT, validateRoles], async(req, res) => {
    // const { name, id } = req.query;
    const user = await User.findAll();

    res.json({
        msg: 'get api-controller',
        user
    });
});

router.post('/', async(req, res) => {
    const { name, lastname, email, password, phone, adress, rol } = req.body;
    try {
        //validate rols
        const rols = await Rols.findOne({ where: { rols: rol } });

        if (!rols) {
            return res.status(401).json({
                msg: `The rols ${rol} not exist. only accept USER and ADMIN`
            });
        };
        await User.create({ name, lastname, email, password, phone, adress, rol });

    } catch (error) {
        res.status(500).json(error);
    };
    res.json({
        msg: 'post api-controller',
        name,
        lastname,
        email,
        phone,
        adress,
        rol
    });

});

module.exports = router;