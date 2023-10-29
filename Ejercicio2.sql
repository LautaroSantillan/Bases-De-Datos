/*
Dada la siguiente base de datos:
Proveedor (NroProv, NomProv, Categoria, CiudadProv)
Artículo (NroArt, Descripción, CiudadArt, Precio)
Cliente (NroCli, NomCli, CiudadCli)
Pedido (NroPed, NroArt, NroCli, NroProv, FechaPedido, Cantidad, PrecioTotal)
Stock (NroArt, fecha, cantidad)
*/

-- Scripts Creación de Tablas:

CREATE TABLE Proveedor (NroProv INT PRIMARY KEY, NomProv VARCHAR(50), Categoria VARCHAR(50), CiudadProv VARCHAR(50))
CREATE TABLE Articulo (NroArt INT PRIMARY KEY, Descripcion VARCHAR(50), CiudadArt VARCHAR(50), Precio FLOAT)
CREATE TABLE Cliente (NroCli INT PRIMARY KEY, NomCli VARCHAR(50), CiudadCli VARCHAR(50))
CREATE TABLE Pedido (NroPed INT PRIMARY KEY, NroArt INT FOREIGN KEY (NroArt) REFERENCES Articulo (NroArt),					
					NroCli INT FOREIGN KEY (NroCli) REFERENCES Cliente (NroCli), NroProv INT FOREIGN KEY (NroProv) REFERENCES Proveedor (NroProv), 					
					FechaPedido DATETIME, Cantidad INT, PrecioTotal FLOAT)
CREATE TABLE Stock (NroArt INT PRIMARY KEY FOREIGN KEY (NroArt) REFERENCES Articulo (NroArt), fecha DATETIME, cantidad INT)

-- Scripts Inserción de Datos:

INSERT INTO Proveedor VALUES
(1, 'Proveedor A', 5, 'Rosario'),
(2, 'Proveedor B', 3, 'Mendoza'),
(3, 'Proveedor C', 6, 'Junin'),
(4, 'Proveedor D', 7, 'La Plata'),
(5, 'Proveedor E', 8, 'Ciudadela')

INSERT INTO Articulo VALUES
(1, 'Articulo 146', 'Rosario', 100.00),
(2, 'Articulo P015', 'Mendoza', 50.00),
(3, 'Cuaderno', 'Junin', 10.00),
(4, 'Articulo A001', 'La Plata', 75.00),
(5, 'Articulo A100', 'Rosario', 80.00)

INSERT INTO Cliente VALUES 
(23, 'Cliente 23', 'Rosario'),
(30, 'Cliente 30', 'Mendoza'),
(45, 'Cliente 45', 'Junin'),
(60, 'Cliente 60', 'La Plata'),
(80, 'Cliente 80', 'La Plata')

INSERT INTO Pedido VALUES
(1, 1, 23, 1, ' 2023-03-01', 2, 200.00),
(2, 2, 30, 2, ' 2023-03-02', 3, 150.00),
(3, 3, 45, 3, ' 2023-03-03', 5, 50.00),
(4, 4, 60, 4, ' 2023-03-04', 1, 75.00),
(5, 5, 80, 5, ' 2023-03-05', 3, 240.00), 
(6, 2, 80, 3, ' 2023-03-10', 2, 100.00),
(7, 2, 23, 5, ' 2023-06-01', 1, 50.00)

INSERT INTO Stock VALUES
(1, '2023-03-01', 10),
(2, '2023-03-02', 15),
(3, '2023-03-03', 20),
(4, '2023-03-04', 5),
(5, '2023-03-05', 25)

-- 1. Hallar el código (NroProv) de los proveedores que proveen el artículo a146

SELECT ped.NroProv as Codigo_Proveedor
FROM Pedido ped
WHERE ped.NroArt = 1
 
-- 2. Hallar los clientes (NomCli) que solicitan artículos provistos por p015.

SELECT cli.NomCli as Nombre_Cliente
FROM Cliente cli INNER JOIN (
					SELECT ped.NroCli
					FROM Pedido ped 
					WHERE ped.NroArt = 2
) as b ON cli.NroCli = b.NroCli

-- 3. Hallar los clientes que solicitan algún item provisto por proveedores con categoría mayor que 4.

SELECT ped.NroCli as Cliente
FROM Pedido ped INNER JOIN (
					SELECT prov.NroProv
					FROM Proveedor prov 
					WHERE prov.Categoria > 4 
) as b ON ped.NroProv = b.NroProv

-- 4. Hallar los pedidos en los que un cliente de Rosario solicita artículos producidos en la ciudad de Mendoza.

SELECT *
FROM Pedido ped INNER JOIN (
					SELECT cli.NroCli
					FROM Cliente cli
					WHERE cli.CiudadCli LIKE 'Rosario'
					UNION
					SELECT art.NroArt
					FROM Articulo art
					WHERE art.CiudadArt LIKE 'Mendoza'
) as b ON ped.NroCli = b.NroCli
WHERE ped.NroArt = 2

-- 5. Hallar los pedidos en los que el cliente c23 solicita artículos solicitados por el cliente c30.

SELECT ped.*
FROM Pedido ped INNER JOIN (
					SELECT cli.NroCli
					FROM Cliente cli
					WHERE cli.NroCli = 23
) as b ON ped.NroCli = b.NroCli
WHERE 
DISTINCT
SELECT ped.*
FROM Pedido ped INNER JOIN (
					SELECT cli.NroCli
					FROM Cliente cli
					WHERE cli.NroCli = 30
) as c ON ped.NroCli = c.NroCli

-- 6. Hallar los proveedores que suministran todos los artículos cuyo precio es superior al precio promedio de los artículos que se producen en La Plata.

SELECT AVG(art.Precio) as Promedio_Art_LaPlata
FROM Articulo art 
WHERE art.CiudadArt LIKE 'La Plata'

SELECT * FROM Proveedor
SELECT * FROM Articulo
SELECT * FROM Cliente
SELECT * FROM Pedido
SELECT * FROM Stock

/*DROP TABLE Pedido
DROP TABLE Stock
DROP TABLE Cliente
DROP TABLE Articulo
DROP TABLE Proveedor*/