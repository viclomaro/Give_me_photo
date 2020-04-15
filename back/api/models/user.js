const create = ({ nombre, apellidos, email, password }) => {
    return new Promise((resolve, reject) => {
        db.query('insert into usuarios (nombre, apellidos, email, password) values (?,?,?,?)', [nombre, apellidos, email, password],
            (err, result) => {
                if (err) reject(err);
                resolve(result);
            })
    });
}


const emailExist = (pEmail) => {
    return new Promise((resolve, reject) => {
        db.query('select * from usuarios where email = ?', [pEmail], (err, rows) => {
            if (err) reject(err);
            if (rows.length === 0)
                resolve(null);
            resolve(rows[0]);
        })
    });
};


const getById = (pId) => {
    return new Promise((resolve, reject) => {
        db.query('select * from usuarios where id = ?', [pId], (err, rows) => {
            if (err) reject(err);
            if (rows.length === 0) {
                resolve(null);
            }
            resolve(rows);
        })
    });
}


module.exports = {
    create: create,
    emailExist: emailExist,
    getById: getById
}