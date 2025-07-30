IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;
GO

BEGIN TRANSACTION;
CREATE TABLE [Categories] (
    [Id] uniqueidentifier NOT NULL,
    [Name] nvarchar(100) NOT NULL,
    [Description] nvarchar(max) NULL,
    [FechacCreacion] datetime2 NOT NULL,
    [FechacActualizacion] datetime2 NULL,
    [IsDeleted] bit NOT NULL,
    CONSTRAINT [PK_Categories] PRIMARY KEY ([Id])
);

CREATE TABLE [Products] (
    [Id] uniqueidentifier NOT NULL,
    [Name] nvarchar(200) NOT NULL,
    [Description] nvarchar(max) NOT NULL,
    [ImageUrl] nvarchar(max) NULL,
    [FechacCreacion] datetime2 NOT NULL,
    [FechacActualizacion] datetime2 NULL,
    [IsDeleted] bit NOT NULL,
    CONSTRAINT [PK_Products] PRIMARY KEY ([Id])
);

CREATE TABLE [ProductCategories] (
    [CategoriesId] uniqueidentifier NOT NULL,
    [ProductsId] uniqueidentifier NOT NULL,
    CONSTRAINT [PK_ProductCategories] PRIMARY KEY ([CategoriesId], [ProductsId]),
    CONSTRAINT [FK_ProductCategories_Categories_CategoriesId] FOREIGN KEY ([CategoriesId]) REFERENCES [Categories] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_ProductCategories_Products_ProductsId] FOREIGN KEY ([ProductsId]) REFERENCES [Products] ([Id]) ON DELETE CASCADE
);

CREATE UNIQUE INDEX [IX_Categories_Name] ON [Categories] ([Name]);

CREATE INDEX [IX_ProductCategories_ProductsId] ON [ProductCategories] ([ProductsId]);

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20250729163619_InitialCreate', N'9.0.7');

COMMIT;
GO

