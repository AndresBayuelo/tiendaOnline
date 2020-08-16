---Inserciones para categoria
insert into categoria(N_NOMBRE) values('Entretenimiento');
insert into categoria(N_NOMBRE) values('Hogar');
insert into categoria(N_NOMBRE) values('Mercado');
insert into categoria(N_NOMBRE,K_IDCATEGORIAPADRE) values('Musica',1);
insert into categoria(N_NOMBRE,K_IDCATEGORIAPADRE) values('Libros',1);
insert into categoria(N_NOMBRE,K_IDCATEGORIAPADRE) values('Juegos',1);
insert into categoria(N_NOMBRE,K_IDCATEGORIAPADRE) values('Electrodomesticos',2);
insert into categoria(N_NOMBRE,K_IDCATEGORIAPADRE) values('Muebles',2);
insert into categoria(N_NOMBRE,K_IDCATEGORIAPADRE) values('Lenceria',2);
insert into categoria(N_NOMBRE,K_IDCATEGORIAPADRE) values('Frutas',3);
insert into categoria(N_NOMBRE,K_IDCATEGORIAPADRE) values('Verduras',3);
insert into categoria(N_NOMBRE,K_IDCATEGORIAPADRE) values('Lacteos',3);
insert into categoria(N_NOMBRE,K_IDCATEGORIAPADRE) values('Mascotas',3);
COMMIT;

---Inserciones para Productos
insert into producto(N_NOMBRE,N_MARCA,K_IDCATEGORIA,N_UNIDADMEDIDA,L_IMAGEN) values('Guitarra','Gibson',4,'Unidad','https://url2.cl/hPdCb');
insert into producto(N_NOMBRE,N_MARCA,K_IDCATEGORIA,N_UNIDADMEDIDA,L_IMAGEN) values('Lorem Ipsum','Planeta',5,'Unidad','https://url2.cl/Clp3u');
insert into producto(N_NOMBRE,N_MARCA,K_IDCATEGORIA,N_UNIDADMEDIDA,L_IMAGEN) values('Super Mario','Nintendo',6,'Unidad','https://url2.cl/GLhxt');
insert into producto(N_NOMBRE,N_MARCA,K_IDCATEGORIA,N_UNIDADMEDIDA,L_IMAGEN) values('Nevera','LG',7,'Unidad','https://url2.cl/RKJfa');
insert into producto(N_NOMBRE,N_MARCA,K_IDCATEGORIA,N_UNIDADMEDIDA,L_IMAGEN) values('Mesa','Duna',8,'Unidad','https://url2.cl/xz4Ti');
insert into producto(N_NOMBRE,N_MARCA,K_IDCATEGORIA,N_UNIDADMEDIDA,L_IMAGEN) values('Sujetador','Leonisa',9,'Unidad','https://url2.cl/l6rQX');
insert into producto(N_NOMBRE,N_MARCA,K_IDCATEGORIA,N_UNIDADMEDIDA,L_IMAGEN) values('Durazno','Los Viotunos',10,'Kilo','https://url2.cl/bsBei');
insert into producto(N_NOMBRE,N_MARCA,K_IDCATEGORIA,N_UNIDADMEDIDA,L_IMAGEN) values('Cebolla','Jorge Rivas SAS',11,'Kilo','https://url2.cl/p2RUD');
insert into producto(N_NOMBRE,N_MARCA,K_IDCATEGORIA,N_UNIDADMEDIDA,L_IMAGEN) values('Queso','Manchego',12,'Libra','https://url2.cl/baSzA');
insert into producto(N_NOMBRE,N_MARCA,K_IDCATEGORIA,N_UNIDADMEDIDA,L_IMAGEN) values('Comida Perro','Dog Chow',13,'Libra','https://url2.cl/X6xLH');
COMMIT;

---Inserciones para Ciudades
insert into ciudad(N_NOMBRE) values('Bogota');
insert into ciudad(N_NOMBRE) values('Cali');
insert into ciudad(N_NOMBRE) values('Barranquilla');
insert into ciudad(N_NOMBRE) values('Medellin');
insert into ciudad(N_NOMBRE) values('Cartagena');
COMMIT;

--inserciones inventario
insert into INVENTARIO(V_PRECIO, Q_CANTIDAD,K_IDREFERENCIAUNICA,K_IDCIUDAD) values(1700000,18,4,1); --nevera
insert into INVENTARIO(V_PRECIO, Q_CANTIDAD,K_IDREFERENCIAUNICA,K_IDCIUDAD) values(1850000,25,4,2);
insert into INVENTARIO(V_PRECIO, Q_CANTIDAD,K_IDREFERENCIAUNICA,K_IDCIUDAD) values(150000,4,4,3);
 
insert into INVENTARIO(V_PRECIO, Q_CANTIDAD,K_IDREFERENCIAUNICA,K_IDCIUDAD) values(4200,120,9,1);--queso
insert into INVENTARIO(V_PRECIO, Q_CANTIDAD,K_IDREFERENCIAUNICA,K_IDCIUDAD) values(4800,96,9,2);
 
insert into INVENTARIO(V_PRECIO, Q_CANTIDAD,K_IDREFERENCIAUNICA,K_IDCIUDAD) values(550000,10,5,1);--mesa
insert into INVENTARIO(V_PRECIO, Q_CANTIDAD,K_IDREFERENCIAUNICA,K_IDCIUDAD) values(620000,45,5,2);
insert into INVENTARIO(V_PRECIO, Q_CANTIDAD,K_IDREFERENCIAUNICA,K_IDCIUDAD) values(520000,4,5,3);
 
insert into INVENTARIO(V_PRECIO, Q_CANTIDAD,K_IDREFERENCIAUNICA,K_IDCIUDAD) values(25000,145,6,2);--sujetador
insert into INVENTARIO(V_PRECIO, Q_CANTIDAD,K_IDREFERENCIAUNICA,K_IDCIUDAD) values(18000,120,6,3);
 
insert into INVENTARIO(V_PRECIO, Q_CANTIDAD,K_IDREFERENCIAUNICA,K_IDCIUDAD) values(1200,480,7,1);--durazno
insert into INVENTARIO(V_PRECIO, Q_CANTIDAD,K_IDREFERENCIAUNICA,K_IDCIUDAD) values(800,532,7,3);
 
insert into INVENTARIO(V_PRECIO, Q_CANTIDAD,K_IDREFERENCIAUNICA,K_IDCIUDAD) values(400,295,8,1);--cebolla
insert into INVENTARIO(V_PRECIO, Q_CANTIDAD,K_IDREFERENCIAUNICA,K_IDCIUDAD) values(450,245,8,2);
insert into INVENTARIO(V_PRECIO, Q_CANTIDAD,K_IDREFERENCIAUNICA,K_IDCIUDAD) values(500,212,8,3);
COMMIT;

