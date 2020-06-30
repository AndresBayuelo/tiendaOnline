/* Create Tables */

CREATE TABLE  categoria
(
	K_IDCATEGORIA NUMBER(10) NOT NULL,
	N_NOMBRE VARCHAR(50) NOT NULL,    -- Nombre de la categor�a
	K_IDCATEGORIAPADRE NUMBER(10) NULL    -- Identificador de la categor�a padre. Usado para especificar que una categor�a es una subcategor�a de otra
)
;

CREATE TABLE  ciudad
(
	K_IDCIUDAD NUMBER(10) NOT NULL,
	N_NOMBRE VARCHAR(50) NOT NULL    -- Nombre de la ciudad
)
;

CREATE TABLE  cliente
(
	K_IDCLIENTE NUMBER(8) NOT NULL,    -- Respresenta el identificador de cada uno de los clientes registrados en el sistema.
	K_CEDULA NUMBER(15) UNIQUE NOT NULL,    -- N�mero de identificaci�n propio de cada persona DNI
	N_NOMBRE VARCHAR(100) NOT NULL,    -- Nombre del cliente
	F_FECHANACIMIENTO DATE NOT NULL,    -- Fecha de nacimiento del cliente, a partir de la cual se calcula su edad
	I_GENERO VARCHAR(2) NOT NULL,    -- G�nero con el cual se identifica del cliente
	O_EMAIL VARCHAR(100) UNIQUE NOT NULL,    -- Correo electr�nico perteneciente al cliente y a trav�s del cual se le brindar� informaci�n de su cuenta
	N_NOMBREUSUARIO VARCHAR(50) UNIQUE NOT NULL
)
;

CREATE TABLE  cliente_direccion
(
	K_IDCLIENTE NUMBER(10) NOT NULL,    -- N�mero �nico de identificaci�n del cliente
	K_IDDIRECCION NUMBER(10) NOT NULL    -- Identificador �nico de la direcci�n de domicilio
)
;

CREATE TABLE  cliente_tarjetacredito
(
	K_IDTARJETACREDITO NUMBER(10) NOT NULL,    -- Identificador �nico de una tarjeta de cr�dito
	K_IDCLIENTE NUMBER(10) NOT NULL    -- Identificador �nico del cliente.
)
;

CREATE TABLE  costo_envio
(
	K_IDCOSTOENVIO NUMBER(10) NOT NULL,
	K_IDCIUDADORIGEN NUMBER(10) NOT NULL,    -- K_IDCIUDADORIGEN: Describe la ciudad de la cual se va enviar el pedido.
	K_IDCIUDADDESTINO NUMBER(10) NOT NULL,    -- K_IDCIUDADDESTINO: Describe la ciudad a la cual se va enviar el pedido.
	V_VALOR NUMBER(10) NOT NULL,    -- V_VALOR: Describe el valor generado para el costo de env�o, dependiendo de la ciudad seleccionado por el cliente.
	F_FECHA DATE NOT NULL    -- F_FECHA: Describe la fecha en que se calcula el costo de env�o
)
;

CREATE TABLE  direccion
(
	K_IDDIRECCION NUMBER(10) NOT NULL,    -- Identificador unico de la direccion de entrega del pedido 
	N_DIRECCION VARCHAR(50) NOT NULL,    -- registro de la direccion de la entrega 
	Q_TELEFONO NUMBER(10) NOT NULL,    -- telefono de contacto asociado al domicilio de la entrega del pedido
	K_IDCIUDAD NUMBER(10) NOT NULL
)
;

CREATE TABLE  factura
(
	K_IDNUMEROFACTURA NUMBER(15) NOT NULL,
	F_FECHAFACTURA DATE NOT NULL,    -- F_FECHAFACTURA: Describe la fecha en que se genera la factura que visualizara el cliente al momento de concretar su compra.
	K_IDPEDIDOCLIENTE NUMBER(10) NOT NULL    -- K_IDPEDIDOCLIENTE: Describe la relaci�n que se tiene con la tabla pedido_cliente, esta descripci�n permite acceder a la informaci�n generada para el pedido una vez se ha concretado por medio de un pago, funciona como FK.
)
;

CREATE TABLE  inventario
(
	K_IDINVENTARIO NUMBER(10) NOT NULL,    -- identificador del inventario
	V_PRECIO NUMBER(10,2) NOT NULL,    -- precio del producto en pesos colombianos
	Q_CANTIDAD NUMBER(5,2) NOT NULL,    -- cantidad actual del producto
	K_IDREFERENCIAUNICA NUMBER(10) NOT NULL,    -- identificador de referencia
	K_IDCIUDAD NUMBER(10) NOT NULL    -- Ciudad asociada al producto en el inventario
)
;

CREATE TABLE  pago
(
	K_IDPAGO NUMBER(10) NOT NULL,    -- Identificador �nico del pago
	F_FECHA DATE NOT NULL,    -- Almacena la fecha en que inicia de proceso de pago
	I_TIPO VARCHAR(20) NOT NULL,    -- Referencia el medio por el cual se har� el pago (pse, tarjeta de cr�dito)
	Q_VALOR NUMBER(10,2) NOT NULL,    -- Valor a pagar correspondiente al valor total del pedido del cliente
	I_ESTADO VARCHAR(10) NOT NULL,    -- Referencia el estado actual de la transacci�n (iniciado, en proceso, aprobado, rechazado, cancelado)
	K_IDPEDIDOCLIENTE NUMBER(10) NOT NULL    -- Identificador del pedido del cliente al cual se esta haciendo el pago
)
;

CREATE TABLE  pago_pse
(
	K_IDPAGOPSE NUMBER(10) NOT NULL,    -- Identificador del pago por pse
	N_BANCO VARCHAR(50) NOT NULL,    -- Nombre del banco por el cual se paga
	Q_NUMEROIDENTIFICACION NUMBER(15) NOT NULL,    -- Numero de identificaci�n de la persona que realiza el pago
	O_EMAIL VARCHAR(100) NOT NULL,    -- Correo electr�nico de la persona que realiza el pago
	N_NOMBREDUENO VARCHAR(100) NOT NULL,    -- Nombre del titular de la cuenta bancaria
	K_IDPAGO NUMBER(10) NOT NULL    -- Identificador del pago al cual se esta realizando el pago por pse
)
;

CREATE TABLE  pago_tarjetacredito
(
	K_IDPAGO NUMBER(10) NOT NULL,    -- Identificador del pago al cual se esta realizando el pago por tarjeta de cr�dito
	K_IDTARJETACREDITO NUMBER(10) NOT NULL    -- Identificador de la tarjeta de cr�dito con la cual se esta realizando el pago
)
;

CREATE TABLE  parametro_pedidocliente
(
	K_IDPARAMTERO NUMBER(10) NOT NULL,
	F_FECHA DATE NOT NULL,    -- F_FECHA: Describe la fecha en que se presentan la ultima modificaci�n del pedido del cliente, a partir de esta, se inicia un conteo de horas, en el atributo Q_DURACIONPEDIDO con la cual si se excede el n�mero de horas, el carrito se borar�. 
	Q_DURACIONPEDIDO NUMBER(5,2) NOT NULL,    -- Q_DURACIONPEDIDO: Describe el n�mero de horas que han pasado antes de que un carrito pueda ser eliminado.
	K_IDPEDIDOCLIENTE NUMBER(10) NOT NULL    -- K_IDPEDIDOCLIENTE: Representa la FK generada entre la tabla parametro_pedidocliente con la tabla pedido_cliente.
)
;

CREATE TABLE  pedido_cliente
(
	K_IDPEDIDOCLIENTE NUMBER(10) NOT NULL,    -- Identificador �nico del pedido para un cliente
	F_FECHACREACION DATE NOT NULL,    -- Fecha de creaci�n del pedido del cliente
	F_FECHAMODIFICACION DATE NOT NULL,    -- �ltima fecha en que se modificaron los productos del pedido
	I_ESTADO VARCHAR(20) NOT NULL,    -- Situaci�n en que se encuentra el pedido, si est� enviado, si est� en preparaci�n o si ya se ha entregado
	K_IDDIRECCION NUMBER(10) NOT NULL,    -- Direcci�n de domicilio del cliente
	V_SUBTOTAL NUMBER(10,2) NOT NULL,    -- Costo de los productos del pedido, sin tener en cuenta el costo de env�o, impuestos o descuentos si aplica.
	Q_NUMEROPRODUCTOS NUMBER(3) NOT NULL,    -- Cantidad de productos en el pedido del cliente
	F_FECHAENTREGA DATE NULL,    -- Fecha en que el pedido lleg� al domicilio de cliente
	K_IDCLIENTE NUMBER(8) NOT NULL,    -- Identificador unico del cliente
	V_COSTOENVIO NUMBER(10,2) NULL,    -- Costo adicional de transporte para garantizar la entrega del pedido al domicilio del cliente
	V_VALORTOTAL NUMBER(10,2) NULL,    -- Costo total del pedido, relacionando costo de los productos, impuestos, env�o y descuentos si aplica
	V_IVA NUMBER(10,2) NULL    -- Impuesto de valor agregado
)
;

CREATE TABLE  pedido_proveedor
(
	K_IDPEDIDOPROVEEDOR NUMBER(10) NOT NULL,
	F_FECHA DATE NOT NULL,    -- Fecha en que se solicit� el pedido al proveedor
	K_IDPROVEEDOR NUMBER(10) NOT NULL,    -- Identificdor del proveedor al que se le hizo el pedido
	K_IDCIUDAD NUMBER(10) NOT NULL    -- Identificador de la ciudad donde se solicit� el pedido
)
;

CREATE TABLE  producto
(
	K_IDREFERENCIAUNICA NUMBER(10) NOT NULL,
	N_NOMBRE VARCHAR(50) NOT NULL,    -- Nombre del producto
	N_MARCA VARCHAR(50) NULL,    -- Marca del producto
	K_IDCATEGORIA NUMBER(10) NOT NULL,    -- Identificador de la categor�a a la que pertenece el producto
	N_UNIDADMEDIDA VARCHAR(15) NOT NULL,    -- Nombre de la unidad de medida relacionada con el producto
	L_IMAGEN VARCHAR(50) NULL    -- Direcci�n de enlace que hace referencia a la imagen del producto
)
;

CREATE TABLE  producto_pedidocliente
(
	K_IDPRODUCTOPEDIDOCLIENTE NUMBER(10) NOT NULL,    -- Identificador �nico del registro
	K_IDPEDIDOCLIENTE NUMBER(10) NOT NULL,    -- Identificador del pedido del cliente
	K_IDREFERENCIAUNICA NUMBER(10) NOT NULL,    -- Referencia del producto
	Q_CANTIDAD NUMBER(5,2) NOT NULL,    -- Cantidad del producto
	V_PRECIO NUMBER(10,2) NOT NULL    -- Precio de la cantidad de productos
)
;

CREATE TABLE  producto_pedidoproveedor
(
	K_IDPRODUCTOPEDIDOPROVEEDOR NUMBER(10) NOT NULL,
	Q_CANTIDAD NUMBER(5,2) NOT NULL,    -- Q_CANTIDAD: Describe el n�mero de productos que se le solicitan alos proveedores, se permiten decimales ya que se pueden solicitar elementos de canasta familiar no enteros.
	V_PRECIO NUMBER(15) NOT NULL,    -- V_PRECIO: Describe el precio que tienen los productos solicitados al proveedor.
	K_IDREFERENCIAUNICA NUMBER(10) NOT NULL,    -- K_IDREFERENCIAUNICA: Describe el identificador para la tabla producto, se usa como FK.
	K_IDPEDIDOPROVEEDOR NUMBER(10) NOT NULL    -- K_IDPEDIDOPROVEEDOR: Describe el identificador para la tabla pedido_proveedor, se usa como FK.
)
;

CREATE TABLE  producto_proveedor
(
	K_IDREFERENCIAUNICA NUMBER(10) NOT NULL,    -- Identificador del producto
	K_IDPROVEEDOR NUMBER(10) NOT NULL,    -- Identificador del proveedor
	K_IDCIUDAD NUMBER(10) NOT NULL    -- Identificador de la ciudad
)
;

CREATE TABLE  proveedor
(
	K_IDPROVEEDOR NUMBER(10) NOT NULL,    -- identificador unico del proveedor
	N_NOMBRE VARCHAR(75) NOT NULL,    -- nombre del proveedor
	N_DIRECCION VARCHAR(50) NOT NULL,    -- direccion del proveedor 
	N_CIUDAD VARCHAR(50) NOT NULL    -- ciudad del proveedor, diferencia las direcciones donde puede estar el proveedor
)
;

CREATE TABLE  tarjeta_credito
(
	K_IDTARJETACREDITO NUMBER(10) NOT NULL,    -- Identificador unico de la tarjeta de credito
	F_FECHAVENCIMIENTO DATE NOT NULL,    -- fecha de vencimiento asociada a la tarjeta de credito
	Q_NUMEROTARJETA NUMBER(15) NOT NULL,    -- numero personal de la tarjeta de credito asignado por el banco
	Q_CCV NUMBER(3) NOT NULL,    -- codigo de verificacion de tarjeta 
	N_NOMBREDUENO VARCHAR(100) NOT NULL    -- nombre del due�o asociado a la tarjeta por el banco
)
;

/* Create Primary Keys, Indexes, Uniques, Checks, Triggers */

ALTER TABLE  categoria 
 ADD CONSTRAINT PK_CATEGORIA
	PRIMARY KEY (K_IDCATEGORIA) 
 USING INDEX
;

CREATE INDEX IXFK_CATEGORIA_CATEGORIAPADRE   
 ON  categoria (K_IDCATEGORIAPADRE) 
;

ALTER TABLE  ciudad 
 ADD CONSTRAINT PK_CIUDAD
	PRIMARY KEY (K_IDCIUDAD) 
 USING INDEX
;

ALTER TABLE  cliente 
 ADD CONSTRAINT PK_CLIENTE
	PRIMARY KEY (K_IDCLIENTE) 
 USING INDEX
;

ALTER TABLE  cliente_direccion 
 ADD CONSTRAINT PK_CLIENTE_DIRECCION
	PRIMARY KEY (K_IDCLIENTE,K_IDDIRECCION) 
 USING INDEX
;

CREATE INDEX IXFK_CLIENTEDIRECCION_CLIENTE   
 ON  cliente_direccion (K_IDCLIENTE) 
;

CREATE INDEX IXFK_CLIENTEDIRECCION_DIRECC   
 ON  cliente_direccion (K_IDDIRECCION) 
;

ALTER TABLE  cliente_tarjetacredito 
 ADD CONSTRAINT PK_CLIENTE_TARJETACREDITO
	PRIMARY KEY (K_IDTARJETACREDITO,K_IDCLIENTE) 
 USING INDEX
;

CREATE INDEX IXFK_CLIENTETARJETA_CLIENTE   
 ON  cliente_tarjetacredito (K_IDCLIENTE) 
;

CREATE INDEX IXFK_CLIENTETARJETA_TARJETA   
 ON  cliente_tarjetacredito (K_IDTARJETACREDITO) 
;

ALTER TABLE  costo_envio 
 ADD CONSTRAINT PK_COSTOENVIO
	PRIMARY KEY (K_IDCOSTOENVIO) 
 USING INDEX
;

ALTER TABLE  costo_envio 
 ADD CONSTRAINT CK_VVALOR CHECK (V_VALOR>=0)
;

CREATE INDEX IXFK_COSTOENVIO_CIUDADDESTINO   
 ON  costo_envio (K_IDCIUDADDESTINO) 
;

CREATE INDEX IXFK_COSTOENVIO_CIUDADORIGEN   
 ON  costo_envio (K_IDCIUDADORIGEN) 
;

ALTER TABLE  direccion 
 ADD CONSTRAINT PK_DIRECCION
	PRIMARY KEY (K_IDDIRECCION) 
 USING INDEX
;

CREATE INDEX IXFK_direccion_ciudad   
 ON  direccion (K_IDCIUDAD) 
;

ALTER TABLE  factura 
 ADD CONSTRAINT PK_NUMEROFACTURA
	PRIMARY KEY (K_IDNUMEROFACTURA) 
 USING INDEX
;

CREATE INDEX IXFK_FACTURA_PEDIDOCLIENTE   
 ON  factura (K_IDPEDIDOCLIENTE) 
;

ALTER TABLE  inventario 
 ADD CONSTRAINT PK_Table1
	PRIMARY KEY (K_IDINVENTARIO) 
 USING INDEX
;

CREATE INDEX IXFK_INVENTARIO_CIUDAD   
 ON  inventario (K_IDCIUDAD) 
;

CREATE INDEX IXFK_INVENTARIO_PRODUCTO   
 ON  inventario (K_IDREFERENCIAUNICA) 
;

ALTER TABLE  pago 
 ADD CONSTRAINT PK_PAGO
	PRIMARY KEY (K_IDPAGO) 
 USING INDEX
;

ALTER TABLE  pago 
 ADD CONSTRAINT CK_IESTADOPAGO CHECK (I_ESTADO IN('INICIADO', 'EN PROCESO', 'APROBADO', 'RECHAZADO', 'CANCELADO'))
;

ALTER TABLE  pago 
 ADD CONSTRAINT CK_ITIPOPAGO CHECK (I_TIPO IN ('PSE', 'TARJETA DE CREDITO'))
;

ALTER TABLE  pago 
 ADD CONSTRAINT CK_QVALOR CHECK (Q_VALOR > 0)
;

CREATE INDEX IXFK_PAGO_PEDIDOCLIENTE   
 ON  pago (K_IDPEDIDOCLIENTE) 
;

ALTER TABLE  pago_pse 
 ADD CONSTRAINT PK_PAGOPSE
	PRIMARY KEY (K_IDPAGOPSE) 
 USING INDEX
;

CREATE INDEX IXFK_PAGOPSE_PAGO   
 ON  pago_pse (K_IDPAGO) 
;

ALTER TABLE  pago_tarjetacredito 
 ADD CONSTRAINT PK_PAGOTARJETACREDITO
	PRIMARY KEY (K_IDPAGO,K_IDTARJETACREDITO) 
 USING INDEX
;

CREATE INDEX IXFK_PAGOTARJETA_PAGO   
 ON  pago_tarjetacredito (K_IDPAGO) 
;

CREATE INDEX IXFK_PAGOTARJETA_TARJETA   
 ON  pago_tarjetacredito (K_IDTARJETACREDITO) 
;

ALTER TABLE  parametro_pedidocliente 
 ADD CONSTRAINT PK_PARAMTERO
	PRIMARY KEY (K_IDPARAMTERO) 
 USING INDEX
;

ALTER TABLE  parametro_pedidocliente 
 ADD CONSTRAINT CK_QDURACIONPEDIDO CHECK (Q_DURACIONPEDIDO>0)
;

CREATE INDEX IXFK_PARAMETRO_PEDIDOCLIENTE   
 ON  parametro_pedidocliente (K_IDPEDIDOCLIENTE) 
;

ALTER TABLE  pedido_cliente 
 ADD CONSTRAINT PK_PEDIDOCLIENTE
	PRIMARY KEY (K_IDPEDIDOCLIENTE) 
 USING INDEX
;

CREATE INDEX IXFK_PEDIDOCLIENTE_CLIENTE   
 ON  pedido_cliente (K_IDCLIENTE) 
;

CREATE INDEX IXFK_PEDIDOCLIENTE_DIRECCION   
 ON  pedido_cliente (K_IDDIRECCION) 
;

ALTER TABLE  pedido_proveedor 
 ADD CONSTRAINT PK_PEDIDOPROVEEDOR
	PRIMARY KEY (K_IDPEDIDOPROVEEDOR) 
 USING INDEX
;

CREATE INDEX IXFK_PEDIDOPROVEEDOR_CIUDAD   
 ON  pedido_proveedor (K_IDCIUDAD) 
;

CREATE INDEX IXFK_PEDIDOPROVEEDOR_PROVEEDOR   
 ON  pedido_proveedor (K_IDPROVEEDOR) 
;

ALTER TABLE  producto 
 ADD CONSTRAINT PK_REFERENCIAUNICA
	PRIMARY KEY (K_IDREFERENCIAUNICA) 
 USING INDEX
;

CREATE INDEX IXFK_PRODUCTO_CATEGORIA   
 ON  producto (K_IDCATEGORIA) 
;

ALTER TABLE  producto_pedidocliente 
 ADD CONSTRAINT PK_PRODUCTOPEDIDOCLIENTE
	PRIMARY KEY (K_IDPRODUCTOPEDIDOCLIENTE) 
 USING INDEX
;

CREATE INDEX IXFK_PRODUCPEDCLI_PEDIDOCLI   
 ON  producto_pedidocliente (K_IDPEDIDOCLIENTE) 
;

CREATE INDEX IXFK_PRODUCTOPEDCLI_PRODUCTO   
 ON  producto_pedidocliente (K_IDREFERENCIAUNICA) 
;

ALTER TABLE  producto_pedidoproveedor 
 ADD CONSTRAINT PK_PRODUCTOPEDIDOPROVEEDOR
	PRIMARY KEY (K_IDPRODUCTOPEDIDOPROVEEDOR) 
 USING INDEX
;

ALTER TABLE  producto_pedidoproveedor 
 ADD CONSTRAINT CK_QCANTIDAD CHECK (Q_CANTIDAD>=0 and Q_CANTIDAD<=999.99)
;

ALTER TABLE  producto_pedidoproveedor 
 ADD CONSTRAINT CK_VPRECIO CHECK (V_PRECIO>=0)
;

CREATE INDEX IXFK_PRODUCPEDIDO_PEDIDOPROVE   
 ON  producto_pedidoproveedor (K_IDPEDIDOPROVEEDOR) 
;

CREATE INDEX IXFK_PRODUCTOPEDIDO_PRODUCTO   
 ON  producto_pedidoproveedor (K_IDREFERENCIAUNICA) 
;

ALTER TABLE  producto_proveedor 
 ADD CONSTRAINT PK_PRODUCTOPROVEEDOR
	PRIMARY KEY (K_IDREFERENCIAUNICA,K_IDPROVEEDOR,K_IDCIUDAD) 
 USING INDEX
;

CREATE INDEX IXFK_PRODUCPROVE_PRODUCTO   
 ON  producto_proveedor (K_IDREFERENCIAUNICA) 
;

CREATE INDEX IXFK_PRODUCPROVE_PROVEEDOR   
 ON  producto_proveedor (K_IDPROVEEDOR) 
;

CREATE INDEX IXFK_PRODUCTOPROVEEDOR_CIUDAD   
 ON  producto_proveedor (K_IDCIUDAD) 
;

ALTER TABLE  proveedor 
 ADD CONSTRAINT PK_PROVEEDOR
	PRIMARY KEY (K_IDPROVEEDOR) 
 USING INDEX
;

ALTER TABLE  tarjeta_credito 
 ADD CONSTRAINT PK_TARJETACREDITO
	PRIMARY KEY (K_IDTARJETACREDITO) 
 USING INDEX
;

/* Create Foreign Key Constraints */

ALTER TABLE  categoria 
 ADD CONSTRAINT FK_CATEGORIA_CATEGORIAPADRE
	FOREIGN KEY (K_IDCATEGORIAPADRE) REFERENCES  categoria (K_IDCATEGORIA)
;

ALTER TABLE  cliente_direccion 
 ADD CONSTRAINT FK_CLIENTEDIRECCION_CLIENTE
	FOREIGN KEY (K_IDCLIENTE) REFERENCES  cliente (K_IDCLIENTE)
;

ALTER TABLE  cliente_tarjetacredito 
 ADD CONSTRAINT FK_CLIENTETARJETA_CLIENTE
	FOREIGN KEY (K_IDCLIENTE) REFERENCES  cliente (K_IDCLIENTE)
;

ALTER TABLE  cliente_tarjetacredito 
 ADD CONSTRAINT FK_CLITARJETA_TARJETA
	FOREIGN KEY (K_IDTARJETACREDITO) REFERENCES  tarjeta_credito (K_IDTARJETACREDITO)
;

ALTER TABLE  costo_envio 
 ADD CONSTRAINT FK_COSTOENVIO_CIUDADDESTINO
	FOREIGN KEY (K_IDCIUDADDESTINO) REFERENCES  ciudad (K_IDCIUDAD)
;

ALTER TABLE  costo_envio 
 ADD CONSTRAINT FK_COSTOENVIO_CIUDADORIGEN
	FOREIGN KEY (K_IDCIUDADORIGEN) REFERENCES  ciudad (K_IDCIUDAD)
;

ALTER TABLE  direccion 
 ADD CONSTRAINT FK_direccion_ciudad
	FOREIGN KEY (K_IDCIUDAD) REFERENCES  ciudad (K_IDCIUDAD)
;

ALTER TABLE  factura 
 ADD CONSTRAINT FK_FACTURA_PEDIDOCLIENTE
	FOREIGN KEY (K_IDPEDIDOCLIENTE) REFERENCES  pedido_cliente (K_IDPEDIDOCLIENTE)
;

ALTER TABLE  inventario 
 ADD CONSTRAINT FK_INVENTARIO_CIUDAD
	FOREIGN KEY (K_IDCIUDAD) REFERENCES  ciudad (K_IDCIUDAD)
;

ALTER TABLE  inventario 
 ADD CONSTRAINT FK_INVENTARIO_PRODUCTO
	FOREIGN KEY (K_IDREFERENCIAUNICA) REFERENCES  producto (K_IDREFERENCIAUNICA)
;

ALTER TABLE  pago 
 ADD CONSTRAINT FK_PAGO_PEDIDOCLIENTE
	FOREIGN KEY (K_IDPEDIDOCLIENTE) REFERENCES  pedido_cliente (K_IDPEDIDOCLIENTE)
;

ALTER TABLE  pago_pse 
 ADD CONSTRAINT FK_PAGOPSE_PAGO
	FOREIGN KEY (K_IDPAGO) REFERENCES  pago (K_IDPAGO)
;

ALTER TABLE  pago_tarjetacredito 
 ADD CONSTRAINT FK_PAGOTARJETA_PAGO
	FOREIGN KEY (K_IDPAGO) REFERENCES  pago (K_IDPAGO)
;

ALTER TABLE  pago_tarjetacredito 
 ADD CONSTRAINT FK_PAGOTARJETA_TARJETA
	FOREIGN KEY (K_IDTARJETACREDITO) REFERENCES  tarjeta_credito (K_IDTARJETACREDITO)
;

ALTER TABLE  parametro_pedidocliente 
 ADD CONSTRAINT FK_PARAMETRO_PEDIDOCLIENTE
	FOREIGN KEY (K_IDPEDIDOCLIENTE) REFERENCES  pedido_cliente (K_IDPEDIDOCLIENTE)
;

ALTER TABLE  pedido_cliente 
 ADD CONSTRAINT FK_PEDIDOCLIENTE_CLIENTE
	FOREIGN KEY (K_IDCLIENTE) REFERENCES  cliente (K_IDCLIENTE)
;

ALTER TABLE  pedido_cliente 
 ADD CONSTRAINT FK_PEDIDOCLIENTE_DIRECCION
	FOREIGN KEY (K_IDDIRECCION) REFERENCES  direccion (K_IDDIRECCION)
;

ALTER TABLE  pedido_proveedor 
 ADD CONSTRAINT FK_PEDIDOPROVEEDOR_CIUDAD
	FOREIGN KEY (K_IDCIUDAD) REFERENCES  ciudad (K_IDCIUDAD)
;

ALTER TABLE  pedido_proveedor 
 ADD CONSTRAINT FK_PEDIDOPROVEEDOR_PROVEEDOR
	FOREIGN KEY (K_IDPROVEEDOR) REFERENCES  proveedor (K_IDPROVEEDOR)
;

ALTER TABLE  producto 
 ADD CONSTRAINT FK_PRODUCTO_CATEGORIA
	FOREIGN KEY (K_IDCATEGORIA) REFERENCES  categoria (K_IDCATEGORIA)
;

ALTER TABLE  producto_pedidocliente 
 ADD CONSTRAINT FK_PRODUCPEDCLI_PEDCLI
	FOREIGN KEY (K_IDPEDIDOCLIENTE) REFERENCES  pedido_cliente (K_IDPEDIDOCLIENTE)
;

ALTER TABLE  producto_pedidocliente 
 ADD CONSTRAINT FK_PRODUCTOPEDCLI_PRODUCTO
	FOREIGN KEY (K_IDREFERENCIAUNICA) REFERENCES  producto (K_IDREFERENCIAUNICA)
;

ALTER TABLE  producto_pedidoproveedor 
 ADD CONSTRAINT FK_PRODUCPED_PEDPROVE
	FOREIGN KEY (K_IDPEDIDOPROVEEDOR) REFERENCES  pedido_proveedor (K_IDPEDIDOPROVEEDOR)
;

ALTER TABLE  producto_pedidoproveedor 
 ADD CONSTRAINT FK_PRODUCTOPEDIDO_PRODUCTO
	FOREIGN KEY (K_IDREFERENCIAUNICA) REFERENCES  producto (K_IDREFERENCIAUNICA)
;

ALTER TABLE  producto_proveedor 
 ADD CONSTRAINT FK_PRODUCTOPROVEEDOR_CIUDAD
	FOREIGN KEY (K_IDCIUDAD) REFERENCES  ciudad (K_IDCIUDAD)
;

ALTER TABLE  producto_proveedor 
 ADD CONSTRAINT FK_PRODUCTOPROVEEDOR_PRODUCTO
	FOREIGN KEY (K_IDREFERENCIAUNICA) REFERENCES  producto (K_IDREFERENCIAUNICA)
;

ALTER TABLE  producto_proveedor 
 ADD CONSTRAINT FK_PRODUCTOPROVEEDOR_PROVEEDOR
	FOREIGN KEY (K_IDPROVEEDOR) REFERENCES  proveedor (K_IDPROVEEDOR)
;

/* ------------------------------------------------------------------------- */

ALTER TABLE  producto_pedidocliente 
 ADD CONSTRAINT CK_PRODPEDCLI_QCANTIDAD CHECK (Q_CANTIDAD>0)
;

ALTER TABLE  producto_pedidocliente 
 ADD CONSTRAINT CK_PRODPEDCLI_VPRECIO CHECK (V_PRECIO>0)
;

ALTER TABLE  pedido_cliente 
 ADD CONSTRAINT CK_VSUBTOTAL CHECK (V_SUBTOTAL >= 0)
;

ALTER TABLE  pedido_cliente 
 ADD CONSTRAINT CK_IESTADO CHECK (I_ESTADO IN('INICIADO', 'PAGANDO', 'PAGADO', 'CANCELADO', 'DESPACHANDO', 'ENVIADO'))
;

ALTER TABLE  pedido_cliente 
 ADD CONSTRAINT CK_NUMEROPRODUCTOS CHECK (Q_NUMEROPRODUCTOS >=0)
;

ALTER TABLE  pedido_cliente 
 ADD CONSTRAINT CK_VVALORTOTAL CHECK (V_VALORTOTAL >=0)
;

ALTER TABLE  pedido_cliente 
 ADD CONSTRAINT CK_VCOSTOENVIO CHECK (V_COSTOENVIO >= 0)
;

ALTER TABLE  inventario
 ADD CONSTRAINT CK_VPRECIO_INVENTARIO CHECK (V_PRECIO>0)
;

ALTER TABLE  inventario
 ADD CONSTRAINT CK_QCANTIDAD_INVENTARIO CHECK (Q_CANTIDAD>=0)
;

ALTER TABLE  tarjeta_credito
 ADD CONSTRAINT CK_QNUMEROTARJETA_CREDITO CHECK (Q_NUMEROTARJETA>=0)
;

ALTER TABLE  tarjeta_credito
 ADD CONSTRAINT CK_QCCV_CREDITO CHECK (Q_CCV>=0)
;

ALTER TABLE  direccion
 ADD CONSTRAINT CK_QTELEFONO_DIRECCION CHECK (Q_TELEFONO>=0)
;

/*ALTER TABLE  cliente 
 ADD CONSTRAINT CK_FFECHANACIMIENTO CHECK (F_FECHANACIMIENTO<getdate() AND (YEAR(CURDATE()) - YEAR(F_FECHANACIMIENTO)) >= 18)
;*/

ALTER TABLE  cliente 
 ADD CONSTRAINT CK_IGENERO CHECK (I_GENERO IN('M', 'F'))
; 