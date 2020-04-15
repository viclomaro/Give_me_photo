const router = require('express').Router();
const Pedido = require('../../models/pedido');
const middlewares = require('../middlewares');

router.use(middlewares.checkToken);

//POST  http://localhost:3000/api/pedidos/carrito
router.post('/carrito', async(req, res) => {
    const result = await Pedido.createPedido(req.body.direccion, req.body.telefono, req.payload.usuarioId);
    for (let producto of req.body.productos) {
        await Pedido.createProductoPedido(result.insertId, producto)
    }
    res.json(result)
});


module.exports = router;