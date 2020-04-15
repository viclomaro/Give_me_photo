const router = require('express').Router();
const bcrypt = require('bcryptjs');
const moment = require('moment');
const jwt = require('jwt-simple');
const User = require('../../models/user');
const middleware = require('../middlewares.js');

//GET http://localhost:3000/api/users
router.get('/', middleware.checkToken, async (req, res) => {
    const usuario = await User.getById(req.payload.usuarioId);
    res.json(usuario)
})


//POST http://localhost:3000/api/users/registro
router.post('/registro', async (req, res) => {

    // Encriptamos la password
    const passwordEnc = bcrypt.hashSync(req.body.password, 10);
    req.body.password = passwordEnc;

    // Creamos el usuario
    const result = await User.create(req.body);
    res.json(result)

    // Resultado
    if (result['affectedRows'] === 1) {
        res.json({ success: 'El cliente se ha creado' });
    } else {
        res.json({ error: 'El cliente no se ha podido crear' });
    }
});


// POST http://localhost:3000/api/users/login
router.post('/login', async (req, res) => {
    try {
        const user = await User.emailExist(req.body.email);
        if (!user) {
            return res.status(401).json({ error: 'Error en el usuario' });
        }
        const iguales = bcrypt.compareSync(req.body.password, user.password);
        if (iguales) {
            res.json({ success: createToken(user) });

        } else {
            res.status(401).json({ error: 'Error en email y/o password' });
        }
    } catch (err) {
        console.log(err);
    }
});


const createToken = (pUser) => {

    const payload = {
        usuarioId: pUser.id,
        fechaCreacion: moment().unix(),
        fechaExpiracion: moment().add(30, 'minutes').unix()
    }
    console.log(payload)
    return jwt.encode(payload, process.env.SECRET_KEY);

}


module.exports = router;