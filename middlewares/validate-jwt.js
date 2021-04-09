const jwt = require('jsonwebtoken');
const User = require('../models/User');


const validateJWT = async(req, res, next) => {

    const token = req.header('token');

    if (!token) {
        return res.status(401).json({
            msg: 'invalido token'
        });
    };
    try {

        const { uid } = jwt.verify(token, process.env.SECRETORPRIVATEKEY);

        const user = await User.findOne({ where: { id: uid } });

        if (!user) {
            return res.status(401).json({
                msg: 'not exist in bd'
            });
        }

        req.user = user;
        next();

    } catch (error) {
        console.log(error);
        res.status(401).json({
            msg: 'token no valido'
        });
    };
};
const validateRoles = (req, res, next) => {

    if (!req.user) {
        return res.status(500).json({
            msg: 'Validate token'
        });
    };

    const { rol, name } = req.user;

    if (rol !== "ADMIN") {
        return res.status(401).json({
            msg: `${name} is not admin`
        });
    };

    next();
};

module.exports = {
    validateJWT,
    validateRoles
};