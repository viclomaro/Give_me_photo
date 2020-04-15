const getAllPedidosUser = (pId) => {
    return new Promise((resolve, reject) => {
        db.query('select * from pedidos where fk_usuario = ?', [pId], (err, rows) => {
            if (err) reject(err);
            if (rows.length === 0) {
                resolve(null);
            }
            resolve(rows);
        })
    });
};


const getAllDetallePedidos = (pedidoId) => {
    return new Promise((resolve, reject) => {
        db.query('SELECT *  FROM tbi_pedidos_productos pedProd, productos prod WHERE fk_pedido = ? AND pedProd.fk_producto = prod.id', [pedidoId], (err, result) => {
            if (err) reject(err);
            resolve(result);
        });
    })
}


module.exports = {
    getAllPedidosUser: getAllPedidosUser,
    getAllDetallePedidos: getAllDetallePedidos
}