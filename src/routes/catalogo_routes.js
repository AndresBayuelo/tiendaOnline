const express = require('express');
const router = express.Router();
const catalogoController = require('../controllers/catalogo_controller');

router.get('/registroProducto', catalogoController.registroProducto );
router.post('/registrarProducto', catalogoController.crearProducto );
router.get('/listarProductosCiudad', catalogoController.consultarProductosCiudad );
router.get('/listarProductosCriterios', catalogoController.consultarProductosCriterios );

module.exports = router;