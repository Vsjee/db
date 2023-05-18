CREATE DATABASE Parcial;

USE Parcial;

-- tablas y relaciones
CREATE TABLE Cliente (
  dniCif VARCHAR(10) PRIMARY KEY,
  nombreCL VARCHAR(20),
  apellidosCL VARCHAR(30),
  direccionCL VARCHAR(50),
  emailCL VARCHAR(40),
  passCL blob,
  imagenCL VARCHAR(100),
  cpCL VARCHAR(100),
  localidad set("kenedy", "bosa", "usaquen"),
  telefonoCI int
);

CREATE TABLE Factura (
  nFactura INT PRIMARY KEY,
  dniCif VARCHAR(10),
  pago int,
  importe int,
  envio set("expres", "no expres"),
  fecha date,
  FOREIGN KEY (dniCif) REFERENCES Cliente(dniCif)
);

CREATE TABLE Producto (
  idProducto INT PRIMARY KEY,
  dniCif VARCHAR(10),
  nombreProducto varchar(20),
  imagenProducto varchar(100),
  precio int,
  descripcion varchar(200),
  impresion varchar(100),
  acabado set("metalizado", "platico", "perlado"),
  tipoPapel set("rugoso", "liso"),
  tamanoProducto set("pequeño", "mediano", "grande"),
  FOREIGN KEY (dniCif) REFERENCES Cliente(dniCif)
);

CREATE TABLE Diseño (
  idDiseño INT PRIMARY KEY,
  idProducto INT,
  tamanoDiseño set("pequeño", "mediano", "grande"),
  formato varchar(20),
  FOREIGN KEY (idProducto) REFERENCES Producto(idProducto)
);

CREATE TABLE Empleado (
  dniEmpleado VARCHAR(10) PRIMARY KEY,
  nombreEmp varchar(20),
  apellidoEmp varchar(20),
  emailEmp varchar(20),
  passEmp blob,
  direccionEmp varchar(50),
  salario int,
  comision int,
  telefonoEmp int
  
	#FOREIGN KEY (dniEmpleado) REFERENCES Departamento(nombreDepartamento)
);

CREATE TABLE Departamento (
  nombreDepartamento VARCHAR(100) PRIMARY KEY,
  emailDepartamento varchar(50)
);

CREATE TABLE EmpleadoProducto (
  dniEmpleado VARCHAR(10),
  idProducto INT,
  PRIMARY KEY (dniEmpleado, idProducto),
  FOREIGN KEY (dniEmpleado) REFERENCES Empleado(dniEmpleado),
  FOREIGN KEY (idProducto) REFERENCES Producto(idProducto)
);

-- ingreso de registros
INSERT INTO Cliente (dniCif, nombreCL, apellidosCL, direccionCL, emailCL, passCL, imagenCL, cpCL, localidad, telefonoCI)
VALUES
  ('1111111111', 'Ana', 'García', 'Calle Principal 456', 'ana@example.com', aes_encrypt("pass123", "cliente"), 'imagen.jpg', '54321', 'kenedy', 1111111112),
  ('2222222222', 'Luis', 'Martínez', 'Avenida Central 789', 'luis@example.com', aes_encrypt("pass456", "cliente"), 'imagen.jpg', '12345', 'bosa', 2222222222),
  ('3333333333', 'Sofía', 'Rodríguez', 'Carrera 10 123', 'sofia@example.com', aes_encrypt("pass789", "cliente"), 'imagen.jpg', '11111', 'usaquen', 3333333333),
  ('4444444444', 'Pedro', 'López', 'Calle Secundaria 789', 'pedro@example.com', aes_encrypt("pass123", "cliente"), 'imagen.jpg', '54321', 'kenedy', 4444444444),
  ('5555555555', 'María', 'Gómez', 'Avenida Norte 456', 'maria@example.com', aes_encrypt("pass456", "cliente"), 'imagen.jpg', '12345', 'bosa', 5555555555),
  ('6666666666', 'Juan', 'Torres', 'Carrera Este 123', 'juan@example.com', aes_encrypt("pass789", "cliente"), 'imagen.jpg', '11111', 'usaquen', 6666666666),
  ('7777777777', 'Carolina', 'Sánchez', 'Calle Principal 789', 'carolina@example.com', aes_encrypt("pass123", "clienta"), 'imagen.jpg', '54321', 'kenedy', 7777777777),
  ('8888888888', 'Andrés', 'Hernández', 'Avenida Central 123', 'andres@example.com', aes_encrypt("pass456", "clienta"), 'imagen.jpg', '12345', 'bosa', 8888888888),
  ('9999999999', 'Laura', 'Muñoz', 'Carrera 10 789', 'laura@example.com', aes_encrypt("pass789", "clienta"), 'imagen.jpg', '11111', 'usaquen', 9999999999),
  ('0000000000', 'Diego', 'López', 'Calle Secundaria 123', 'diego@example.com', aes_encrypt("pass123", "clienta"), 'imagen.jpg', '54321', 'kenedy', 0000000000);

-- Inserción de registros en la tabla Factura
INSERT INTO Factura (nFactura, dniCif, pago, importe, envio, fecha)
VALUES
  (4, '1111111111', 1, 300, 'expres', '2023-05-04'),
  (5, '1111111111', 0, 400, 'no expres', '2023-05-05'),
  (6, '2222222222', 1, 250, 'expres', '2023-05-06'),
  (7, '2222222222', 0, 350, 'no expres', '2023-05-07'),
  (8, '3333333333', 1, 200, 'expres', '2023-05-08'),
  (9, '3333333333', 0, 300, 'no expres', '2023-05-09'),
  (10, '4444444444', 1, 150, 'expres', '2023-05-10'),
  (11, '4444444444', 0, 250, 'no expres', '2023-05-11'),
  (12, '5555555555', 1, 100, 'expres', '2023-05-12'),
  (13, '5555555555', 0, 200, 'no expres', '2023-05-13');

-- Inserción de registros en la tabla Producto
INSERT INTO Producto (idProducto, dniCif, nombreProducto, imagenProducto, precio, descripcion, impresion, acabado, tipoPapel, tamanoProducto)
VALUES
  (4, '1111111111', 'Producto 1', 'imagen.jpg', 10000, 'Descripción del producto 1', 'Impresión 1', 'metalizado', 'rugoso', 'pequeño'),
  (5, '1111111111', 'Producto 2', 'imagen.jpg', 150321, 'Descripción del producto 2', 'Impresión 2', 'platico', 'liso', 'mediano'),
  (6, '2222222222', 'Producto 3', 'imagen.jpg', 203420, 'Descripción del producto 3', 'Impresión 3', 'perlado', 'rugoso', 'grande'),
  (7, '2222222222', 'Producto 4', 'imagen.jpg', 234150, 'Descripción del producto 4', 'Impresión 4', 'metalizado', 'liso', 'pequeño'),
  (8, '3333333333', 'Producto 5', 'imagen.jpg', 33300, 'Descripción del producto 5', 'Impresión 5', 'platico', 'rugoso', 'mediano'),
  (9, '3333333333', 'Producto 6', 'imagen.jpg', 3250, 'Descripción del producto 6', 'Impresión 6', 'perlado', 'liso', 'grande'),
  (10, '4444444444', 'Producto 7', 'imagen.jpg', 404440, 'Descripción del producto 7', 'Impresión 7', 'metalizado', 'rugoso', 'pequeño'),
  (11, '4444444444', 'Producto 8', 'imagen.jpg', 45021, 'Descripción del producto 8', 'Impresión 8', 'platico', 'liso', 'mediano'),
  (12, '5555555555', 'Producto 9', 'imagen.jpg', 504320, 'Descripción del producto 9', 'Impresión 9', 'perlado', 'rugoso', 'grande'),
  (13, '5555555555', 'Producto 10', 'imagen.jpg', 511450, 'Descripción del producto 10', 'Impresión 10', 'metalizado', 'liso', 'pequeño');

-- Inserción de registros en la tabla Diseño
INSERT INTO Diseño (idDiseño, idProducto, tamanoDiseño, formato)
VALUES
  (4, 4, 'pequeño', 'Formato 1'),
  (5, 5, 'mediano', 'Formato 2'),
  (6, 6, 'grande', 'Formato 3'),
  (7, 7, 'pequeño', 'Formato 4'),
  (8, 8, 'mediano', 'Formato 5'),
  (9, 9, 'grande', 'Formato 6'),
  (10, 10, 'pequeño', 'Formato 7'),
  (11, 11, 'mediano', 'Formato 8'),
  (12, 12, 'grande', 'Formato 9'),
  (13, 13, 'pequeño', 'Formato 10');

-- Inserción de registros en la tabla Empleado
INSERT INTO Empleado (dniEmpleado, nombreEmp, apellidoEmp, emailEmp, passEmp, direccionEmp, salario, comision, telefonoEmp)
VALUES
  ('1111111111', 'Empleado 1', 'Apellido 1', 'empleado1@example.com', aes_encrypt("pass123", "empleado"), 'Calle Principal 123', 10321300, 12300, 1111111111),
  ('2222222222', 'Empleado 2', 'Apellido 2', 'empleado2@example.com', aes_encrypt("pass456", "empleado"), 'Avenida Central 456', 20321300, 212300, 2222222222),
  ('3333333333', 'Empleado 3', 'Apellido 3', 'empleado3@example.com', aes_encrypt("pass789", "empleado"), 'Carrera 10 789', 3132000, 332100, 3333333333),
  ('4444444444', 'Empleado 4', 'Apellido 4', 'empleado4@example.com', aes_encrypt("pass123", "empleado"), 'Calle Secundaria 123', 40313200, 40230, 4444444444),
  ('5555555555', 'Empleado 5', 'Apellido 5', 'empleado5@example.com', aes_encrypt("pass456", "empleado"), 'Avenida Norte 456', 500312310, 5100, 5555555555),
  ('6666666666', 'Empleado 6', 'Apellido 6', 'empleado6@example.com', aes_encrypt("pass789", "empleada"), 'Carrera Este 789', 60132100, 632100, 6666666666),
  ('7777777777', 'Empleado 7', 'Apellido 7', 'empleado7@example.com', aes_encrypt("pass123", "empleada"), 'Calle Principal 789', 71231000, 7010, 7777777777),
  ('8888888888', 'Empleado 8', 'Apellido 8', 'empleado8@example.com', aes_encrypt("pass456", "empleada"), 'Avenida Central 789', 803213100, 800, 8888888888),
  ('9999999999', 'Empleado 9', 'Apellido 9', 'empleado9@example.com', aes_encrypt("pass789", "empleada"), 'Carrera 10 123', 900123120, 23900, 9999999999),
  ('0000000000', 'Empleado 10', 'Apellido 10', 'empleado10@example.com', aes_encrypt("pass123", "empleada"), 'Calle Secundaria 789', 10000, 1000, 0000000000);

-- Inserción de registros en la tabla Departamento
INSERT INTO Departamento (nombreDepartamento, emailDepartamento)
VALUES
  ('Departamento 1', 'departamento1@example.com'),
  ('Departamento 2', 'departamento2@example.com'),
  ('Departamento 3', 'departamento3@example.com'),
  ('Departamento 4', 'departamento4@example.com'),
  ('Departamento 5', 'departamento5@example.com'),
  ('Departamento 6', 'departamento6@example.com'),
  ('Departamento 7', 'departamento7@example.com'),
  ('Departamento 8', 'departamento8@example.com'),
  ('Departamento 9', 'departamento9@example.com'),
  ('Departamento 10', 'departamento10@example.com');

-- Inserción de registros en la tabla EmpleadoProducto
INSERT INTO EmpleadoProducto (dniEmpleado, idProducto)
VALUES
  ('1111111111', 4),
  ('1111111111', 5),
  ('2222222222', 6),
  ('2222222222', 7),
  ('3333333333', 8),
  ('3333333333', 9),
  ('4444444444', 10),
  ('4444444444', 11),
  ('5555555555', 12),
  ('5555555555', 13);
  
  # aes_decrypt(column. key)
  
  -- vistas
CREATE VIEW VistaClientesPendientes AS
SELECT c.dniCif, c.nombreCL, c.apellidosCL, f.nFactura, f.importe
FROM Cliente c
JOIN Factura f ON c.dniCif = f.dniCif
WHERE f.pago = 0;

CREATE VIEW VistaClientesKenedy AS
SELECT dniCif, nombreCL, apellidosCL, direccionCL, localidad
FROM Cliente
WHERE localidad = 'kenedy';

CREATE VIEW VistaProductosPrecioAlto AS
SELECT idProducto, nombreProducto, precio
FROM Producto
WHERE precio > 43400;

-- triggers

#creación tablas de seguridad
CREATE TABLE seguridadEmpleado (
  dniEmpleado VARCHAR(10),
  nombreEmp varchar(20),
  apellidoEmp varchar(20),
  emailEmp varchar(20),
  passEmp blob,
  direccionEmp varchar(50),
  salario int,
  comision int,
  telefonoEmp int,
  accion set("Inserción", "Modificación", "Eliminación"),
  fecha date
);

CREATE TABLE seguridadCliente (
  dniCif VARCHAR(10),
  nombreCL VARCHAR(20),
  apellidosCL VARCHAR(30),
  direccionCL VARCHAR(50),
  emailCL VARCHAR(40),
  passCL blob,
  imagenCL VARCHAR(100),
  cpCL VARCHAR(100),
  localidad set("kenedy", "bosa", "usaquen"),
  telefonoCI int,
  accion set("Inserción", "Modificación", "Eliminación"),
  fecha date
);

CREATE TABLE seguridadProducto(
  idProducto int,
  dniCif VARCHAR(10),
  nombreProducto varchar(20),
  imagenProducto varchar(100),
  precio int,
  descripcion varchar(200),
  impresion varchar(100),
  acabado set("metalizado", "platico", "perlado"),
  tipoPapel set("rugoso", "liso"),
  tamanoProducto set("pequeño", "mediano", "grande"),
  accion set("Inserción", "Modificación", "Eliminación"),
  fecha date
);

#Empleados
DELIMITER @
CREATE TRIGGER InsertarEmpleado
BEFORE INSERT ON Empleado
FOR EACH ROW
BEGIN
    INSERT INTO seguridadEmpleado VALUES (
		  new.dniEmpleado,
		  new.nombreEmp,
		  new.apellidoEmp,
		  new.emailEmp,
		  new.passEmp,
		  new.direccionEmp,
		  new.salario,
		  new.comision,
		  new.telefonoEmp,
		  'Inserción', 
		  curdate()
	);
END;
@
DELIMITER ;

DELIMITER @
CREATE TRIGGER ModificarEmpleado
BEFORE UPDATE ON Empleado
FOR EACH ROW
BEGIN
    INSERT INTO seguridadEmpleado VALUES (
		  new.dniEmpleado,
		  new.nombreEmp,
		  new.apellidoEmp,
		  new.emailEmp,
		  new.passEmp,
		  new.direccionEmp,
		  new.salario,
		  new.comision,
		  new.telefonoEmp,
          'Modificación',
          curdate()
	);
END;
@
DELIMITER ;

DELIMITER @
CREATE TRIGGER EliminarEmpleado
BEFORE DELETE ON Empleado
FOR EACH ROW
BEGIN
    INSERT INTO seguridadEmpleado VALUES (
		  old.dniEmpleado,
		  old.nombreEmp,
		  old.apellidoEmp,
		  old.emailEmp,
		  old.passEmp,
		  old.direccionEmp,
		  old.salario,
		  old.comision,
		  old.telefonoEmp,
          'Eliminación',
          curdate()
	);
END;
@
DELIMITER ;

#Cliente
DELIMITER @
CREATE TRIGGER InsertarCliente
BEFORE INSERT ON Cliente
FOR EACH ROW
BEGIN
    INSERT INTO seguridadCliente VALUES (
      new.dniCif,
	  new.nombreCL,
	  new.apellidosCL,
	  new.direccionCL,
	  new.emailCL,
	  new.passCL,
	  new.imagenCL,
	  new.cpCL,
	  new.localidad,
	  new.telefonoCI,
	  'Inserción',
	  curdate()
  );
END;
@
DELIMITER ;

DELIMITER @
CREATE TRIGGER ModificarCliente
BEFORE UPDATE ON Cliente
FOR EACH ROW
BEGIN
    INSERT INTO seguridadCliente VALUES (
		  new.dniCif,
		  new.nombreCL,
		  new.apellidosCL,
		  new.direccionCL,
		  new.emailCL,
		  new.passCL,
		  new.imagenCL,
		  new.cpCL,
		  new.localidad,
		  new.telefonoCI,
		  'Modificación',
		  curdate()
	);
END;
@
DELIMITER ;

DELIMITER @
CREATE TRIGGER EliminarCliente
BEFORE DELETE ON Cliente
FOR EACH ROW
BEGIN
    INSERT INTO seguridadCliente VALUES (
		  old.dniCif,
		  old.nombreCL,
		  old.apellidosCL,
		  old.direccionCL,
		  old.emailCL,
		  old.passCL,
		  old.imagenCL,
		  old.cpCL,
		  old.localidad,
		  old.telefonoCI,
          'Eliminación', 
          curdate()
	);
END;
@
DELIMITER ;

#Producto
DELIMITER @
CREATE TRIGGER InsertarProducto
BEFORE INSERT ON Producto
FOR EACH ROW
BEGIN
    INSERT INTO seguridadProducto VALUES (
      new.idProducto,
	  new.dniCif,
	  new.nombreProducto,
	  new.imagenProducto,
	  new.precio,
	  new.descripcion,
	  new.impresion,
	  new.acabado,
	  new.tipoPapel,
	  new.tamanoProducto,
	  'Inserción', 
	  curdate()
  );
END;
@
DELIMITER ;

DELIMITER @
CREATE TRIGGER ModificarProducto
BEFORE UPDATE ON Producto
FOR EACH ROW
BEGIN
    INSERT INTO seguridadProducto VALUES (
          new.idProducto,
		  new.dniCif,
		  new.nombreProducto,
		  new.imagenProducto,
		  new.precio,
		  new.descripcion,
		  new.impresion,
		  new.acabado,
		  new.tipoPapel,
		  new.tamanoProducto,
		  'Modificación', 
		  curdate()
	);
END;
@
DELIMITER ;

DELIMITER @
CREATE TRIGGER EliminarProducto
BEFORE DELETE ON Producto
FOR EACH ROW
BEGIN
    INSERT INTO seguridadProducto VALUES (
          old.idProducto,
		  old.dniCif,
		  old.nombreProducto,
		  old.imagenProducto,
		  old.precio,
		  old.descripcion,
		  old.impresion,
		  old.acabado,
		  old.tipoPapel,
		  old.tamanoProducto,
		  'Eliminación', 
		  curdate()
      );
END;
@
DELIMITER ;