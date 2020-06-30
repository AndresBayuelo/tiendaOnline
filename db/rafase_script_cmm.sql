/* Create Comments */

COMMENT ON TABLE  categoria IS 'Contiene las categor�as y subcategor�as sobre las que est�n clasificados los productos'
;

COMMENT ON COLUMN  categoria.N_NOMBRE IS 'Nombre de la categor�a'
;

COMMENT ON COLUMN  categoria.K_IDCATEGORIAPADRE IS 'Identificador de la categor�a padre. Usado para especificar que una categor�a es una subcategor�a de otra'
;

COMMENT ON TABLE  ciudad IS 'Almacena todas las ciudades donde la cadena de tiendas RAFASE posee sucursales'
;

COMMENT ON COLUMN  ciudad.N_NOMBRE IS 'Nombre de la ciudad'
;

COMMENT ON TABLE  cliente IS 'Contiene la informaci�n principal del cliente registrado.'
;

COMMENT ON COLUMN  cliente.K_IDCLIENTE IS 'Respresenta el identificador de cada uno de los clientes registrados en el sistema.'
;

COMMENT ON COLUMN  cliente.K_CEDULA IS 'N�mero de identificaci�n propio de cada persona DNI'
;

COMMENT ON COLUMN  cliente.N_NOMBRE IS 'Nombre del cliente'
;

COMMENT ON COLUMN  cliente.F_FECHANACIMIENTO IS 'Fecha de nacimiento del cliente, a partir de la cual se calcula su edad'
;

COMMENT ON COLUMN  cliente.I_GENERO IS 'G�nero con el cual se identifica del cliente'
;

COMMENT ON COLUMN  cliente.O_EMAIL IS 'Correo electr�nico perteneciente al cliente y a trav�s del cual se le brindar� informaci�n de su cuenta'
;

COMMENT ON TABLE  cliente_direccion IS 'Registra la direcci�n del domicilio de los clientes registrados'
;

COMMENT ON COLUMN  cliente_direccion.K_IDCLIENTE IS 'N�mero �nico de identificaci�n del cliente'
;

COMMENT ON COLUMN  cliente_direccion.K_IDDIRECCION IS 'Identificador �nico de la direcci�n de domicilio'
;

COMMENT ON TABLE  cliente_tarjetacredito IS 'Registra la informaci�n de tarjetas de cr�dito pertenecientes al cliente'
;

COMMENT ON COLUMN  cliente_tarjetacredito.K_IDTARJETACREDITO IS 'Identificador �nico de una tarjeta de cr�dito'
;

COMMENT ON COLUMN  cliente_tarjetacredito.K_IDCLIENTE IS 'Identificador �nico del cliente.'
;

COMMENT ON TABLE  costo_envio IS 'Tabla costo_ envio Representa el costo que se puede generar si al momento de concretarse un pedido, la ciudad de destino no corresponde a la misma ciudad desde la cual se solicito el pedido.'
;

COMMENT ON COLUMN  costo_envio.K_IDCIUDADORIGEN IS 'K_IDCIUDADORIGEN: Describe la ciudad de la cual se va enviar el pedido.'
;

COMMENT ON COLUMN  costo_envio.K_IDCIUDADDESTINO IS 'K_IDCIUDADDESTINO: Describe la ciudad a la cual se va enviar el pedido.'
;

COMMENT ON COLUMN  costo_envio.V_VALOR IS 'V_VALOR: Describe el valor generado para el costo de env�o, dependiendo de la ciudad seleccionado por el cliente.'
;

COMMENT ON COLUMN  costo_envio.F_FECHA IS 'F_FECHA: Describe la fecha en que se calcula el costo de env�o'
;

COMMENT ON TABLE  direccion IS 'entidad encargada de registrar los domicilios de entrega del usuario '
;

COMMENT ON COLUMN  direccion.K_IDDIRECCION IS 'Identificador unico de la direccion de entrega del pedido '
;

COMMENT ON COLUMN  direccion.N_DIRECCION IS 'registro de la direccion de la entrega '
;

COMMENT ON COLUMN  direccion.Q_TELEFONO IS 'telefono de contacto asociado al domicilio de la entrega del pedido'
;

COMMENT ON TABLE  factura IS 'Tabla factura. Esta tabla representa la factura que visualizara el cliente, al momento de haber concretado la compra que tenia alamcenada en su carrito, pordra visualizar en detalle todos los elemntos que componen su compra.'
;

COMMENT ON COLUMN  factura.F_FECHAFACTURA IS 'F_FECHAFACTURA: Describe la fecha en que se genera la factura que visualizara el cliente al momento de concretar su compra.'
;

COMMENT ON COLUMN  factura.K_IDPEDIDOCLIENTE IS 'K_IDPEDIDOCLIENTE: Describe la relaci�n que se tiene con la tabla pedido_cliente, esta descripci�n permite acceder a la informaci�n generada para el pedido una vez se ha concretado por medio de un pago, funciona como FK.'
;

COMMENT ON TABLE  inventario IS 'Entidad encargada de registrar el numero de productos asociados a una ciudad '
;

COMMENT ON COLUMN  inventario.K_IDINVENTARIO IS 'identificador del inventario'
;

COMMENT ON COLUMN  inventario.V_PRECIO IS 'precio del producto en pesos colombianos'
;

COMMENT ON COLUMN  inventario.Q_CANTIDAD IS 'cantidad actual del producto'
;

COMMENT ON COLUMN  inventario.K_IDREFERENCIAUNICA IS 'identificador de referencia'
;

COMMENT ON COLUMN  inventario.K_IDCIUDAD IS 'Ciudad asociada al producto en el inventario'
;

COMMENT ON TABLE  pago IS 'Entidad que registra el proceso de pago realizado por el usuario'
;

COMMENT ON COLUMN  pago.K_IDPAGO IS 'Identificador �nico del pago'
;

COMMENT ON COLUMN  pago.F_FECHA IS 'Almacena la fecha en que inicia de proceso de pago'
;

COMMENT ON COLUMN  pago.I_TIPO IS 'Referencia el medio por el cual se har� el pago (pse, tarjeta de cr�dito)'
;

COMMENT ON COLUMN  pago.Q_VALOR IS 'Valor a pagar correspondiente al valor total del pedido del cliente'
;

COMMENT ON COLUMN  pago.I_ESTADO IS 'Referencia el estado actual de la transacci�n (iniciado, en proceso, aprobado, rechazado, cancelado)'
;

COMMENT ON COLUMN  pago.K_IDPEDIDOCLIENTE IS 'Identificador del pedido del cliente al cual se esta haciendo el pago'
;

COMMENT ON TABLE  pago_pse IS 'Registra el pago realizado por el m�todo pse'
;

COMMENT ON COLUMN  pago_pse.K_IDPAGOPSE IS 'Identificador del pago por pse'
;

COMMENT ON COLUMN  pago_pse.N_BANCO IS 'Nombre del banco por el cual se paga'
;

COMMENT ON COLUMN  pago_pse.Q_NUMEROIDENTIFICACION IS 'Numero de identificaci�n de la persona que realiza el pago'
;

COMMENT ON COLUMN  pago_pse.O_EMAIL IS 'Correo electr�nico de la persona que realiza el pago'
;

COMMENT ON COLUMN  pago_pse.N_NOMBREDUENO IS 'Nombre del titular de la cuenta bancaria'
;

COMMENT ON COLUMN  pago_pse.K_IDPAGO IS 'Identificador del pago al cual se esta realizando el pago por pse'
;

COMMENT ON TABLE  pago_tarjetacredito IS 'Registra el pago realizado por el m�todo tarjeta de cr�dito'
;

COMMENT ON COLUMN  pago_tarjetacredito.K_IDPAGO IS 'Identificador del pago al cual se esta realizando el pago por tarjeta de cr�dito'
;

COMMENT ON COLUMN  pago_tarjetacredito.K_IDTARJETACREDITO IS 'Identificador de la tarjeta de cr�dito con la cual se esta realizando el pago'
;

COMMENT ON TABLE  parametro_pedidocliente IS 'Tabla parametro_pedidocliente Represeenta el tiempo en que el pedido de un cliente puede permanecer sin pagar, luego de cierto n�mero de horas en esta tabla, el carrito del cliente es eliminado.'
;

COMMENT ON COLUMN  parametro_pedidocliente.F_FECHA IS 'F_FECHA: Describe la fecha en que se presentan la ultima modificaci�n del pedido del cliente, a partir de esta, se inicia un conteo de horas, en el atributo Q_DURACIONPEDIDO con la cual si se excede el n�mero de horas, el carrito se borar�. '
;

COMMENT ON COLUMN  parametro_pedidocliente.Q_DURACIONPEDIDO IS 'Q_DURACIONPEDIDO: Describe el n�mero de horas que han pasado antes de que un carrito pueda ser eliminado.'
;

COMMENT ON COLUMN  parametro_pedidocliente.K_IDPEDIDOCLIENTE IS 'K_IDPEDIDOCLIENTE: Representa la FK generada entre la tabla parametro_pedidocliente con la tabla pedido_cliente.'
;

COMMENT ON TABLE  pedido_cliente IS 'Relaciona toda la informaci�n acerca del pedido del cliente, su direcci�n, sus prductos, su cantidad, las fechas en que se cre� y finaliz� el carrito de compras y la fecha en que el pedido fue entregado en el domicilio del cliente'
;

COMMENT ON COLUMN  pedido_cliente.K_IDPEDIDOCLIENTE IS 'Identificador �nico del pedido para un cliente'
;

COMMENT ON COLUMN  pedido_cliente.F_FECHACREACION IS 'Fecha de creaci�n del pedido del cliente'
;

COMMENT ON COLUMN  pedido_cliente.F_FECHAMODIFICACION IS '�ltima fecha en que se modificaron los productos del pedido'
;

COMMENT ON COLUMN  pedido_cliente.I_ESTADO IS 'Situaci�n en que se encuentra el pedido, si est� enviado, si est� en preparaci�n o si ya se ha entregado'
;

COMMENT ON COLUMN  pedido_cliente.K_IDDIRECCION IS 'Direcci�n de domicilio del cliente'
;

COMMENT ON COLUMN  pedido_cliente.V_SUBTOTAL IS 'Costo de los productos del pedido, sin tener en cuenta el costo de env�o, impuestos o descuentos si aplica.'
;

COMMENT ON COLUMN  pedido_cliente.Q_NUMEROPRODUCTOS IS 'Cantidad de productos en el pedido del cliente'
;

COMMENT ON COLUMN  pedido_cliente.F_FECHAENTREGA IS 'Fecha en que el pedido lleg� al domicilio de cliente'
;

COMMENT ON COLUMN  pedido_cliente.K_IDCLIENTE IS 'Identificador unico del cliente'
;

COMMENT ON COLUMN  pedido_cliente.V_COSTOENVIO IS 'Costo adicional de transporte para garantizar la entrega del pedido al domicilio del cliente'
;

COMMENT ON COLUMN  pedido_cliente.V_VALORTOTAL IS 'Costo total del pedido, relacionando costo de los productos, impuestos, env�o y descuentos si aplica'
;

COMMENT ON COLUMN  pedido_cliente.V_IVA IS 'Impuesto de valor agregado'
;

COMMENT ON TABLE  pedido_proveedor IS 'Muestra los proveedores que suministran pedidos a cada ciudad'
;

COMMENT ON COLUMN  pedido_proveedor.F_FECHA IS 'Fecha en que se solicit� el pedido al proveedor'
;

COMMENT ON COLUMN  pedido_proveedor.K_IDPROVEEDOR IS 'Identificdor del proveedor al que se le hizo el pedido'
;

COMMENT ON COLUMN  pedido_proveedor.K_IDCIUDAD IS 'Identificador de la ciudad donde se solicit� el pedido'
;

COMMENT ON TABLE  producto IS 'Tabla que almacena los productos ofrecidos por la cadena de tiendas'
;

COMMENT ON COLUMN  producto.N_NOMBRE IS 'Nombre del producto'
;

COMMENT ON COLUMN  producto.N_MARCA IS 'Marca del producto'
;

COMMENT ON COLUMN  producto.K_IDCATEGORIA IS 'Identificador de la categor�a a la que pertenece el producto'
;

COMMENT ON COLUMN  producto.N_UNIDADMEDIDA IS 'Nombre de la unidad de medida relacionada con el producto'
;

COMMENT ON COLUMN  producto.L_IMAGEN IS 'Direcci�n de enlace que hace referencia a la imagen del producto'
;

COMMENT ON TABLE  producto_pedidocliente IS 'Registra los productos que desea comprar el usuario'
;

COMMENT ON COLUMN  producto_pedidocliente.K_IDPRODUCTOPEDIDOCLIENTE IS 'Identificador �nico del registro'
;

COMMENT ON COLUMN  producto_pedidocliente.K_IDPEDIDOCLIENTE IS 'Identificador del pedido del cliente'
;

COMMENT ON COLUMN  producto_pedidocliente.K_IDREFERENCIAUNICA IS 'Referencia del producto'
;

COMMENT ON COLUMN  producto_pedidocliente.Q_CANTIDAD IS 'Cantidad del producto'
;

COMMENT ON COLUMN  producto_pedidocliente.V_PRECIO IS 'Precio de la cantidad de productos'
;

COMMENT ON TABLE  producto_pedidoproveedor IS 'Tabla producto_pedidoproveedor Esta tabla se encarga de establecer la relaci�n entre los productos que necesta la tienda para abastecerse y  los porveedores que facilitan dichos productos.'
;

COMMENT ON COLUMN  producto_pedidoproveedor.Q_CANTIDAD IS 'Q_CANTIDAD: Describe el n�mero de productos que se le solicitan alos proveedores, se permiten decimales ya que se pueden solicitar elementos de canasta familiar no enteros.'
;

COMMENT ON COLUMN  producto_pedidoproveedor.V_PRECIO IS 'V_PRECIO: Describe el precio que tienen los productos solicitados al proveedor.'
;

COMMENT ON COLUMN  producto_pedidoproveedor.K_IDREFERENCIAUNICA IS 'K_IDREFERENCIAUNICA: Describe el identificador para la tabla producto, se usa como FK.'
;

COMMENT ON COLUMN  producto_pedidoproveedor.K_IDPEDIDOPROVEEDOR IS 'K_IDPEDIDOPROVEEDOR: Describe el identificador para la tabla pedido_proveedor, se usa como FK.'
;

COMMENT ON TABLE  producto_proveedor IS 'Asocia los productos que puede suministrar un proveedor en determinada ciudad'
;

COMMENT ON COLUMN  producto_proveedor.K_IDREFERENCIAUNICA IS 'Identificador del producto'
;

COMMENT ON COLUMN  producto_proveedor.K_IDPROVEEDOR IS 'Identificador del proveedor'
;

COMMENT ON COLUMN  producto_proveedor.K_IDCIUDAD IS 'Identificador de la ciudad'
;

COMMENT ON TABLE  proveedor IS 'Entidad encargada de registrar los proveedores que suministran productos a la tienda'
;

COMMENT ON COLUMN  proveedor.K_IDPROVEEDOR IS 'identificador unico del proveedor'
;

COMMENT ON COLUMN  proveedor.N_NOMBRE IS 'nombre del proveedor'
;

COMMENT ON COLUMN  proveedor.N_DIRECCION IS 'direccion del proveedor '
;

COMMENT ON COLUMN  proveedor.N_CIUDAD IS 'ciudad del proveedor, diferencia las direcciones donde puede estar el proveedor'
;

COMMENT ON TABLE  tarjeta_credito IS 'entidad que registra las tarjetas de credito del usuario '
;

COMMENT ON COLUMN  tarjeta_credito.K_IDTARJETACREDITO IS 'Identificador unico de la tarjeta de credito'
;

COMMENT ON COLUMN  tarjeta_credito.F_FECHAVENCIMIENTO IS 'fecha de vencimiento asociada a la tarjeta de credito'
;

COMMENT ON COLUMN  tarjeta_credito.Q_NUMEROTARJETA IS 'numero personal de la tarjeta de credito asignado por el banco'
;

COMMENT ON COLUMN  tarjeta_credito.Q_CCV IS 'codigo de verificacion de tarjeta '
;

COMMENT ON COLUMN  tarjeta_credito.N_NOMBREDUENO IS 'nombre del due�o asociado a la tarjeta por el banco'
;

COMMENT ON COLUMN  PRODUCTO.K_IDREFERENCIAUNICA IS 'Numero de referencia que identifica a un producto'
;

COMMENT ON COLUMN  CATEGORIA.K_IDCATEGORIA IS 'Identificador de la categoría'
;

COMMENT ON COLUMN  PEDIDO_PROVEEDOR.K_IDPEDIDOPROVEEDOR IS 'Identificador del pedido proveedor'
;

COMMENT ON COLUMN  CIUDAD.K_IDCIUDAD IS 'Identificador de la ciudad'
;