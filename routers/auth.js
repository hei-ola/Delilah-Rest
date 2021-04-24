const express = require('express');
const User = require('../models/User');
const router = express.Router();
const bcryptjs = require('bcryptjs');
const { useJWT } = require('../helpers/jwt');

// router.get('/login', async(req, res) => {
//     const user = await User.findAll();
//     res.json({
//         msg: 'post api-controller',
//         user
//     });
// });


router.post('/', async(req, res) => {

    const { email, password } = req.body;

    try {

        const user = await User.findOne({ where: { email: email } });

        if (!user) {
            return res.status(400).json({
                msg: 'User / password is incorrect'
            });

        };

        const validPassword = bcryptjs.compareSync(password, user.password);

        if (!validPassword) {
            return res.status(400).json({
                msg: 'User / password is incorrect'
            });
        };

        const token = await useJWT(user.id);

        res.json({
            msg: 'login ok',
            user,
            token
        });


    } catch (error) {
        console.log(error);
        res.status(500).json({
            msg: 'fallo administrador'
        });
    };
});

module.exports = router;