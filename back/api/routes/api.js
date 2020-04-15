const router = require('express').Router();
const apiUsersRouter = require('./api/users');
const apiProductosRouter = require('./api/productos');
const apiCursosRouter = require('./api/cursos');
const apiDetallePedidosRouter = require('./api/detallePedidos');
const apiPedidosRouter = require('./api/pedidos');
const apiDetalleCursosRouter = require('./api/detallecursos');

router.use('/users', apiUsersRouter);
router.use('/productos', apiProductosRouter);
router.use('/cursos', apiCursosRouter);
router.use('/detallePedidos', apiDetallePedidosRouter);
router.use('/pedidos', apiPedidosRouter);
router.use('/detalleCursos', apiDetalleCursosRouter);

module.exports = router;