var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  if(req.session.usuario){
    console.log(req.session.usuario);
    if(!req.session.usuario.cliente) res.render('catalogo/inventario');
    else res.render('catalogo/venta');
  } else res.render('catalogo/venta');
});

module.exports = router;