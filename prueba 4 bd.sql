--Consultar tablas enteras
SELECT * from credenciales;
SELECT * from cliente;
SELECT * from vendedor;
SELECT * from pedido;
SELECT * from prenda;
SELECT * from servicio;
SELECT * from pagos;
SELECT * from sucursales;

-- El boton rojo que destruye el mundo
DROP TABLE Prenda CASCADE CONSTRAINTS;
DROP TABLE Pagos CASCADE CONSTRAINTS;
DROP TABLE Pedido CASCADE CONSTRAINTS;
DROP TABLE Cliente CASCADE CONSTRAINTS;
DROP TABLE Vendedor CASCADE CONSTRAINTS;
DROP TABLE Servicio CASCADE CONSTRAINTS;
DROP TABLE Sucursales CASCADE CONSTRAINTS;
DROP TABLE credenciales CASCADE CONSTRAINTS;

--Creación de las tablas del Modelo de Datos --
--Tabla Credenciales
CREATE TABLE credenciales (
	id_usuario VARCHAR2(50),
	rut_usuario VARCHAR2(50),
	password_usuario VARCHAR2(50)
);

--Tabla Cliente
CREATE TABLE Cliente (
  id_cliente INT,
  id_usuario VARCHAR2(30),
  RUT_cliente VARCHAR2(12),
  nombre_cliente VARCHAR2(30),
  apellido_cliente VARCHAR2(30),
  direccion_cliente VARCHAR2(60),
  telefono_cliente VARCHAR2(15),
  email_cliente VARCHAR2(30)
);

--Tabla Vendedor
CREATE TABLE Vendedor (
  id_vendedor INT,
  id_usuario VARCHAR2(30),
  RUT_vendedor VARCHAR2(12),
  nombre_vendedor VARCHAR2(30),
  apellido_vendedor VARCHAR2(30),
  puesto_vendedor VARCHAR2(20),
  telefono_vendedor VARCHAR2(15)
);


--Tabla Pedido
CREATE TABLE Pedido (
  id_pedido INT,
  id_cliente INT,
  id_vendedor INT,
  id_sucursal INT,
  fecha_recepcion DATE,
  fecha_entrega DATE,
  estado VARCHAR2(20),
  total NUMBER
);

--Tabla Prenda
CREATE TABLE Prenda (
  id_prenda INT,
  id_pedido INT,
  id_servicio INT,
  tipo_prenda VARCHAR2(30),
  color VARCHAR2(20)
);

--Tabla Servicio
CREATE TABLE Servicio (
  id_servicio INT,
  nombre_servicio VARCHAR2(30),
  precio NUMBER
);

--Tabla Pagos
CREATE TABLE Pagos (
  id_pagos INT,
  id_pedido INT,
  monto_total NUMBER,
  metodo_pago VARCHAR2(50),
  fecha_pago DATE
);

--Tabla Sucursales
CREATE TABLE Sucursales (
  id_sucursal INT,
  id_vendedor INT,
  nombre_sucursal VARCHAR2(30),
  direccion_sucursal VARCHAR2(60),
  telefono_sucursal VARCHAR2(15)
);

-- Realice la creación de llaves primarias y llaves foráneas del Modelo de Datos --
-- Creacion de PK para cada tabla
ALTER TABLE Cliente
ADD CONSTRAINT pk_cliente PRIMARY KEY (id_cliente);

ALTER TABLE Vendedor
ADD CONSTRAINT pk_vendedor PRIMARY KEY (id_vendedor);

ALTER TABLE Pedido
ADD CONSTRAINT pk_pedido PRIMARY KEY (id_pedido);

ALTER TABLE Prenda
ADD CONSTRAINT pk_prenda PRIMARY KEY (id_prenda);

ALTER TABLE Servicio
ADD CONSTRAINT pk_servicio PRIMARY KEY (id_servicio);

ALTER TABLE Pagos
ADD CONSTRAINT pk_pagos PRIMARY KEY (id_pagos);

ALTER TABLE Sucursales
ADD CONSTRAINT pk_sucursal PRIMARY KEY (id_sucursal);

ALTER TABLE Credenciales
ADD CONSTRAINT pk_credenciales PRIMARY KEY (id_usuario);

--Creacion FK
ALTER TABLE Pedido
ADD CONSTRAINT fk_pedido_cliente FOREIGN KEY (id_cliente)
REFERENCES Cliente (id_cliente);

ALTER TABLE Pedido
ADD CONSTRAINT fk_pedido_vendedor FOREIGN KEY (id_vendedor)
REFERENCES Vendedor (id_vendedor);

ALTER TABLE Pedido
ADD CONSTRAINT fk_pedido_sucursal FOREIGN KEY (id_sucursal)
REFERENCES Sucursales (id_sucursal);

ALTER TABLE Prenda
ADD CONSTRAINT fk_prenda_pedido FOREIGN KEY (id_pedido)
REFERENCES Pedido (id_pedido);

ALTER TABLE Prenda
ADD CONSTRAINT fk_prenda_servicio FOREIGN KEY (id_servicio)
REFERENCES Servicio (id_servicio);

ALTER TABLE Pagos
ADD CONSTRAINT fk_pagos_pedido FOREIGN KEY (id_pedido)
REFERENCES Pedido (id_pedido);

ALTER TABLE Cliente
ADD CONSTRAINT fk_cliente_usuario FOREIGN KEY (id_usuario)
REFERENCES Credenciales (id_usuario);

ALTER TABLE Vendedor
ADD CONSTRAINT fk_vendedor_usuario FOREIGN KEY (id_usuario)
REFERENCES Credenciales (id_usuario);

ALTER TABLE Sucursales
ADD CONSTRAINT fk_sucursal_vendedor FOREIGN KEY (id_vendedor)
REFERENCES Vendedor (id_vendedor);

--Ingreso de mínimo 5 registros de datos en cada una de las tablas --
--SE DEBEN INSERTAR ESTOS DATOS ANTES QUE CUALQUIER OTRO DE OTRAS TABLAS (ID CLIENTES Y ID VENDEDORES)
-- ID que corresponden a CLIENTES
insert into credenciales (id_usuario, rut_usuario, password_usuario) values 
('Cameron', '18567384-2', 'mJ1?H(Dt`i');

insert into credenciales (id_usuario, rut_usuario, password_usuario) values 
('Wuako', '20765432-5', 'qU3<D5j7yaF7l<}');

insert into credenciales (id_usuario, rut_usuario, password_usuario) values 
('Coral', '16789234-1', 'lN9@kvcU%');

insert into credenciales (id_usuario, rut_usuario, password_usuario) values 
('Jasmina', '19856342-0', 'qS4?UaGAK''RU');

insert into credenciales (id_usuario, rut_usuario, password_usuario) values 
('Nara', '21658743-6', 'mP4%#De,,Sj');

-- ID que corresponden a VENDEDORES  
insert into credenciales (id_usuario, rut_usuario, password_usuario) values 
('VendeUno', '12345678-9', 'xJ2@<*MG}XU?o');

insert into credenciales (id_usuario, rut_usuario, password_usuario) values 
('VendeDos', '23456789-0', 'aA0`duyv');

insert into credenciales (id_usuario, rut_usuario, password_usuario) values 
('VendeTres', '34567890-1', 'tW0''g`<8IXD');

insert into credenciales (id_usuario, rut_usuario, password_usuario) values 
('VendeCuat', '87654321-2', 'hR8`bh?IL.Xc~@');

insert into credenciales (id_usuario, rut_usuario, password_usuario) values 
('VendeCin', '45678901-2', 'hZ1{6Klj/arfG0');

--Registro Clientes
INSERT INTO Cliente (id_cliente, id_usuario, RUT_cliente, nombre_cliente, apellido_cliente, direccion_cliente, telefono_cliente, email_cliente) VALUES 
(1, 'Cameron', '18567384-2', 'Javier', 'Gonzalez', 'Alameda, Santiago', '987654321', 'javier.gonzalez@mail.cl');

INSERT INTO Cliente (id_cliente, id_usuario, RUT_cliente, nombre_cliente, apellido_cliente, direccion_cliente, telefono_cliente, email_cliente) VALUES 
(2, 'Wuako', '20765432-5', 'Fernanda', 'Lopez', 'Providencia, Santiago', '912345678', 'fernanda.lopez@mail.cl');

INSERT INTO Cliente (id_cliente, id_usuario, RUT_cliente, nombre_cliente, apellido_cliente, direccion_cliente, telefono_cliente, email_cliente) VALUES 
(3, 'Coral', '16789234-1', 'Carlos', 'Ferrer', 'Nunoa, Santiago', '923456789', 'carlos.ferrer@mail.cl');

INSERT INTO Cliente (id_cliente, id_usuario, RUT_cliente, nombre_cliente, apellido_cliente, direccion_cliente, telefono_cliente, email_cliente) VALUES 
(4, 'Jasmina', '19856342-0', 'Lucia', 'Martinez', 'Las Condes, Santiago', '934567890', 'lucia.martinez@mail.cl');

INSERT INTO Cliente (id_cliente, id_usuario, RUT_cliente, nombre_cliente, apellido_cliente, direccion_cliente, telefono_cliente, email_cliente) VALUES 
(5, 'Nara', '21658743-6', 'Marcela', 'Perez', 'La Florida, Santiago', '945678901', 'marcela.perez@mail.cl');

--Registro Vendedores
INSERT INTO Vendedor (id_vendedor, id_usuario, RUT_vendedor, nombre_vendedor, apellido_vendedor, puesto_vendedor, telefono_vendedor) VALUES 
(1, 'VendeUno', '12345678-9', 'Raul', 'Suarez', 'Gerente de Ventas', '956789012');

INSERT INTO Vendedor (id_vendedor, id_usuario, RUT_vendedor, nombre_vendedor, apellido_vendedor, puesto_vendedor, telefono_vendedor) VALUES 
(2, 'VendeDos', '23456789-0', 'Ana', 'Ibanez', 'Vendedora', '967890123');

INSERT INTO Vendedor (id_vendedor, id_usuario, RUT_vendedor, nombre_vendedor, apellido_vendedor, puesto_vendedor, telefono_vendedor) VALUES 
(3, 'VendeTres', '34567890-1', 'Miguel', 'Fernandez', 'Vendedor', '978901234');

INSERT INTO Vendedor (id_vendedor, id_usuario, RUT_vendedor, nombre_vendedor, apellido_vendedor, puesto_vendedor, telefono_vendedor) VALUES 
(4, 'VendeCuat', '87654321-2', 'Claudia', 'Ramirez', 'Supervisora', '989012345');

INSERT INTO Vendedor (id_vendedor, id_usuario, RUT_vendedor, nombre_vendedor, apellido_vendedor, puesto_vendedor, telefono_vendedor) VALUES 
(5, 'VendeCin', '45678901-2', 'Sofia', 'Rojas', 'Vendedora', '990123456');

--Registro Sucursales
INSERT INTO Sucursales (id_sucursal, id_vendedor, nombre_sucursal, direccion_sucursal, telefono_sucursal) VALUES 
(1, 1, 'Sucursal StgoCentro', 'Av. Matta 1234', '221234567');

INSERT INTO Sucursales (id_sucursal, id_vendedor, nombre_sucursal, direccion_sucursal, telefono_sucursal) VALUES 
(2, 2, 'Sucursal Providencia', 'Av. Providencia 2345', '232345678');

INSERT INTO Sucursales (id_sucursal, id_vendedor, nombre_sucursal, direccion_sucursal, telefono_sucursal) VALUES 
(3, 3, 'Sucursal Las Condes', 'Av. Apoquindo 3456', '243456789');

INSERT INTO Sucursales (id_sucursal, id_vendedor, nombre_sucursal, direccion_sucursal, telefono_sucursal) VALUES 
(4, 4, 'Sucursal Nunoa', 'Av. Irarrazaval 4567', '254567890');

INSERT INTO Sucursales (id_sucursal, id_vendedor, nombre_sucursal, direccion_sucursal, telefono_sucursal) VALUES 
(5, 5, 'Sucursal La Florida', 'Av. La Florida 5678', '265678901');


--Registro Pedido
INSERT INTO Pedido (id_pedido, id_cliente, id_vendedor, id_sucursal, fecha_recepcion, fecha_entrega, estado, total) VALUES 
(1, 1, 1, 1, TO_DATE('01-09-2023', 'DD-MM-YYYY'), TO_DATE('10-09-2023', 'DD-MM-YYYY'), 'Completado', 15000);

INSERT INTO Pedido (id_pedido, id_cliente, id_vendedor, id_sucursal, fecha_recepcion, fecha_entrega, estado, total) VALUES 
(2, 2, 2, 2, TO_DATE('05-09-2023', 'DD-MM-YYYY'), TO_DATE('14-09-2023', 'DD-MM-YYYY'), 'Pendiente', 20000);

INSERT INTO Pedido (id_pedido, id_cliente, id_vendedor, id_sucursal, fecha_recepcion, fecha_entrega, estado, total) VALUES 
(3, 3, 3, 3, TO_DATE('10-09-2023', 'DD-MM-YYYY'), TO_DATE('20-09-2023', 'DD-MM-YYYY'), 'Cancelado', 18000);

INSERT INTO Pedido (id_pedido, id_cliente, id_vendedor, id_sucursal, fecha_recepcion, fecha_entrega, estado, total) VALUES 
(4, 4, 4, 4, TO_DATE('15-09-2023', 'DD-MM-YYYY'), TO_DATE('25-09-2023', 'DD-MM-YYYY'), 'Completado', 22000);

INSERT INTO Pedido (id_pedido, id_cliente, id_vendedor, id_sucursal, fecha_recepcion, fecha_entrega, estado, total) VALUES 
(5, 5, 5, 5, TO_DATE('20-09-2023', 'DD-MM-YYYY'), TO_DATE('30-09-2023', 'DD-MM-YYYY'), 'En progreso', 25000);

--Registro Servicio
INSERT INTO Servicio (id_servicio, nombre_servicio, precio) VALUES 
(1, 'Lavado', 5000);

INSERT INTO Servicio (id_servicio, nombre_servicio, precio) VALUES 
(2, 'Planchado', 3000);

INSERT INTO Servicio (id_servicio, nombre_servicio, precio) VALUES 
(3, 'Tintura', 7000);

INSERT INTO Servicio (id_servicio, nombre_servicio, precio) VALUES 
(4, 'Lavado en seco', 10000);

INSERT INTO Servicio (id_servicio, nombre_servicio, precio) VALUES 
(5, 'Reparacion', 4000);

--Registro Prenda
INSERT INTO Prenda (id_prenda, id_pedido, id_servicio, tipo_prenda, color) VALUES 
(1, 1, 2, 'Camisa', 'Blanca');

INSERT INTO Prenda (id_prenda, id_pedido, id_servicio, tipo_prenda, color) VALUES 
(2, 1, 1, 'Pantalon', 'Negro');

INSERT INTO Prenda (id_prenda, id_pedido, id_servicio, tipo_prenda, color) VALUES 
(3, 2, 5, 'Chaqueta', 'Cafe');

INSERT INTO Prenda (id_prenda, id_pedido, id_servicio, tipo_prenda, color) VALUES 
(4, 3, 3, 'Falda', 'Azul');

INSERT INTO Prenda (id_prenda, id_pedido, id_servicio, tipo_prenda, color) VALUES 
(5, 4, 4, 'Vestido', 'Rojo');

--Registro Pagos
INSERT INTO Pagos (id_pagos, id_pedido, monto_total, metodo_pago, fecha_pago) VALUES 
(1, 1, 15000, 'Tarjeta de credito', TO_DATE('10-09-2023', 'DD-MM-YYYY'));

INSERT INTO Pagos (id_pagos, id_pedido, monto_total, metodo_pago, fecha_pago) VALUES 
(2, 4, 22000, 'Efectivo', TO_DATE('25-09-2023', 'DD-MM-YYYY'));

INSERT INTO Pagos (id_pagos, id_pedido, monto_total, metodo_pago, fecha_pago) VALUES 
(3, 5, 25000, 'Transferencia', TO_DATE('28-09-2023', 'DD-MM-YYYY'));

INSERT INTO Pagos (id_pagos, id_pedido, monto_total, metodo_pago, fecha_pago) VALUES 
(4, 3, 18000, 'Tarjeta de debito', TO_DATE('20-09-2023', 'DD-MM-YYYY'));

INSERT INTO Pagos (id_pagos, id_pedido, monto_total, metodo_pago, fecha_pago) VALUES 
(5, 2, 20000, 'Efectivo', TO_DATE('14-09-2023', 'DD-MM-YYYY'));

-----------------------------------------------------------------------------------
---PRUEBA 4---
-- 2. Realice consulta a 2 tablas relacionadas que utilicen los operadores <=, >= , 
--el operador lógico OR y la función CASE

--2 tablas relacionadas: Pedido y Cliente (relacionadas por clave foranea)
SELECT 
    p.id_pedido,
    c.nombre_cliente,
    p.fecha_entrega,
    p.total,
    p.estado,
    CASE
        WHEN p.total >= 22000 THEN 'Alto'
        WHEN p.total >= 20000 THEN 'Medio'
        ELSE 'Bajo'
    END AS clasificacion_total
FROM 
    Pedido p
JOIN 
    Cliente c ON p.id_cliente = c.id_cliente
WHERE
    p.total >= 20000
    OR p.fecha_entrega <= TO_DATE('20-09-2023', 'DD-MM-YYYY');


-- 3. Realice una consulta a 2 tablas relacionadas que en los campos extraídos aplique
--las funciones LPAD, RPAD y CONCAT con 3 o más niveles de anidacion, en las condiciones
--de búsqueda utilice los operadores < >, AND y OR

--"Niveles de anidacion" significa aplicar funciones dentro de otras funciones
--Anidacion de la columna CLIENTE_PEDIDO_ANIDADO
SELECT
  -- Anidacion de LPAD, RPAD y CONCAT (3 niveles)
  CONCAT(
  --Nivel 3: Completa el resultado anterior con puntos . a la derecha hasta llegar a largo 20.
    RPAD(
    --Nivel 2: Le agrega un espacio a la derecha del resultado anterior.
      CONCAT(
      --Nivel 1: Rellena a la izquierda el nombre con * hasta tamaño 15.
        LPAD(c.nombre_cliente, 15, '*'), 
        ' '
      ), 
      20, '.'
    ),
    CONCAT(' - Pedido: ', TO_CHAR(p.id_pedido))
  ) AS cliente_pedido_formateado,
  
  -- Anidacion (con 3 funciones) para la columna APELLIDO_ID_FORMATEADO
  --Nivel 3: Completa a la derecha con > hasta tamaño 25.
  RPAD(
  --Nivel 2: Rellena a la izquierda con < hasta tamaño 20.
    LPAD(
    --Nivel 1: Junta el apellido del cliente con "_ID"
        CONCAT(c.apellido_cliente, '_ID'), 20, '<'), 
    25, '>'
  ) AS apellido_id_formateado

FROM 
  Cliente c
JOIN 
  Pedido p ON c.id_cliente = p.id_cliente

WHERE 
  p.estado <> 'Completado'
  AND (p.total > 18000 OR p.fecha_entrega < TO_DATE('20-09-2023', 'DD-MM-YYYY'));


--4. Realice consulta a 2 tablas relacionadas que utilice los operadores de comparacion
-->, <= y el operador lógico NOT e IN

SELECT
  p.id_pedido,
  c.nombre_cliente,
  p.fecha_entrega,
  p.total
FROM
  Pedido p
JOIN
  Cliente c ON p.id_cliente = c.id_cliente
WHERE
  p.total > 18000
  AND p.fecha_entrega <= TO_DATE('25-09-2023', 'DD-MM-YYYY')
  AND NOT c.nombre_cliente IN ('Lucia', 'Marcela');


--5. Realice consulta a 3 tablas relacionadas que utilice el operador AND, LIKE e IN 
--y en los campos extraídos utilice la función DECODE y CASE

SELECT
  p.id_pedido,
  c.nombre_cliente,
  v.nombre_vendedor,
  -- Uso de DECODE: Si el estado es 'Completado' muestra 'Listo', si es 'Pendiente' muestra 'En proceso', si no muestra 'Otro'
  DECODE(p.estado, 'Completado', 'Listo', 'Pendiente', 'En proceso', 'Otro') AS estado_pedido_nuevo,
  
  -- Uso de CASE: Segmentación del monto total
  CASE
    WHEN p.total >= 22000 THEN 'Grande'
    WHEN p.total >= 18000 THEN 'Mediano'
    ELSE 'Pequeño'
  END AS rango_monto
  
FROM
  Pedido p
JOIN
  Cliente c ON p.id_cliente = c.id_cliente
JOIN
  Vendedor v ON p.id_vendedor = v.id_vendedor
WHERE
  -- AND: deben cumplirse ambas condiciones
  p.estado IN ('Completado', 'Pendiente')
  AND c.nombre_cliente LIKE 'L%'       -- El nombre del cliente empieza por L
  AND v.nombre_vendedor LIKE '%a%'     -- El nombre del vendedor contiene la letra a
;


--6. Realice consulta a una tabla que utilice una combinación de las funciones de texto
--INSTR, SUBSTR, LENGTH y UPPER

SELECT
  id_cliente,
  nombre_cliente,
  -- Convierte a mayúsculas el apellido
  UPPER(apellido_cliente) AS apellido_mayusculas,
  -- Extrae los primeros 3 caracteres del nombre
  SUBSTR(nombre_cliente, 1, 3) AS nombre_abreviado,
  -- Pone la posición en la que aparece la letra 'a' en el nombre (si existe)
  INSTR(nombre_cliente, 'a') AS posicion_a_en_nombre,
  -- Mide la longitud de la dirección
  LENGTH(direccion_cliente) AS largo_direccion
FROM
  Cliente
WHERE
  -- Encuentra clientes cuyo apellido contenga la letra 'z' (en cualquier posición, no distingue entre letras mayúsculas y minúsculas al realizar una comparación de texto)
  INSTR(UPPER(apellido_cliente), 'Z') > 0;


--7. Realice consulta a una tabla que utilice una combinación de las funciones de texto 
--REPLACE, SUBSTR, TRIM, LOWER y INITCAP

SELECT
  id_cliente,
  -- Aplica INITCAP para poner en mayúscula la primera letra de cada palabra del nombre
  INITCAP(nombre_cliente) AS nombre_capitalizado,
  -- Convierte el apellido a minúsculas y reemplaza todas las 'a' por '@'
  REPLACE(LOWER(apellido_cliente), 'a', '@') AS apellido_codificado,
  -- Quita espacios extra al principio y final de la dirección y muestra los primeros 10 caracteres
  SUBSTR(TRIM(direccion_cliente), 1, 10) AS direccion_corta,
  -- Muestra el mail en minúsculas y sin espacios (por si acaso tiene espacios al escribir)
  LOWER(TRIM(email_cliente)) AS email_normalizado
FROM
  Cliente;

--8. Realice consulta a 2 tablas relacionadas que utilice las funciones ROUND, TRUNC, 
--MOD e incluya una subconsulta a otra tabla relacionada.

SELECT
  p.id_pedido,
  -- Muestra el total, redondeado a la centena mas cercana
  ROUND(p.total, -2) AS total_redondeado,
  -- Muestra cuántos dias exactos (truncados a entero) hay entre recepcion y entrega
  TRUNC(p.fecha_entrega - p.fecha_recepcion) AS dias_diferencia,
  -- Muestra si el monto total del pago es par (0) o impar (1)
  MOD(pg.monto_total, 2) AS paridad_pago,
  -- Subconsulta: cantidad de prendas de ese pedido
  (SELECT COUNT(*) FROM Prenda pr WHERE pr.id_pedido = p.id_pedido) AS cantidad_prendas
FROM
  Pedido p
JOIN
  Pagos pg ON p.id_pedido = pg.id_pedido;


--9. Realice actualización de registros en una tabla que utilice las funciones LPAD, 
--RPAD y TRIM y en las condiciones de búsqueda, realice una subconsulta a otra tabla 
--para verificar la existencia de registros relacionados utilizando la función LIKE

--Hacer esta consulta antes de la actualizacion
SELECT 
  id_cliente,
  nombre_cliente,
  direccion_cliente AS direccion_original
FROM 
  Cliente
WHERE 
  id_cliente IN (
    SELECT DISTINCT p.id_cliente
    FROM Pedido p
    WHERE p.estado LIKE '%Pen%'
  );

-- Correr el update
UPDATE Cliente
SET
  direccion_cliente = RPAD(LPAD(TRIM(direccion_cliente), 20, '*'), 30, '#')
-- verifica la existencia de al menos un registro en la tabla relacionada (Pedido) para ese cliente.
WHERE
  EXISTS (
    SELECT 1
    FROM Pedido p
    --Relaciona ambos registros (Cliente y Pedido): la subconsulta busca pedidos del cliente actual.
    WHERE
      p.id_cliente = Cliente.id_cliente
      AND p.estado LIKE '%Pen%'
  );
  
--Para ver el cambio (despues de aplicar el UPDATE)
SELECT 
  id_cliente,
  nombre_cliente,
  direccion_cliente AS direccion_original,
  RPAD(LPAD(TRIM(direccion_cliente), 20, '*'), 30, '#') AS direccion_transformada
FROM 
  Cliente
WHERE 
  id_cliente IN (
    SELECT DISTINCT p.id_cliente
    FROM Pedido p
    WHERE p.estado LIKE '%Pen%'
  );
  

--10.	Realice una consulta a 2 tablas relacionadas que utilice las funciones sum, 
--promedio y count, realice agrupacion por 2 campos, aplique una condicion para la 
--funcion sum y promedio para un rango de valores específicos

SELECT
  c.nombre_cliente,
  p.estado,
  --Cuenta todos los pedidos de ese cliente y estado
  COUNT(*) AS cantidad_pedidos,
  --Suma totales solo de los pedidos que caen en el rango
  --ElSE Cero evita que se sume lo que no esta en el rango
  SUM(CASE WHEN p.total BETWEEN 18000 AND 25000 THEN p.total ELSE 0 END) AS suma_total_intervalo,
  -- Promedia solo esos pedidos en el rango, si no esta dentro del rango queda null
  AVG(CASE WHEN p.total BETWEEN 18000 AND 25000 THEN p.total END) AS promedio_total_intervalo
--Dos tablas relacionadas pedido y cliente por id_cliente
FROM
  Pedido p
JOIN
  Cliente c ON p.id_cliente = c.id_cliente
GROUP BY
  c.nombre_cliente,
  p.estado;
  