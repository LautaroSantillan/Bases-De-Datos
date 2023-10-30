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
(7, 2, 23, 5, ' 2023-06-01', 1, 50.00),
(8, 1, 30, 3, ' 2023-06-12', 5, 500.00),
(9, 2, 45, 1, ' 2023-04-15', 2, 150.00),
(10, 1, 45, 3, ' 2023-05-08', 1, 100.00),
(11, 2, 45, 3, ' 2023-03-30', 5, 250.00),
(12, 2, 45, 1, ' 2023-04-15', 3, 150.00),
(13, 3, 80, 1, ' 2023-12-15', 15, 150.00
(14, 4, 23, 5, ' 2023-05-22', 2, 150.00),
(15, 5, 30, 5, ' 2023-01-31', 3, 240.00),
(16, 4, 80, 4, ' 2023-08-08', 1, 75.00),
(17, 5, 60, 4, ' 2023-04-11', 4, 320.00),
(18, 4, 80, 1, ' 2023-11-18', 2, 150.00)

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

SELECT ped.*
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
					SELECT ped.NroPed
					FROM Pedido ped INNER JOIN (
										SELECT ped.NroArt
										FROM Pedido ped
										WHERE ped.NroCli = 30
					) as b ON ped.NroArt = b.NroArt
) as c ON ped.NroPed = c.NroPed
WHERE ped.NroCli = 23 OR ped.NroCli = 30

-- 6. Hallar los proveedores que suministran todos los artículos cuyo precio es superior al precio promedio de los artículos que se producen en La Plata.

SELECT ped.NroProv as Proveedores
FROM Pedido ped INNER JOIN (
					SELECT art.NroArt
					FROM Articulo art
					WHERE art.Precio > (SELECT AVG(art.Precio)FROM Articulo art WHERE art.CiudadArt LIKE 'La Plata')
) as b ON ped.NroArt = b.NroArt

-- 7. Hallar la cantidad de artículos diferentes provistos por cada proveedor que provee a todos los clientes de Junín. 

SELECT ped.NroProv as Provedor_Nº, COUNT(ped.NroArt) as Articulos_Diferentes
FROM Pedido ped
WHERE ped.NroCli = 45
GROUP BY ped.NroProv

-- 8. Hallar los nombres de los proveedores cuya categoría sea mayor que la de todos los proveedores que proveen el artículo “cuaderno”. 

SELECT prov.NomProv as Nombre_Proveedor
FROM Proveedor prov INNER JOIN (
						SELECT MAX(prov.Categoria) as Categoria_Max
						FROM Proveedor prov INNER JOIN (
												SELECT ped.NroProv
												FROM Pedido ped 
												WHERE ped.NroArt = 3
						) as b ON prov.NroProv = b.NroProv
) as c ON prov.Categoria > Categoria_Max

-- 9. Hallar los proveedores que han provisto más de 5 unidades entre los artículos A001 y A100. // NroArt = 4 ^ 5

SELECT prov.*
FROM Proveedor prov INNER JOIN (
						SELECT ped.NroProv
						FROM Pedido ped INNER JOIN (
											SELECT ped.NroProv, SUM(ped.Cantidad) as SumUnidades
											FROM Pedido ped
											WHERE ped.NroArt BETWEEN 4 AND 5
											GROUP BY ped.NroProv
						) as b ON ped.NroProv = b.NroProv
						WHERE b.SumUnidades > 5
						GROUP BY ped.NroProv
) as c ON prov.NroProv = c.NroProv

-- 10. Listar la cantidad y el precio total de cada artículo que han pedido los Clientes a sus proveedores entre las fechas 01-01-2004 y 31-03-2004 
-- (se requiere visualizar Cliente, Articulo, Proveedor, Cantidad y Precio). 

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