const router = require('express').Router();
const Cursos = require('../../models/curso');

//GET http://localhost:3000/api/cursos/:nivel
router.get('/:nivel', async(req, res) => {
    const cursos = await Cursos.getByNivel(req.params['nivel']);
    res.json(cursos)
})


module.exports = router;