-- Script de Datos de Prueba para Product Catalog
-- Limpiar tablas existentes para evitar conflictos de IDs o datos duplicados
DELETE FROM Products;
DELETE FROM Categories;

-- Declarar variables para los IDs de las categor�as
DECLARE @catElectronics UNIQUEIDENTIFIER = NEWID();
DECLARE @catBooks UNIQUEIDENTIFIER = NEWID();
DECLARE @catClothing UNIQUEIDENTIFIER = NEWID();
DECLARE @catHomeKitchen UNIQUEIDENTIFIER = NEWID();
DECLARE @catSports UNIQUEIDENTIFIER = NEWID();
DECLARE @catToys UNIQUEIDENTIFIER = NEWID();
DECLARE @catBeauty UNIQUEIDENTIFIER = NEWID();
DECLARE @catFood UNIQUEIDENTIFIER = NEWID();
DECLARE @catAutomotive UNIQUEIDENTIFIER = NEWID();
DECLARE @catPetSupplies UNIQUEIDENTIFIER = NEWID();

PRINT 'Insertando 10 categor�as...';

-- Insertar 10 categor�as
INSERT INTO Categories (Id, Name, Description, FechacCreacion, FechacActualizacion, IsDeleted) VALUES
(@catElectronics, 'Electr�nica', 'Dispositivos electr�nicos y gadgets.', GETDATE(), NULL, 0),
(@catBooks, 'Libros', 'Novelas, no ficci�n, ciencia ficci�n.', GETDATE(), NULL, 0),
(@catClothing, 'Ropa', 'Vestimenta para hombres, mujeres y ni�os.', GETDATE(), NULL, 0),
(@catHomeKitchen, 'Hogar y Cocina', 'Art�culos para el hogar y utensilios de cocina.', GETDATE(), NULL, 0),
(@catSports, 'Deportes', 'Equipamiento y ropa deportiva.', GETDATE(), NULL, 0),
(@catToys, 'Juguetes', 'Juguetes para todas las edades.', GETDATE(), NULL, 0),
(@catBeauty, 'Belleza', 'Productos de cuidado personal y maquillaje.', GETDATE(), NULL, 0),
(@catFood, 'Alimentos', 'Comestibles, bebidas y snacks.', GETDATE(), NULL, 0),
(@catAutomotive, 'Automotriz', 'Accesorios y repuestos para veh�culos.', GETDATE(), NULL, 0),
(@catPetSupplies, 'Mascotas', 'Alimentos y accesorios para mascotas.', GETDATE(), NULL, 0);

PRINT 'Categor�as insertadas.';
PRINT 'Insertando 20 productos...';

-- Insertar 20 productos con sus categor�as correspondientes
INSERT INTO Products (Id, Name, Description, ImageUrl, CategoryId, FechacCreacion, FechacActualizacion, IsDeleted) VALUES
-- Electr�nica (2 productos)
(NEWID(), 'Smartphone X1', 'Tel�fono inteligente de �ltima generaci�n con c�mara de 108MP.', 'https://placehold.co/600x400/000000/FFFFFF?text=Smartphone', @catElectronics, GETDATE(), NULL, 0),
(NEWID(), 'Auriculares Bluetooth Pro', 'Auriculares con cancelaci�n de ruido activa y bater�a de larga duraci�n.', 'https://placehold.co/600x400/000000/FFFFFF?text=Auriculares', @catElectronics, GETDATE(), NULL, 0),

-- Libros (2 productos)
(NEWID(), 'El Gran Gatsby', 'Cl�sico de la literatura americana.', 'https://placehold.co/600x400/000000/FFFFFF?text=Libro', @catBooks, GETDATE(), NULL, 0),
(NEWID(), 'Gu�a de Programaci�n C#', 'Libro completo para aprender C# desde cero.', 'https://placehold.co/600x400/000000/FFFFFF?text=GuiaC#', @catBooks, GETDATE(), NULL, 0),

-- Ropa (3 productos)
(NEWID(), 'Camiseta Algod�n Org�nico', 'Camiseta suave y c�moda, 100% algod�n org�nico.', 'https://placehold.co/600x400/000000/FFFFFF?text=Camiseta', @catClothing, GETDATE(), NULL, 0),
(NEWID(), 'Pantal�n Vaquero Slim Fit', 'Vaqueros modernos de corte ajustado.', 'https://placehold.co/600x400/000000/FFFFFF?text=Pantal�n', @catClothing, GETDATE(), NULL, 0),
(NEWID(), 'Chaqueta Impermeable', 'Chaqueta ligera ideal para la lluvia.', 'https://placehold.co/600x400/000000/FFFFFF?text=Chaqueta', @catClothing, GETDATE(), NULL, 0),

-- Hogar y Cocina (3 productos)
(NEWID(), 'Cafetera Programable', 'Cafetera con temporizador y capacidad para 12 tazas.', 'https://placehold.co/600x400/000000/FFFFFF?text=Cafetera', @catHomeKitchen, GETDATE(), NULL, 0),
(NEWID(), 'Set de Sartenes Antiadherentes', 'Juego de 3 sartenes de alta calidad.', 'https://placehold.co/600x400/000000/FFFFFF?text=Sartenes', @catHomeKitchen, GETDATE(), NULL, 0),
(NEWID(), 'Robot Aspirador Inteligente', 'Aspiradora robot con mapeo l�ser y control por app.', 'https://placehold.co/600x400/000000/FFFFFF?text=Aspiradora', @catHomeKitchen, GETDATE(), NULL, 0),

-- Deportes (2 productos)
(NEWID(), 'Mancuernas Ajustables', 'Set de mancuernas con peso ajustable para entrenamiento en casa.', 'https://placehold.co/600x400/000000/FFFFFF?text=Mancuernas', @catSports, GETDATE(), NULL, 0),
(NEWID(), 'Esterilla de Yoga Antideslizante', 'Esterilla de alta densidad para yoga y pilates.', 'https://placehold.co/600x400/000000/FFFFFF?text=Esterilla', @catSports, GETDATE(), NULL, 0),

-- Juguetes (2 productos)
(NEWID(), 'Set de Construcci�n Bloques', 'Juego de bloques de construcci�n para ni�os.', 'https://placehold.co/600x400/000000/FFFFFF?text=Bloques', @catToys, GETDATE(), NULL, 0),
(NEWID(), 'Drone con C�mara HD', 'Mini drone f�cil de volar con c�mara para principiantes.', 'https://placehold.co/600x400/000000/FFFFFF?text=Drone', @catToys, GETDATE(), NULL, 0),

-- Belleza (2 productos)
(NEWID(), 'Crema Hidratante Facial', 'Crema con �cido hialur�nico para todo tipo de piel.', 'https://placehold.co/600x400/000000/FFFFFF?text=Crema', @catBeauty, GETDATE(), NULL, 0),
(NEWID(), 'Set de Brochas de Maquillaje', '12 brochas profesionales para un acabado perfecto.', 'https://placehold.co/600x400/000000/FFFFFF?text=Brochas', @catBeauty, GETDATE(), NULL, 0),

-- Alimentos (2 productos)
(NEWID(), 'Caf� Grano Tostado', 'Caf� 100% ar�bica, tostado medio, 500g.', 'https://placehold.co/600x400/000000/FFFFFF?text=Cafe', @catFood, GETDATE(), NULL, 0),
(NEWID(), 'Barritas Energ�ticas (Pack 10)', 'Barritas de cereales y frutos secos para energ�a.', 'https://placehold.co/600x400/000000/FFFFFF?text=Barritas', @catFood, GETDATE(), NULL, 0),

-- Automotriz (1 producto)
(NEWID(), 'Cargador Coche USB-C', 'Cargador r�pido para coche con doble puerto USB-C.', 'https://placehold.co/600x400/000000/FFFFFF?text=CargadorCoche', @catAutomotive, GETDATE(), NULL, 0),

-- Mascotas (1 producto)
(NEWID(), 'Alimento Seco para Perros', 'Alimento completo y balanceado para perros adultos.', 'https://placehold.co/600x400/000000/FFFFFF?text=AlimentoPerro', @catPetSupplies, GETDATE(), NULL, 0);

PRINT 'Productos insertados.';