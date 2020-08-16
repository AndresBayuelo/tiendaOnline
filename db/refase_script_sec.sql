
/* Sequences */

CREATE SEQUENCE SEQ_categoria_K_IDCATEGORIA 
	INCREMENT BY 1 
	START WITH 1 
	NOMAXVALUE 
	MINVALUE  1 
	NOCYCLE 
	NOCACHE 
	NOORDER
;

CREATE OR REPLACE TRIGGER TRG_categoria_K_IDCATEGORIA 
	BEFORE INSERT 
	ON categoria 
	FOR EACH ROW 
	BEGIN 
		SELECT SEQ_categoria_K_IDCATEGORIA.NEXTVAL 
		INTO :NEW.K_IDCATEGORIA 
		FROM DUAL; 
	END;
/

CREATE SEQUENCE SEQ_ciudad_K_IDCIUDAD 
	INCREMENT BY 1 
	START WITH 1 
	NOMAXVALUE 
	MINVALUE  1 
	NOCYCLE 
	NOCACHE 
	NOORDER
;

CREATE OR REPLACE TRIGGER TRG_ciudad_K_IDCIUDAD 
	BEFORE INSERT 
	ON ciudad 
	FOR EACH ROW 
	BEGIN 
		SELECT SEQ_ciudad_K_IDCIUDAD.NEXTVAL 
		INTO :NEW.K_IDCIUDAD 
		FROM DUAL; 
	END;
/

CREATE SEQUENCE SEQ_cliente_K_IDCLIENTE 
	INCREMENT BY 1 
	START WITH 1 
	NOMAXVALUE 
	MINVALUE  1 
	NOCYCLE 
	NOCACHE 
	NOORDER
;

CREATE OR REPLACE TRIGGER TRG_cliente_K_IDCLIENTE 
	BEFORE INSERT 
	ON cliente 
	FOR EACH ROW 
	BEGIN 
		SELECT SEQ_cliente_K_IDCLIENTE.NEXTVAL 
		INTO :NEW.K_IDCLIENTE 
		FROM DUAL; 
	END;
/

CREATE SEQUENCE SEQ_costo_envio_K_IDCOSTOENVIO 
	INCREMENT BY 1 
	START WITH 1 
	NOMAXVALUE 
	MINVALUE  1 
	NOCYCLE 
	NOCACHE 
	NOORDER
;

CREATE OR REPLACE TRIGGER TRG_costo_envio_K_IDCOSTOENVIO 
	BEFORE INSERT 
	ON costo_envio 
	FOR EACH ROW 
	BEGIN 
		SELECT SEQ_costo_envio_K_IDCOSTOENVIO.NEXTVAL 
		INTO :NEW.K_IDCOSTOENVIO 
		FROM DUAL; 
	END;
/

CREATE SEQUENCE SEQ_direccion_K_IDDIRECCION 
	INCREMENT BY 1 
	START WITH 1 
	NOMAXVALUE 
	MINVALUE  1 
	NOCYCLE 
	NOCACHE 
	NOORDER
;

CREATE OR REPLACE TRIGGER TRG_direccion_K_IDDIRECCION 
	BEFORE INSERT 
	ON direccion 
	FOR EACH ROW 
	BEGIN 
		SELECT SEQ_direccion_K_IDDIRECCION.NEXTVAL 
		INTO :NEW.K_IDDIRECCION 
		FROM DUAL; 
	END;
/


CREATE SEQUENCE SEQ_inventario_K_IDINVENTARIO 
	INCREMENT BY 1 
	START WITH 1 
	NOMAXVALUE 
	MINVALUE  1 
	NOCYCLE 
	NOCACHE 
	NOORDER
;

CREATE OR REPLACE TRIGGER TRG_inventario_K_IDINVENTARIO 
	BEFORE INSERT 
	ON inventario 
	FOR EACH ROW 
	BEGIN 
		SELECT SEQ_inventario_K_IDINVENTARIO.NEXTVAL 
		INTO :NEW.K_IDINVENTARIO 
		FROM DUAL; 
	END;
/

CREATE SEQUENCE SEQ_pago_K_IDPAGO 
	INCREMENT BY 1 
	START WITH 1 
	NOMAXVALUE 
	MINVALUE  1 
	NOCYCLE 
	NOCACHE 
	NOORDER
;

CREATE OR REPLACE TRIGGER TRG_pago_K_IDPAGO 
	BEFORE INSERT 
	ON pago 
	FOR EACH ROW 
	BEGIN 
		SELECT SEQ_pago_K_IDPAGO.NEXTVAL 
		INTO :NEW.K_IDPAGO 
		FROM DUAL; 
	END;
/

CREATE SEQUENCE SEQ_pago_pse_K_IDPAGOPSE 
	INCREMENT BY 1 
	START WITH 1 
	NOMAXVALUE 
	MINVALUE  1 
	NOCYCLE 
	NOCACHE 
	NOORDER
;

CREATE OR REPLACE TRIGGER TRG_pago_pse_K_IDPAGOPSE 
	BEFORE INSERT 
	ON pago_pse 
	FOR EACH ROW 
	BEGIN 
		SELECT SEQ_pago_pse_K_IDPAGOPSE.NEXTVAL 
		INTO :NEW.K_IDPAGOPSE 
		FROM DUAL; 
	END;
/

CREATE SEQUENCE SEQ_parametro_K_IDPARAMTERO 
	INCREMENT BY 1 
	START WITH 1 
	NOMAXVALUE 
	MINVALUE  1 
	NOCYCLE 
	NOCACHE 
	NOORDER
;

CREATE OR REPLACE TRIGGER TRG_parametro_K_IDPARAMTERO 
	BEFORE INSERT 
	ON parametro 
	FOR EACH ROW 
	BEGIN 
		SELECT SEQ_parametro_K_IDPARAMTERO.NEXTVAL 
		INTO :NEW.K_IDPARAMTERO 
		FROM DUAL; 
	END;
/

CREATE SEQUENCE SEQ_ped_cli_KIDPEDIDOCLIENTE 
	INCREMENT BY 1 
	START WITH 1 
	NOMAXVALUE 
	MINVALUE  1 
	NOCYCLE 
	NOCACHE 
	NOORDER
;

CREATE OR REPLACE TRIGGER TRG_ped_cli_KIDPEDIDOCLIENTE 
	BEFORE INSERT 
	ON pedido_cliente 
	FOR EACH ROW 
	BEGIN 
		SELECT SEQ_ped_cli_KIDPEDIDOCLIENTE.NEXTVAL 
		INTO :NEW.K_IDPEDIDOCLIENTE 
		FROM DUAL; 
	END;
/

CREATE SEQUENCE SEQ_prod_KIDREFUNICA 
	INCREMENT BY 1 
	START WITH 1 
	NOMAXVALUE 
	MINVALUE  1 
	NOCYCLE 
	NOCACHE 
	NOORDER
;

CREATE OR REPLACE TRIGGER TRG_prod_KIDREFUNICA 
	BEFORE INSERT 
	ON producto 
	FOR EACH ROW 
	BEGIN 
		SELECT SEQ_prod_KIDREFUNICA.NEXTVAL 
		INTO :NEW.K_IDREFERENCIAUNICA 
		FROM DUAL; 
	END;
/

CREATE SEQUENCE SEQ_prod_pedcli_KIDPRODPEDCLI 
	INCREMENT BY 1 
	START WITH 1 
	NOMAXVALUE 
	MINVALUE  1 
	NOCYCLE 
	NOCACHE 
	NOORDER
;

CREATE OR REPLACE TRIGGER TRG_prod_pedcli_KIDPRODPEDCLI 
	BEFORE INSERT 
	ON producto_pedidocliente 
	FOR EACH ROW 
	BEGIN 
		SELECT SEQ_prod_pedcli_KIDPRODPEDCLI.NEXTVAL 
		INTO :NEW.K_IDPRODUCTOPEDIDOCLIENTE 
		FROM DUAL; 
	END;
/

CREATE SEQUENCE SEQ_proveedor_K_IDPROVEEDOR 
	INCREMENT BY 1 
	START WITH 1 
	NOMAXVALUE 
	MINVALUE  1 
	NOCYCLE 
	NOCACHE 
	NOORDER
;

CREATE OR REPLACE TRIGGER TRG_proveedor_K_IDPROVEEDOR 
	BEFORE INSERT 
	ON proveedor 
	FOR EACH ROW 
	BEGIN 
		SELECT SEQ_proveedor_K_IDPROVEEDOR.NEXTVAL 
		INTO :NEW.K_IDPROVEEDOR 
		FROM DUAL; 
	END;
/

CREATE SEQUENCE SEQ_tar_cred_KIDTARJETACREDITO 
	INCREMENT BY 1 
	START WITH 1 
	NOMAXVALUE 
	MINVALUE  1 
	NOCYCLE 
	NOCACHE 
	NOORDER
;

CREATE OR REPLACE TRIGGER TRG_tar_cred_KIDTARJETACREDITO 
	BEFORE INSERT 
	ON tarjeta_credito 
	FOR EACH ROW 
	BEGIN 
		SELECT SEQ_tar_cred_KIDTARJETACREDITO.NEXTVAL 
		INTO :NEW.K_IDTARJETACREDITO 
		FROM DUAL; 
	END;
/