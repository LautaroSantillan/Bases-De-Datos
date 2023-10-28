/*
Dada la siguiente base de datos:
Proveedor (NroProv, NomProv, Categoria, CiudadProv)
Artículo (NroArt, Descripción, CiudadArt, Precio)
Cliente (NroCli, NomCli, CiudadCli)
Pedido (NroPed, NroArt, NroCli, NroProv, FechaPedido, Cantidad, PrecioTotal)
Stock (NroArt, fecha, cantidad)*/-- Scripts Creación de Tablas:CREATE TABLE Proveedor2 (NroProv INT PRIMARY KEY, NomProv VARCHAR(50), Categoria VARCHAR(50), CiudadProv VARCHAR(50))CREATE TABLE Articulo2 (NroArt INT PRIMARY KEY, Descripcion VARCHAR(50), CiudadArt VARCHAR(50), Precio FLOAT)CREATE TABLE Cliente (NroCli VARCHAR(5) PRIMARY KEY, NomCli VARCHAR(50), CiudadCli VARCHAR(50))CREATE TABLE Pedido (NroPed INT PRIMARY KEY, NroArt INT FOREIGN KEY (NroArt) REFERENCES Articulo2 (NroArt),					NroCli VARCHAR(5) FOREIGN KEY (NroCli) REFERENCES Cliente (NroCli), NroProv INT FOREIGN KEY (NroProv) REFERENCES Proveedor2 (NroProv), 					FechaPedido DATETIME, Cantidad INT, PrecioTotal FLOAT)CREATE TABLE Stock (NroArt INT PRIMARY KEY FOREIGN KEY (NroArt) REFERENCES Articulo2 (NroArt), fecha DATETIME, cantidad INT)-- Scripts Inserción de Datos

INSERT INTO Proveedor2 VALUES
(1, 'Proveedor A', 5, 'Rosario'),
(2, 'Proveedor B', 3, 'Mendoza'),
(3, 'Proveedor C', 6, 'Junin'),
(4, 'Proveedor D', 7, 'La Plata'),
(5, 'Proveedor E', 8, 'Ciudadela')

INSERT INTO Articulo2 VALUES
(1, 'Articulo 146', 'Rosario', 100.00),
(2, 'Articulo P015', 'Mendoza', 50.00),
(3, 'Cuaderno', 'Junin', 10.00),
(4, 'Articulo A001', 'La Plata', 75.00),
(5, 'Articulo A100', 'Rosario', 80.00)

INSERT INTO Cliente VALUES 
('c23', 'Cliente 23', 'Rosario'),
('c30', 'Cliente 30', 'Mendoza'),
('c45', 'Cliente 45', 'Junin'),
('c60', 'Cliente 60', 'La Plata'),
('c80', 'Cliente 80', 'La Plata')

INSERT INTO Pedido VALUES
(1, 1, 'c23', 1, ' 2023-03-01', 2, 200.00),
(2, 2, 'c30', 2, ' 2023-03-02', 3, 150.00),
(3, 3, 'c45', 3, ' 2023-03-03', 5, 50.00),
(4, 4, 'c60', 4, ' 2023-03-04', 1, 75.00),
(5, 5, 'c80', 5, ' 2023-03-05', 3, 240.00)

INSERT INTO Stock VALUES
(1, '2023-03-01', 10),
(2, '2023-03-02', 15),
(3, '2023-03-03', 20),
(4, '2023-03-04', 5),
(5, '2023-03-05', 25)

SELECT * FROM Proveedor2
SELECT * FROM Articulo2
SELECT * FROM Cliente
SELECT * FROM Pedido
SELECT * FROM Stock