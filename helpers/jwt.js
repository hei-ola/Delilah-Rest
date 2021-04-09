const jwt = require('jsonwebtoken');


const useJWT = (uid = '') => {

    return new Promise((resolve, reject) => {
        const payload = { uid };
        jwt.sign(payload, process.env.SECRETORPRIVATEKEY, {
            expiresIn: '2h'
        }, (err, token) => {
            if (err) {
                console.log(err);
                reject('no se genero el token');
            } else {
                resolve(token);
            };
        });

    });
};

module.exports = {
    useJWT
};