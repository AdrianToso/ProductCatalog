-- Script de Datos de Prueba para Product Catalog
-- Limpiar tablas existentes para evitar conflictos de IDs o datos duplicados
DELETE FROM Products;
DELETE FROM Categories;

-- Declarar variables para los IDs de las categorías
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

PRINT 'Insertando 10 categorías...';

-- Insertar 10 categorías
INSERT INTO Categories (Id, Name, Description, FechacCreacion, FechacActualizacion, IsDeleted) VALUES
(@catElectronics, 'Electrónica', 'Dispositivos electrónicos y gadgets.', GETDATE(), NULL, 0),
(@catBooks, 'Libros', 'Novelas, no ficción, ciencia ficción.', GETDATE(), NULL, 0),
(@catClothing, 'Ropa', 'Vestimenta para hombres, mujeres y niños.', GETDATE(), NULL, 0),
(@catHomeKitchen, 'Hogar y Cocina', 'Artículos para el hogar y utensilios de cocina.', GETDATE(), NULL, 0),
(@catSports, 'Deportes', 'Equipamiento y ropa deportiva.', GETDATE(), NULL, 0),
(@catToys, 'Juguetes', 'Juguetes para todas las edades.', GETDATE(), NULL, 0),
(@catBeauty, 'Belleza', 'Productos de cuidado personal y maquillaje.', GETDATE(), NULL, 0),
(@catFood, 'Alimentos', 'Comestibles, bebidas y snacks.', GETDATE(), NULL, 0),
(@catAutomotive, 'Automotriz', 'Accesorios y repuestos para vehículos.', GETDATE(), NULL, 0),
(@catPetSupplies, 'Mascotas', 'Alimentos y accesorios para mascotas.', GETDATE(), NULL, 0);

PRINT 'Categorías insertadas.';
PRINT 'Insertando 20 productos...';

-- Insertar 20 productos con sus categorías correspondientes
INSERT INTO Products (Id, Name, Description, ImageUrl, CategoryId, FechacCreacion, FechacActualizacion, IsDeleted) VALUES
-- Electrónica (2 productos)
(NEWID(), 'Smartphone X1', 'Teléfono inteligente de última generación con cámara de 108MP.', 'https://placehold.co/600x400/000000/FFFFFF?text=Smartphone', @catElectronics, GETDATE(), NULL, 0),
(NEWID(), 'Auriculares Bluetooth Pro', 'Auriculares con cancelación de ruido activa y batería de larga duración.', 'https://placehold.co/600x400/000000/FFFFFF?text=Auriculares', @catElectronics, GETDATE(), NULL, 0),

-- Libros (2 productos)
(NEWID(), 'El Gran Gatsby', 'Clásico de la literatura americana.', 'https://placehold.co/600x400/000000/FFFFFF?text=Libro', @catBooks, GETDATE(), NULL, 0),
(NEWID(), 'Guía de Programación C#', 'Libro completo para aprender C# desde cero.', 'https://placehold.co/600x400/000000/FFFFFF?text=GuiaC#', @catBooks, GETDATE(), NULL, 0),

-- Ropa (3 productos)
(NEWID(), 'Camiseta Algodón Orgánico', 'Camiseta suave y cómoda, 100% algodón orgánico.', 'https://placehold.co/600x400/000000/FFFFFF?text=Camiseta', @catClothing, GETDATE(), NULL, 0),
(NEWID(), 'Pantalón Vaquero Slim Fit', 'Vaqueros modernos de corte ajustado.', 'https://placehold.co/600x400/000000/FFFFFF?text=Pantalón', @catClothing, GETDATE(), NULL, 0),
(NEWID(), 'Chaqueta Impermeable', 'Chaqueta ligera ideal para la lluvia.', 'https://placehold.co/600x400/000000/FFFFFF?text=Chaqueta', @catClothing, GETDATE(), NULL, 0),

-- Hogar y Cocina (3 productos)
(NEWID(), 'Cafetera Programable', 'Cafetera con temporizador y capacidad para 12 tazas.', 'https://placehold.co/600x400/000000/FFFFFF?text=Cafetera', @catHomeKitchen, GETDATE(), NULL, 0),
(NEWID(), 'Set de Sartenes Antiadherentes', 'Juego de 3 sartenes de alta calidad.', 'https://placehold.co/600x400/000000/FFFFFF?text=Sartenes', @catHomeKitchen, GETDATE(), NULL, 0),
(NEWID(), 'Robot Aspirador Inteligente', 'Aspiradora robot con mapeo láser y control por app.', 'https://placehold.co/600x400/000000/FFFFFF?text=Aspiradora', @catHomeKitchen, GETDATE(), NULL, 0),

-- Deportes (2 productos)
(NEWID(), 'Mancuernas Ajustables', 'Set de mancuernas con peso ajustable para entrenamiento en casa.', 'https://placehold.co/600x400/000000/FFFFFF?text=Mancuernas', @catSports, GETDATE(), NULL, 0),
(NEWID(), 'Esterilla de Yoga Antideslizante', 'Esterilla de alta densidad para yoga y pilates.', 'https://placehold.co/600x400/000000/FFFFFF?text=Esterilla', @catSports, GETDATE(), NULL, 0),

-- Juguetes (2 productos)
(NEWID(), 'Set de Construcción Bloques', 'Juego de bloques de construcción para niños.', 'https://placehold.co/600x400/000000/FFFFFF?text=Bloques', @catToys, GETDATE(), NULL, 0),
(NEWID(), 'Drone con Cámara HD', 'Mini drone fácil de volar con cámara para principiantes.', 'https://placehold.co/600x400/000000/FFFFFF?text=Drone', @catToys, GETDATE(), NULL, 0),

-- Belleza (2 productos)
(NEWID(), 'Crema Hidratante Facial', 'Crema con ácido hialurónico para todo tipo de piel.', 'https://placehold.co/600x400/000000/FFFFFF?text=Crema', @catBeauty, GETDATE(), NULL, 0),
(NEWID(), 'Set de Brochas de Maquillaje', '12 brochas profesionales para un acabado perfecto.', 'https://placehold.co/600x400/000000/FFFFFF?text=Brochas', @catBeauty, GETDATE(), NULL, 0),

-- Alimentos (2 productos)
(NEWID(), 'Café Grano Tostado', 'Café 100% arábica, tostado medio, 500g.', 'https://placehold.co/600x400/000000/FFFFFF?text=Cafe', @catFood, GETDATE(), NULL, 0),
(NEWID(), 'Barritas Energéticas (Pack 10)', 'Barritas de cereales y frutos secos para energía.', 'https://placehold.co/600x400/000000/FFFFFF?text=Barritas', @catFood, GETDATE(), NULL, 0),

-- Automotriz (1 producto)
(NEWID(), 'Cargador Coche USB-C', 'Cargador rápido para coche con doble puerto USB-C.', 'https://placehold.co/600x400/000000/FFFFFF?text=CargadorCoche', @catAutomotive, GETDATE(), NULL, 0),

-- Mascotas (1 producto)
(NEWID(), 'Alimento Seco para Perros', 'Alimento completo y balanceado para perros adultos.', 'https://placehold.co/600x400/000000/FFFFFF?text=AlimentoPerro', @catPetSupplies, GETDATE(), NULL, 0);

PRINT 'Productos insertados.';