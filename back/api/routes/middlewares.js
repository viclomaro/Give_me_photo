const jwt = require('jwt-simple');
const moment = require('moment');

const checkToken = (req, res, next) => {
    if (!req.headers['user-token']) {
        return console.log('Debes incluir la cabecera user-token');
    }
    const token = req.headers['user-token'];
    let payload = null;
    try {
        payload = jwt.decode(token, process.env.SECRET_KEY);
    } catch (err) {
        return console.log('user-token es incorrecto');
    }

    const fechaActual = moment().unix();
    if (fechaActual > payload.fechaExpiracion) {
        return res.json({ error: 'Tu sesion ha finalizado, vuelve a iniciar sesion' })
    }

    req.payload = payload;

    next();
};


module.exports = {
    checkToken: checkToken
}