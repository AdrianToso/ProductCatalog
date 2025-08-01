# ADR_T.ProductCatalog

## Descripción del Proyecto

ADR_T.ProductCatalog es una solución de gestión de catálogo de productos que permite realizar operaciones CRUD (Crear, Leer, Actualizar, Eliminar) sobre productos y categorías. El proyecto está diseñado como una aplicación Full Stack, separando claramente las responsabilidades del frontend y el backend para garantizar mantenibilidad, escalabilidad y una base de código limpia.

## Tecnologías

El proyecto se basa en un stack tecnológico moderno y robusto, con las siguientes tecnologías clave:

### Backend

* **.NET 8 y C#:** Para el desarrollo de la API RESTful.
* **Arquitectura Limpia (Clean Architecture):** La aplicación está organizada en capas (Domain, Application, Infrastructure, Presentation) para desacoplar las dependencias y facilitar el mantenimiento.
* **Patrones de Diseño:** Utiliza patrones como CQRS, Repository y Dependency Injection para una gestión de datos y lógica de negocio eficiente y modular.
* **Entity Framework Core:** Para la conexión a la base de datos relacional (SQL Server) y el mapeo de datos.

### Frontend

* **Angular 19:** Como framework principal para construir una moderna SPA (Single Page Application).
* **Arquitectura Modular:** Se utiliza una arquitectura basada en módulos (`NgModules`) para la organización de las funcionalidades del proyecto.
* **Angular Material:** Se utiliza para los componentes de UI, proporcionando un diseño coherente y profesional que sigue las directrices de Material Design.
* **SCSS:** Como preprocesador de CSS para un mejor manejo de estilos.
* **Comunicación con la API:** Utiliza `HttpClient` y `Observables` para una comunicación asíncrona y reactiva con el backend.

## Arquitectura del Sistema

La solución se divide en dos componentes principales:

* **Backend (`ADR_T.ProductCatalog.API`):** Una API RESTful desarrollada en .NET 8 que expone los endpoints para la gestión de productos y categorías.
* **Frontend (`ADR_T.ProductCatalog.Web`):** Una aplicación de Angular que consume la API del backend para ofrecer la interfaz de usuario.

El frontend utiliza una estructura clara y modular, con una separación explícita de responsabilidades:
-   **`/products/models`:** Contiene las interfaces (DTOs) para los modelos de datos compartidos, garantizando la consistencia de tipos.
-   **`/products/services`:** Contiene los servicios que encapsulan la lógica de las llamadas HTTP a la API.
-   **`/products/components`:** Contiene los componentes de UI que se encargan de la presentación de datos y la interacción con el usuario.

## Estado Actual del Proyecto

El proyecto se encuentra en una etapa inicial de desarrollo. La estructura básica del frontend ha sido configurada, incluyendo:
* Proyecto Angular con enrutamiento y estilos SCSS.
* Integración de Angular Material y un layout de navegación básico.
* Configuración de entornos para la URL de la API.
* Implementación del servicio `ProductsService` para la comunicación con el backend.
* Implementación del componente `ProductListComponent` para mostrar una tabla de productos.

**Próximos Pasos:**
* Creación de componentes para la gestión de productos (Crear, Editar).
* Implementación de la gestión de categorías.
* Validación de formularios reactivos y manejo de errores en el frontend.

## Instrucciones de Inicio

Para levantar y ejecutar el proyecto localmente, sigue estos pasos:

### 1. Requisitos Previos

* **Node.js LTS:** Se recomienda usar la versión LTS (Long Term Support) de Node.js.
* **.NET 8 SDK:** Para compilar y ejecutar el proyecto de backend.
* **SQL Server:** Se requiere una instancia de SQL Server para la base de datos.

### 2. Configuración del Backend

1.  Navega a la carpeta de tu solución del backend.
2.  Restaura los paquetes NuGet: `dotnet restore`
3.  Aplica las migraciones de la base de datos: `dotnet ef database update --project ADR_T.ProductCatalog.Infrastructure`
4.  Ejecuta el script SQL de datos de prueba proporcionado en la base de datos.
5.  Finalmente, inicia la API de backend: `dotnet run --project ADR_T.ProductCatalog.API`

### 3. Configuración del Frontend

1.  Navega a la carpeta del proyecto de Angular: `cd ADR_T.ProductCatalog.Web`
2.  Instala las dependencias: `npm install`
3.  Inicia la aplicación: `ng serve --open`

La aplicación de frontend se abrirá en tu navegador por defecto, mostrando la lista de productos que has insertado en la base de datos.
