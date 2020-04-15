const router = require('express').Router();
const Pedidos = require('../../models/detallePedido');
const middlewares = require('../middlewares.js');

router.get('/', middlewares.checkToken, async (req, res) => {

    //1 - Recuperar la lista de pedidos del usuario

    const pedidos = await Pedidos.getAllPedidosUser(req.payload.usuarioId);

    // 2 - Recorrer los pedidos obtenidos y sacar los productos de cada pedido

    for (let pedido of pedidos) {

        const productos = await Pedidos.getAllDetallePedidos(pedido.id)
        pedido.productos = productos;
    }
    res.json(pedidos)
});


module.exports = router;