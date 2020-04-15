const getByNivel = (pNivel) => {
    return new Promise((resolve, reject) => {
        db.query('select * from cursos where nivel = ?', [pNivel], (err, rows) => {
            if (err) reject(err);
            if (rows.length === 0) {
                resolve(null);
            }
            resolve(rows);
        })
    });
}


module.exports = {
    getByNivel: getByNivel,
}