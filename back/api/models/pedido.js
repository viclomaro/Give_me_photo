const createPedido = (direccion, telefono, fk_usuario) => {
    return new Promise((resolve, reject) => {
        db.query('insert into pedidos (direccion, telefono, fechapedido, fk_usuario) values(?,?,?,?)', [direccion, telefono, new Date(), fk_usuario], (err, result) => {
            if (err) reject(err);
            resolve(result);
        })
    });
}


const createProductoPedido = (pedidoId, productoId) => {
    return new Promise((resolve, reject) => {
        db.query('insert into tbi_pedidos_productos(fk_pedido, fk_producto) values(?,?)', [pedidoId, productoId], (err, result) => {
            if (err) reject(err);
            resolve(result);
        });
    })
}


module.exports = {
    createPedido: createPedido,
    createProductoPedido: createProductoPedido
}