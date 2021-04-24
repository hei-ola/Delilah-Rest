const express = require('express');
const router = express.Router();
const Order = require('../models/Orders');
const Orderdet = require('../models/Orderdet');
const Product = require('../models/Product');
const User = require('../models/User');
const { validateJWT, validateRoles } = require('../middlewares/validate-jwt');


router.get('/ordersadmin', [validateJWT, validateRoles], async(req, res) => {
    // const { name, id } = req.query;
    const order = await Order.findAll();

    res.json({
        msg: 'get api-controller-ADMIN',
        order
    });
});

router.post('/', [validateJWT], async(req, res) => {

    try {

        let otro = [];
        let total = 0;

        for (const item in req.body.items) {
            const product_id = req.body.items[item]
            otro.push(product_id.product_id)
        };

        for (const item in otro) {
            const selectProduct = await Product.findOne({ where: { id: otro[item] } });
            if (!selectProduct) {
                return res.status(401).json({
                    msg: `the id ${otro[item]} not exist.`
                });
            };
            total = total + selectProduct.cost;
        };

        const created = await Order.create({
            formpag: req.body.formpag,
            total: total,
            estado: 'nuevo',
            userId: req.user.id
        });

        req.body.items.forEach(async(item) => {
            const selectProduct = await Product.findOne({ where: { id: item.product_id } });
            if (!selectProduct) {
                return res.status(401).json({
                    msg: `the id ${item.product_id} not exist.`
                });
            };

            await Orderdet.create({
                id_pedido: created.id,
                productId: item.product_id,
                quantity_orders: item.quantity_orders,
                total: selectProduct.cost
            });
        });

        res.json({...created.dataValues, items: req.body.items });

    } catch (error) {
        res.status(500).json(error);
    };

});


router.get('/', [validateJWT], async(req, res) => {

    try {
        const order = await Order.findAll({
            where: { userId: req.user.id },
            include: [{
                model: User,
                attributes: ['name', 'email', 'phone', 'adress']
            }, {
                model: Orderdet,
                attributes: ['id_pedido', 'quantity_orders', 'total'],
                include: [{ model: Product, attributes: ['title', 'cost'] }]
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
        const order = await Order.findOne({
            where: { id: orderId },
            include: [{
                model: Orderdet
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
        const select = await Order.findOne({ where: { id: orderId } });
        if (!select) {
            return res.status(401).json({
                msg: `the id ${orderId} not exist.`
            });
        };
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
        const select = await Order.findOne({ where: { id: orderId } });
        if (!select) {
            return res.status(401).json({
                msg: `the id ${orderId} not exist.`
            });
        };

        Order.destroy({ where: { id: orderId } });

    } catch (error) {
        res.status(500).json(error);
    };

    res.json({
        msg: 'It was removed successfully'
    });
});


module.exports = router;