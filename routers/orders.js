const express = require('express');
const router = express.Router();
const Order = require('../models/Orders');
const { validateJWT, validateRoles } = require('../middlewares/validate-jwt');
const Product = require('../models/Product');
const User = require('../models/User');


router.get('/ordersadmin', [validateJWT, validateRoles], async(req, res) => {
    // const { name, id } = req.query;
    const order = await Order.findAll();

    res.json({
        msg: 'get api-controller-ADMIN',
        order
    });
});


router.post('/', [validateJWT], async(req, res) => {

    const { product_id, quantity_orders } = req.body;
    const selectProduct = await Product.findOne({ where: { id: product_id } });

    try {

        if (!selectProduct) {
            return res.status(401).json({
                msg: `the id ${product_id} not exist.`
            });
        };

        total = selectProduct.cost * quantity_orders;

        await Order.create({ quantity_orders, total, estado: 'new', userId: req.user.id, productId: selectProduct.id });

    } catch (error) {
        res.status(500).json(error);
    };

    res.json({
        msg: 'post api-controller',
        quantity_orders,
        total,
        user: req.user.id,
        Product: selectProduct
    });

});

router.get('/', [validateJWT], async(req, res) => {

    try {
        const order = await Order.findAll({
            where: { userId: req.user.id },
            include: [{
                model: User,
                attributes: ['name', 'email', 'phone', 'adress']
            }, {
                model: Product,
                attributes: ['title', 'cost']
            }]
        });
        res.json({
            msg: 'these are your orders',
            order
        });

    } catch (error) {
        res.status(500).json(error);
    };
});

router.get('/:orderId', [validateJWT, validateRoles], async(req, res) => {

    const { orderId } = req.params;

    try {
        const order = await Order.findAll({
            where: { id: orderId },
            include: [{
                model: Product
            }, {
                model: User,
                attributes: ['name', 'email', 'phone', 'adress']
            }]
        });

        if (order == '') {
            return res.status(401).json({
                msg: `The order not exist.`
            });
        };

        res.json({
            msg: 'get for id api-controller',
            order
        });

    } catch (error) {
        res.status(500).json(error);
    };

});

router.put('/:orderId', [validateJWT, validateRoles], async(req, res) => {

    const { orderId } = req.params;
    const { estado } = req.body;

    try {
        await Order.update({ estado }, { where: { id: orderId } });

        res.json({
            msg: 'the order was updated'
        });

    } catch (error) {
        res.status(500).json(error);
    };
});

router.delete('/:orderId', [validateJWT, validateRoles], async(req, res) => {

    const { orderId } = req.params;

    try {
        Order.destroy({ where: { id: orderId } });
    } catch (error) {
        res.status(500).json(error);
    };

    res.json({
        msg: 'It was removed successfully'
    });
});


module.exports = router;