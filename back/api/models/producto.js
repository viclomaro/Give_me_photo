const getAll = () => {
    return new Promise((resolve, reject) => {
        db.query('select * from productos', (err, rows) => {
            if (err) reject(err);
            resolve(rows);
        })
    });
};


const getByMarcaCamaras = (pMarca) => {
    return new Promise((resolve, reject) => {
        db.query('select * from productos where marca = ? and categoria = "camaras"', [pMarca], (err, rows) => {
            if (err) reject(err);
            if (rows.length === 0) {
                resolve(null);
            }
            resolve(rows);
        })
    });
}


const getByMarcaObjetivos = (pMarca) => {
    return new Promise((resolve, reject) => {
        db.query('select * from productos where marca = ? and categoria = "objetivos"', [pMarca], (err, rows) => {
            if (err) reject(err);
            if (rows.length === 0) {
                resolve(null);
            }
            resolve(rows);
        })
    });
}


const getByMarcaAccesorios = (pMarca) => {
    return new Promise((resolve, reject) => {
        db.query('select * from productos where marca = ? and categoria = "accesorios"', [pMarca], (err, rows) => {
            if (err) reject(err);
            if (rows.length === 0) {
                resolve(null);
            }
            resolve(rows);
        })
    });
}


const getByCategoria = (pCategoria) => {
    return new Promise((resolve, reject) => {
        db.query('select * from productos where categoria = ?', [pCategoria], (err, rows) => {
            if (err) reject(err);
            if (rows.length === 0) {
                resolve(null);
            }
            resolve(rows);
        })
    });
}


const getByResolucion = (pResolucionMin, pResolucionMax) => {
    return new Promise((resolve, reject) => {
        db.query('select * from productos where resolucion > ? and resolucion < ?', [pResolucionMin, pResolucionMax], (err, rows) => {
            if (err) reject(err);
            if (rows.length === 0) {
                resolve(null);
            }
            resolve(rows);
        })
    })
}


const getByFocal = (pFocalMin, pFocalMax) => {
    return new Promise((resolve, reject) => {
        db.query('select * from productos where focal > ? and focal < ?', [pFocalMin, pFocalMax], (err, rows) => {
            if (err) reject(err);
            if (rows.length === 0) {
                resolve(null);
            }
            resolve(rows);
        })
    })
}


const getByIso = (pIsoMin, pIsoMax) => {
    return new Promise((resolve, reject) => {
        db.query('select * from productos where iso > ? and iso < ?', [pIsoMin, pIsoMax], (err, rows) => {
            if (err) reject(err);
            if (rows.length === 0) {
                resolve(null);
            }
            resolve(rows);
        })
    })
}


const getByPrecio = (pPrecioMin, pPrecioMax) => {
    return new Promise((resolve, reject) => {
        db.query('select * from productos where precio > ? and precio < ?', [pPrecioMin, pPrecioMax], (err, rows) => {
            if (err) reject(err);
            if (rows.length === 0) {
                resolve(null);
            }
            resolve(rows);
        })
    })
}


const getByTecnicas = (pTecnicas, pPrecioMin, pPrecioMax) => {
    return new Promise((resolve, reject) => {
        let query = 'select * from productos where ';
        if (!Array.isArray(pTecnicas)) {
            query += pTecnicas + ' = 1'
        } else {
            for (const key in pTecnicas) {
                if (key == pTecnicas.length - 1) {
                    query += pTecnicas[key] + ' = 1'
                } else {
                    query += pTecnicas[key] + ' = 1 and ';
                }
            }
        }
        console.log(query)
        db.query(`${query} and precio > ? and precio < ?`, [pPrecioMin, pPrecioMax], (err, rows) => {
            if (err) reject(err);
            if (rows.length === 0) {
                resolve(null);
            }
            resolve(rows);
        })
    })
}


module.exports = {
    getByCategoria: getByCategoria,
    getAll: getAll,
    getByResolucion: getByResolucion,
    getByFocal: getByFocal,
    getByIso: getByIso,
    getByPrecio: getByPrecio,
    getByTecnicas: getByTecnicas,
    getByMarcaCamaras: getByMarcaCamaras,
    getByMarcaObjetivos: getByMarcaObjetivos,
    getByMarcaAccesorios: getByMarcaAccesorios
}