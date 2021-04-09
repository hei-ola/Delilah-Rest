const express = require('express');
const router = express.Router();
const Product = require('../models/Product');
const { validateJWT, validateRoles } = require('../middlewares/validate-jwt');


router.get('/', [validateJWT], async(req, res) => {
    // const { name, id } = req.query;
    const product = await Product.findAll();

    res.json({
        msg: 'get api-controller',
        product
    });
});

router.post('/', [validateJWT, validateRoles], async(req, res) => {

    const { picture, title, cost } = req.body;

    try {
        await Product.create({ picture, title, cost });

    } catch (error) {
        res.status(500).json(error);
    };

    res.json({
        msg: 'post api-controller',
        picture,
        title,
        cost
    });
});

router.put('/:productId', [validateJWT, validateRoles], async(req, res) => {

    const { productId } = req.params;
    const { picture, title, cost } = req.body;

    try {
        Product.update({ picture, title, cost }, { where: { id: productId } });

    } catch (error) {
        res.status(500).json(error);
    };

    res.json({
        msg: 'put api-controller',
        picture,
        title,
        cost
    });
});

router.delete('/:productId', [validateJWT, validateRoles], async(req, res) => {

    const { productId } = req.params;

    try {
        Product.destroy({ where: { id: productId } });
    } catch (error) {
        res.status(500).json(error);
    };

    res.json({
        msg: 'it was removed successfully'
    });
});

module.exports = router;