/* 
Dada la siguiente base de datos:
Almacén (Nro, Responsable)
Artículo (CodArt, descripción, Precio)
Material (CodMat, Descripción)
Proveedor (CodProv, Nombre, Domicilio, Ciudad)
Tiene (Nro, CodArt)
Compuesto_por (CodArt, CodMat)
Provisto_por (CodMat, CodProv) 
*/

-- CREACION DE TABLAS

CREATE TABLE Almacen(
	Nro INT,
	Responsable VARCHAR(50),
	PRIMARY KEY (Nro)
);

CREATE TABLE Articulo(
	CodArt INT,
	Descripcion VARCHAR(50),
	Precio FLOAT,
	PRIMARY KEY (CodArt)
);

CREATE TABLE Material(
	CodMat INT,
	Descripcion VARCHAR(50),
	PRIMARY KEY (CodMat)
);

CREATE TABLE Proveedor(
	CodProv INT,
	Nombre VARCHAR(50),
	Domicilio VARCHAR(50),
	Ciudad VARCHAR(50),
	PRIMARY KEY (CodProv)
);

CREATE TABLE Tiene(
	Nro INT,
	CodArt INT,
	PRIMARY KEY (Nro, CodArt),
	FOREIGN KEY (Nro) REFERENCES Almacen (Nro),
	FOREIGN KEY (CodArt) REFERENCES Articulo (CodArt)
);

CREATE TABLE Compuesto_por(
	CodArt INT,
	CodMat INT,
	PRIMARY KEY (CodArt, CodMat),
	FOREIGN KEY (CodArt) REFERENCES Articulo (CodArt),
	FOREIGN KEY (CodMat) REFERENCES Material (CodMat)
);

CREATE TABLE Provisto_por(
	CodMat INT,
	CodProv INT,
	PRIMARY KEY (CodMat, CodProv),
	FOREIGN KEY (CodMat) REFERENCES Material (CodMat),
	FOREIGN KEY (CodProv) REFERENCES Proveedor (CodProv)
);

-- INSERTANDO VALORES

INSERT INTO Almacen(Nro, Responsable) VALUES (1, 'Laracrose');
INSERT INTO Almacen(Nro, Responsable) VALUES (2, 'Mountain');
INSERT INTO Almacen(Nro, Responsable) VALUES (3, 'Krieger');
INSERT INTO Almacen(Nro, Responsable) VALUES (4, 'Speed');
INSERT INTO Almacen(Nro, Responsable) VALUES (5, 'Fazio');

INSERT INTO Articulo(CodArt, Descripcion, Precio) VALUES (1, 'Celular', 1200);
INSERT INTO Articulo(CodArt, Descripcion, Precio) VALUES (2, 'PS5', 1000);
INSERT INTO Articulo(CodArt, Descripcion, Precio) VALUES (3, 'PC', 500);
INSERT INTO Articulo(CodArt, Descripcion, Precio) VALUES (4, 'Reloj', 80);
INSERT INTO Articulo(CodArt, Descripcion, Precio) VALUES (5, 'Auto', 25000);
INSERT INTO Articulo(CodArt, Descripcion, Precio) VALUES (6, 'Anteojos', 15);
INSERT INTO Articulo(CodArt, Descripcion, Precio) VALUES (7, 'Auriculares', 20); -- UPDATE Articulo SET Precio=5 WHERE CodArt=7
INSERT INTO Articulo(CodArt, Descripcion, Precio) VALUES (8, 'Calculadora', 9);

INSERT INTO Material(CodMat, Descripcion) VALUES (1, 'Bateria');
INSERT INTO Material(CodMat, Descripcion) VALUES (2, 'Litio');
INSERT INTO Material(CodMat, Descripcion) VALUES (3, 'Vidrio');
INSERT INTO Material(CodMat, Descripcion) VALUES (4, 'Cable');
INSERT INTO Material(CodMat, Descripcion) VALUES (5, 'Madera');
INSERT INTO Material(CodMat, Descripcion) VALUES (6, 'Pilas');
INSERT INTO Material(CodMat, Descripcion) VALUES (7, 'Bateria'); -- UPDATE Material SET Descripcion='Memoria' WHERE CodMat=7
INSERT INTO Material(CodMat, Descripcion) VALUES (8, 'UPC');
INSERT INTO Material(CodMat, Descripcion) VALUES (9, 'Plastico');

INSERT INTO Proveedor(CodProv, Nombre, Domicilio, Ciudad) VALUES (1, 'Lautaro', 'Hipolito', 'Ciudadela');
INSERT INTO Proveedor(CodProv, Nombre, Domicilio, Ciudad) VALUES (5, 'Sergio', 'Parma', 'La Plata');
INSERT INTO Proveedor(CodProv, Nombre, Domicilio, Ciudad) VALUES (10, 'Eugenio', 'Limito', 'Capital Federal');
INSERT INTO Proveedor(CodProv, Nombre, Domicilio, Ciudad) VALUES (15, 'Marcos', 'Rolon', 'Capital Federal');
INSERT INTO Proveedor(CodProv, Nombre, Domicilio, Ciudad) VALUES (20, 'Lopez', 'Genova', 'Ramos Mejias');
INSERT INTO Proveedor(CodProv, Nombre, Domicilio, Ciudad) VALUES (25, 'Perez', 'Ricci', 'Pergamino');
INSERT INTO Proveedor(CodProv, Nombre, Domicilio, Ciudad) VALUES (30, 'Julio', 'Meza', 'Pergamino');

INSERT INTO Tiene(Nro, CodArt) VALUES (1, 1);
INSERT INTO Tiene(Nro, CodArt) VALUES (1, 2);
INSERT INTO Tiene(Nro, CodArt) VALUES (1, 3);
--
INSERT INTO Tiene(Nro, CodArt) VALUES (2, 5);
--
INSERT INTO Tiene(Nro, CodArt) VALUES (3, 4);
INSERT INTO Tiene(Nro, CodArt) VALUES (3, 7);
INSERT INTO Tiene(Nro, CodArt) VALUES (3, 8);
--
INSERT INTO Tiene(Nro, CodArt) VALUES (4, 1);
INSERT INTO Tiene(Nro, CodArt) VALUES (4, 7);
INSERT INTO Tiene(Nro, CodArt) VALUES (4, 8);
INSERT INTO Tiene(Nro, CodArt) VALUES (4, 2); 
--
INSERT INTO Tiene(Nro, CodArt) VALUES (5, 2); 
INSERT INTO Tiene(Nro, CodArt) VALUES (5, 6);
INSERT INTO Tiene(Nro, CodArt) VALUES (5, 7);

INSERT INTO Compuesto_por(CodArt, CodMat) VALUES (1, 1);
INSERT INTO Compuesto_por(CodArt, CodMat) VALUES (1, 2);
INSERT INTO Compuesto_por(CodArt, CodMat) VALUES (1, 3);
INSERT INTO Compuesto_por(CodArt, CodMat) VALUES (1, 7);
INSERT INTO Compuesto_por(CodArt, CodMat) VALUES (1, 8);
INSERT INTO Compuesto_por(CodArt, CodMat) VALUES (1, 9);
--
INSERT INTO Compuesto_por(CodArt, CodMat) VALUES (2, 1);
INSERT INTO Compuesto_por(CodArt, CodMat) VALUES (2, 2);
INSERT INTO Compuesto_por(CodArt, CodMat) VALUES (2, 4);
INSERT INTO Compuesto_por(CodArt, CodMat) VALUES (2, 7);
INSERT INTO Compuesto_por(CodArt, CodMat) VALUES (2, 8);
INSERT INTO Compuesto_por(CodArt, CodMat) VALUES (2, 9);
--
INSERT INTO Compuesto_por(CodArt, CodMat) VALUES (3, 1);
INSERT INTO Compuesto_por(CodArt, CodMat) VALUES (3, 3);
INSERT INTO Compuesto_por(CodArt, CodMat) VALUES (3, 4);
INSERT INTO Compuesto_por(CodArt, CodMat) VALUES (3, 7);
INSERT INTO Compuesto_por(CodArt, CodMat) VALUES (3, 8);
INSERT INTO Compuesto_por(CodArt, CodMat) VALUES (3, 9);
--
INSERT INTO Compuesto_por(CodArt, CodMat) VALUES (4, 2);
INSERT INTO Compuesto_por(CodArt, CodMat) VALUES (4, 3);
INSERT INTO Compuesto_por(CodArt, CodMat) VALUES (4, 6);
INSERT INTO Compuesto_por(CodArt, CodMat) VALUES (4, 7);
INSERT INTO Compuesto_por(CodArt, CodMat) VALUES (4, 8);
--
INSERT INTO Compuesto_por(CodArt, CodMat) VALUES (5, 1);
INSERT INTO Compuesto_por(CodArt, CodMat) VALUES (5, 2);
INSERT INTO Compuesto_por(CodArt, CodMat) VALUES (5, 3);
INSERT INTO Compuesto_por(CodArt, CodMat) VALUES (5, 4);
INSERT INTO Compuesto_por(CodArt, CodMat) VALUES (5, 5);
INSERT INTO Compuesto_por(CodArt, CodMat) VALUES (5, 6);
INSERT INTO Compuesto_por(CodArt, CodMat) VALUES (5, 7);
INSERT INTO Compuesto_por(CodArt, CodMat) VALUES (5, 8);
INSERT INTO Compuesto_por(CodArt, CodMat) VALUES (5, 9);
--
INSERT INTO Compuesto_por(CodArt, CodMat) VALUES (6, 3);
INSERT INTO Compuesto_por(CodArt, CodMat) VALUES (6, 5);
INSERT INTO Compuesto_por(CodArt, CodMat) VALUES (6, 9);
--
INSERT INTO Compuesto_por(CodArt, CodMat) VALUES (7, 1);
INSERT INTO Compuesto_por(CodArt, CodMat) VALUES (7, 2);
INSERT INTO Compuesto_por(CodArt, CodMat) VALUES (7, 4);
INSERT INTO Compuesto_por(CodArt, CodMat) VALUES (7, 8);
INSERT INTO Compuesto_por(CodArt, CodMat) VALUES (7, 9);
--
INSERT INTO Compuesto_por(CodArt, CodMat) VALUES (8, 2);
INSERT INTO Compuesto_por(CodArt, CodMat) VALUES (8, 3);
INSERT INTO Compuesto_por(CodArt, CodMat) VALUES (8, 6);
INSERT INTO Compuesto_por(CodArt, CodMat) VALUES (8, 7);
INSERT INTO Compuesto_por(CodArt, CodMat) VALUES (8, 8);
INSERT INTO Compuesto_por(CodArt, CodMat) VALUES (8, 9);

INSERT INTO Provisto_por(CodMat, CodProv) VALUES (1, 1);
INSERT INTO Provisto_por(CodMat, CodProv) VALUES (4, 1);
INSERT INTO Provisto_por(CodMat, CodProv) VALUES (5, 1);
INSERT INTO Provisto_por(CodMat, CodProv) VALUES (9, 1);

INSERT INTO Provisto_por(CodMat, CodProv) VALUES (1, 5);
INSERT INTO Provisto_por(CodMat, CodProv) VALUES (2, 5);
INSERT INTO Provisto_por(CodMat, CodProv) VALUES (3, 5);
INSERT INTO Provisto_por(CodMat, CodProv) VALUES (8, 5);

INSERT INTO Provisto_por(CodMat, CodProv) VALUES (6, 10);
INSERT INTO Provisto_por(CodMat, CodProv) VALUES (7, 10);
INSERT INTO Provisto_por(CodMat, CodProv) VALUES (8, 10);
INSERT INTO Provisto_por(CodMat, CodProv) VALUES (2, 10);

INSERT INTO Provisto_por(CodMat, CodProv) VALUES (1, 15);
INSERT INTO Provisto_por(CodMat, CodProv) VALUES (6, 15);

INSERT INTO Provisto_por(CodMat, CodProv) VALUES (2, 20);
INSERT INTO Provisto_por(CodMat, CodProv) VALUES (4, 20);
INSERT INTO Provisto_por(CodMat, CodProv) VALUES (6, 20);
INSERT INTO Provisto_por(CodMat, CodProv) VALUES (8, 20);

INSERT INTO Provisto_por(CodMat, CodProv) VALUES (1, 25);
INSERT INTO Provisto_por(CodMat, CodProv) VALUES (3, 25);
INSERT INTO Provisto_por(CodMat, CodProv) VALUES (5, 25);
INSERT INTO Provisto_por(CodMat, CodProv) VALUES (7, 25);
INSERT INTO Provisto_por(CodMat, CodProv) VALUES (9, 25);

-- 1. Listar los nombres de los proveedores de la ciudad de La Plata.

SELECT nombre
FROM Proveedor pr
WHERE pr.Ciudad='La Plata'

-- 2. Listar los números de artículos cuyo precio sea inferior a $10.

SELECT codArt
FROM Articulo art
WHERE art.Precio<10

-- 3. Listar los responsables de los almacenes.

SELECT responsable
FROM Almacen 

-- 4. Listar los códigos de los materiales que provea el proveedor 10 y no los provea el proveedor 15.

SELECT CodMat
FROM Provisto_por 
WHERE CodProv=10 AND CodMat NOT IN (SELECT CodMat
									FROM Provisto_por
									WHERE CodProv=15) 

-- 5. Listar los números de almacenes que almacenan el artículo A.

SELECT Nro
FROM Tiene
WHERE CodArt=1

-- 6. Listar los proveedores de Pergamino que se llamen Pérez.

SELECT *
FROM Proveedor
WHERE Ciudad='Pergamino' AND Nombre LIKE 'Perez'

-- 7. Listar los almacenes que contienen los artículos A y los artículos B (ambos).

SELECT a. *
FROM Almacen as a INNER JOIN (
	SELECT Nro 
	FROM Tiene
	WHERE CodArt=1
	INTERSECT 
	SELECT Nro 
	FROM Tiene
	WHERE CodArt=2
) as b on a.Nro=b.Nro