CONNECT sys/Server_252@//localhost:1521/XE as sysdba;

CREATE TABLESPACE rfsdef DATAFILE '/u01/app/oracle/oradata/XE/rfsdef.dbf' SIZE 2m AUTOEXTEND ON; -- verificar directorio creacion tablespace
CREATE TEMPORARY TABLESPACE rfstmp TEMPFILE '/u01/app/oracle/oradata/XE/rfstmp.dbf' SIZE 2m AUTOEXTEND ON; -- verificar directorio creacion tablespace

CREATE USER dbarfs IDENTIFIED BY secreta -- usuario dba
DEFAULT TABLESPACE rfsdef
TEMPORARY TABLESPACE rfstmp
QUOTA 2m ON rfsdef;

GRANT CONNECT TO dbarfs; -- asignando privilegios para conectarse
GRANT RESOURCE TO dbarfs; -- asignando privilegios resource
GRANT CREATE PUBLIC SYNONYM TO dbarfs; -- asignando privilegios para crear sinonimos
GRANT CREATE USER TO dbarfs; -- asignando privilegios para crear usuarios
GRANT CREATE ROLE TO dbarfs; -- asignando privilegios para crear roles
GRANT DROP USER TO dbarfs;  -- asignando privilegios para borrar usuarios
GRANT DROP ANY ROLE TO dbarfs; -- asignando privilegios para borrar roles
GRANT GRANT ANY ROLE TO dbarfs; -- privilegio para otorgar roles
GRANT DROP ANY SYNONYM TO dbarfs; -- privilegio para borrar sinonimos
GRANT DROP PUBLIC SYNONYM TO dbarfs; -- privilegio para borrar sinonimos publicos
/* privilegios para consultar informacion de roles */
GRANT SELECT ON DBA_ROLES TO dbarfs;
GRANT SELECT ON DBA_ROLE_PRIVS TO dbarfs;
GRANT SELECT ON DBA_SYS_PRIVS TO dbarfs;
GRANT SELECT ON DBA_TAB_PRIVS TO dbarfs;
GRANT SELECT ON ROLE_ROLE_PRIVS TO dbarfs;
GRANT SELECT ON ROLE_SYS_PRIVS TO dbarfs;
GRANT SELECT ON ROLE_TAB_PRIVS TO dbarfs; 

CREATE USER admusrrfs IDENTIFIED BY secreta -- usuario para crear clientes (admin users rfs)
DEFAULT TABLESPACE rfsdef
TEMPORARY TABLESPACE rfstmp
QUOTA 2m ON rfsdef;

GRANT GRANT ANY ROLE TO admusrrfs; -- privilegio para otorgar roles
GRANT CREATE USER TO admusrrfs; -- privilegio para crear usuarios
GRANT DROP USER TO admusrrfs;  --  privilegio para borrar usuarios

CONNECT dbarfs/secreta@//localhost:1521/XE;

-- cargar script base de datos (refase_script, refase_script_doc)
-- cargar script secuencias
-- cargar script sinonimos

GRANT CONNECT TO admusrrfs; -- privilegio para conectarse
GRANT INSERT ON cli TO admusrrfs; -- privilegio para insertar en la tabla clientes

CREATE ROLE admrfs; -- rol para administrador de la tienda
GRANT CONNECT TO admrfs; -- privilegio para conectarse
/* privilegios de consulta */
GRANT SELECT ON cli TO admrfs;
GRANT SELECT ON ctg TO admrfs;
GRANT SELECT ON ciu TO admrfs;
GRANT SELECT ON clidir TO admrfs;
GRANT SELECT ON clitar TO admrfs;
GRANT SELECT ON costoe TO admrfs;
GRANT SELECT ON dir TO admrfs;
GRANT SELECT ON fac TO admrfs;
GRANT SELECT ON inv TO admrfs;
GRANT SELECT ON pg TO admrfs;
GRANT SELECT ON pgpse TO admrfs;
GRANT SELECT ON pgtar TO admrfs;
GRANT SELECT ON prmpcli TO admrfs;
GRANT SELECT ON pcli TO admrfs;
GRANT SELECT ON pprov TO admrfs;
GRANT SELECT ON prod TO admrfs;
GRANT SELECT ON prodpcli TO admrfs;
GRANT SELECT ON prodpprov TO admrfs; 
GRANT SELECT ON prodprov TO admrfs;
GRANT SELECT ON prov TO admrfs;
GRANT SELECT ON tar TO admrfs; 
/* privilegios de insercion */
GRANT INSERT ON ctg TO admrfs;
GRANT INSERT ON ciu TO admrfs;
GRANT INSERT ON costoe TO admrfs;
GRANT INSERT ON inv TO admrfs;
GRANT INSERT ON prmpcli TO admrfs;
GRANT INSERT ON pprov TO admrfs;
GRANT INSERT ON prod TO admrfs;
GRANT INSERT ON prodpprov TO admrfs;
GRANT INSERT ON prodprov TO admrfs;
GRANT INSERT ON prov TO admrfs;
/* privilegios de actualizacion */
GRANT UPDATE ON ctg TO admrfs;
GRANT UPDATE ON ciu TO admrfs;
GRANT UPDATE ON costoe TO admrfs;
GRANT UPDATE ON inv TO admrfs;
GRANT UPDATE ON pg TO admrfs;
GRANT UPDATE ON prmpcli TO admrfs;
GRANT UPDATE ON pcli TO admrfs;
GRANT UPDATE ON pprov TO admrfs;
GRANT UPDATE ON prod TO admrfs;
GRANT UPDATE ON prodpprov TO admrfs;
GRANT UPDATE ON prodprov TO admrfs;
GRANT UPDATE ON prov TO admrfs;
/* privilegios de eliminacion */
GRANT DELETE ON ctg TO admrfs;
GRANT DELETE ON ciu TO admrfs;
GRANT DELETE ON costoe TO admrfs;
GRANT DELETE ON prmpcli TO admrfs;
GRANT DELETE ON prod TO admrfs;
GRANT DELETE ON prodprov TO admrfs;
GRANT DELETE ON prov TO admrfs;

CREATE USER useradmrfs IDENTIFIED BY secreta -- usuario administrador de la tienda
DEFAULT TABLESPACE rfsdef
TEMPORARY TABLESPACE rfstmp
QUOTA 2m ON rfsdef;

GRANT admrfs TO useradmrfs; -- asignando el rol admrfs al usuario useradmrfs

CREATE ROLE clirrfs; -- rol para los clientes (cliente registrado)
GRANT CONNECT TO clirrfs; -- privilegio para conectarse
/* privilegios de consulta */
GRANT SELECT ON cli TO clirrfs;
GRANT SELECT ON clidir TO clirrfs;
GRANT SELECT ON ctg TO clirrfs;
GRANT SELECT ON ciu TO clirrfs;
GRANT SELECT ON clidir TO clirrfs;
GRANT SELECT ON clitar TO clirrfs;
GRANT SELECT ON costoe TO clirrfs;
GRANT SELECT ON dir TO clirrfs;
GRANT SELECT ON fac TO clirrfs;
GRANT SELECT ON inv TO clirrfs;
GRANT SELECT ON pg TO clirrfs;
GRANT SELECT ON pgpse TO clirrfs;
GRANT SELECT ON pgtar TO clirrfs;
GRANT SELECT ON prmpcli TO clirrfs;
GRANT SELECT ON pcli TO clirrfs;
GRANT SELECT ON prod TO clirrfs;
GRANT SELECT ON prodpcli TO clirrfs;
GRANT SELECT ON tar TO clirrfs;
/* privilegios de insercion */
GRANT INSERT ON clidir TO clirrfs;
GRANT INSERT ON clitar TO clirrfs;
GRANT INSERT ON dir TO clirrfs;
GRANT INSERT ON fac TO clirrfs;
GRANT INSERT ON pg TO clirrfs;
GRANT INSERT ON pgpse TO clirrfs;
GRANT INSERT ON pgtar TO clirrfs;
GRANT INSERT ON pcli TO clirrfs;
GRANT INSERT ON prodpcli TO clirrfs;
GRANT INSERT ON tar TO clirrfs;
/* privilegios de actualizacion */
GRANT UPDATE ON cli TO clirrfs;
GRANT UPDATE ON clidir TO clirrfs;
GRANT UPDATE ON clitar TO clirrfs;
GRANT UPDATE ON dir TO clirrfs;
GRANT UPDATE ON inv TO clirrfs;
GRANT UPDATE ON pg TO clirrfs;
GRANT UPDATE ON pgpse TO clirrfs;
GRANT UPDATE ON pgtar TO clirrfs;
GRANT UPDATE ON prmpcli TO clirrfs;
GRANT UPDATE ON pcli TO clirrfs;
GRANT UPDATE ON prodpcli TO clirrfs; -- pendiente de borrar
GRANT UPDATE ON tar TO clirrfs;
/* privilegios de eliminacion */
GRANT DELETE ON prodpcli TO clirrfs;
GRANT DELETE ON clidir TO clirrfs;
GRANT DELETE ON clitar TO clirrfs;
GRANT DELETE ON dir TO clirrfs;

CREATE ROLE clisrrfs; -- rol para los clientes sin registrar (cliente sin registrar)
GRANT CONNECT TO clisrrfs; -- privilegio para conectarse
/* privilegios de consulta */
GRANT SELECT ON ctg TO clisrrfs;
GRANT SELECT ON ciu TO clisrrfs;
GRANT SELECT ON costoe TO clisrrfs;
GRANT SELECT ON inv TO clisrrfs;
GRANT SELECT ON prod TO clisrrfs;

CREATE USER userclisrrfs IDENTIFIED BY secreta -- usuario para cliente sin registrar
DEFAULT TABLESPACE rfsdef
TEMPORARY TABLESPACE rfstmp
QUOTA 2m ON rfsdef;

GRANT clisrrfs TO userclisrrfs; -- asignando el rol clisrrfs al usuario useradmrfs

SELECT * FROM DBA_ROLES; -- muestra los roles
SELECT * FROM DBA_ROLE_PRIVS; -- usuarios y roles otorgados
SELECT * FROM DBA_SYS_PRIVS; -- usuarios y privilegios de sistema otorgados
SELECT * FROM DBA_TAB_PRIVS; -- usuarios y privilegios sobre objetos
SELECT * FROM ROLE_ROLE_PRIVS; -- roles y roles otrorgados
SELECT * FROM ROLE_SYS_PRIVS; -- roles y privilegios de sistema otorgados
SELECT * FROM ROLE_TAB_PRIVS; -- roles y privilegios sobre objetos
