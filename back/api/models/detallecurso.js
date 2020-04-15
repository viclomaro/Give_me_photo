const getAllDetallePedido = (pUsuarioId) => {
    return new Promise((resolve, reject) => {
        db.query('SELECT *  FROM tbi_pedido_cursos pedCurs, cursos curs WHERE fk_usuario = ? AND pedCurs.fk_curso = curs.id', [pUsuarioId], (err, result) => {
            if (err) reject(err);
            resolve(result)
        })
    });
}


const createPedidoCurso = (pCursoId, pUsuarioId) => {
    return new Promise((resolve, reject) => {
        db.query('INSERT INTO tbi_pedido_cursos(fk_usuario, fk_curso) VALUES (?, ?)', [pCursoId, pUsuarioId], (err, result) => {
            if (err) reject(err);
            resolve(result)
        })
    });
}


module.exports = {
    createPedidoCurso: createPedidoCurso,
    getAllDetallePedido: getAllDetallePedido
}