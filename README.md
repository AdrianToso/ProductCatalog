# **ADR\_T.ProductCatalog \- Solución Full-Stack de Catálogo de Productos**

Este repositorio contiene una solución full-stack completa para la gestión de un catálogo de productos. El proyecto está construido sobre .NET 8 y Angular, siguiendo los principios de **Arquitectura Limpia** y el patrón **CQRS**, y está diseñado para ser escalable y mantenible.

La integración con Docker Compose permite desplegar todo el entorno de desarrollo (backend, frontend y base de datos) de forma rápida y consistente con un solo comando.

## **Tabla de Contenidos**

1. [Visión General del Proyecto](#1-visión-general-del-proyecto)  
2. [Arquitectura y Tecnologías Clave](#2-arquitectura-y-tecnologías-clave)  
3. [Estructura de la Solución](#3-estructura-de-la-solución)  
4. [Requisitos Previos](#4-requisitos-previos)  
5. [Configuración del Entorno con Docker Compose (Recomendado)](#5-configuración-del-entorno-con-docker-compose-recomendado)  
   * [5.1. Configuración de Variables de Entorno](#51-configuración-de-variables-de-entorno)  
   * [5.2. Levantando los Servicios](#52-levantando-los-servicios)  
   * [5.3. Verificación de Servicios](#53-verificación-de-servicios)  
6. [Acceso a la Aplicación y Herramientas](#6-acceso-a-la-aplicación-y-herramientas)  
7. [Ejecución sin Docker (Alternativa)](#7-ejecución-sin-docker-alternativa)  
   * [7.1. Configuración del Backend (.NET)](#71-configuración-del-backend-net)  
   * [7.2. Configuración del Frontend (Angular)](#72-configuración-del-frontend-angular)  
8. [Usuarios de Prueba](#8-usuarios-de-prueba)  
9. [Documentación Detallada](#9-documentación-detallada)

### **1\. Visión General del Proyecto**

ADR\_T.ProductCatalog es una aplicación diseñada para gestionar un catálogo de productos y sus categorías. Su propósito principal es servir como una implementación de referencia de una arquitectura full-stack moderna, aplicando activamente principios de software de alta calidad.

Más allá de la funcionalidad CRUD, este proyecto sirve como un **ejemplo práctico** para el desarrollo de soluciones robustas, combinando:

* **ASP.NET Core 8**: Para el desarrollo de una API RESTful siguiendo la Arquitectura Limpia.  
* **Angular (\~v20)**: Para la construcción de una Single Page Application (SPA) modular y reactiva.  
* **Entity Framework Core**: Para la gestión de la persistencia de datos.  
* **Patrones de Diseño**: CQRS con MediatR, Repository, Unit of Work e Inyección de Dependencias.  
* **Docker y Docker Compose**: Para la orquestación de un entorno de desarrollo consistente.

### **2\. Arquitectura y Tecnologías Clave**

| Área | Componente | Tecnologías Clave |
| :---- | :---- | :---- |
| **Backend** | Framework y Lenguaje | .NET 8, C\#, ASP.NET Core |
|  | Patrones | Arquitectura Limpia, CQRS, MediatR, Repository, Unit of Work, Inyección de Dependencias |
|  | Acceso a Datos | Entity Framework Core 8 |
|  | Autenticación/Autorización | ASP.NET Core Identity, JWT |
|  | Testing | xUnit, Moq, FluentAssertions |
| **Frontend** | Framework y Lenguaje | Angular (\~v20), TypeScript |
|  | UI | Angular Material |
|  | Estilos | SCSS |
|  | Programación Reactiva | RxJS, Signals |
|  | Testing | Jest |
| **Base de Datos** | Motor | SQL Server |
| **Contenerización** | Orquestación | Docker, Docker Compose |
|  | Servidor Web (Frontend) | Nginx |

### **3\. Estructura de la Solución**

La solución está organizada en múltiples proyectos, cada uno representando una capa en la arquitectura limpia:

* **ADR\_T.ProductCatalog.Core**: (Dominio) Contiene las entidades del dominio, interfaces de repositorios y la lógica de negocio central. Es el corazón de la aplicación.  
* **ADR\_T.ProductCatalog.Application**: (Aplicación) Implementa los casos de uso del sistema utilizando el patrón CQRS (comandos y consultas) con MediatR.  
* **ADR\_T.ProductCatalog.Infrastructure**: (Infraestructura) Contiene las implementaciones concretas de las interfaces definidas en Core, incluyendo la configuración de Entity Framework Core, repositorios y servicios de identidad.  
* **ADR\_T.ProductCatalog.WebApi**: (Presentación \- API) Es el proyecto de la API RESTful que expone los endpoints. Actúa como la interfaz para el frontend.  
* **ADR\_T.ProductCatalog.Frontend**: (Presentación \- UI) La Single Page Application desarrollada en Angular que consume la API.  
* **ADR\_T.ProductCatalog.Tests**: Contiene los proyectos de pruebas unitarias para las diferentes capas del backend.

### **4\. Requisitos Previos**

* **Docker Desktop**: Imprescindible para el método de ejecución recomendado. [Descargar Docker Desktop](https://www.docker.com/products/docker-desktop/)  
* **(Opcional) .NET 8 SDK**: Necesario para la ejecución local sin Docker.  
* **(Opcional) Node.js LTS y Angular CLI**: Necesario para la ejecución local del frontend.

### **5\. Configuración del Entorno con Docker Compose (Recomendado)**

#### **5.1. Configuración de Variables de Entorno**

Antes de iniciar, crea un archivo llamado .env en la **raíz del proyecto** (al mismo nivel que docker-compose.yml) y añade la siguiente variable para la contraseña de la base de datos:

\# Contraseña para el usuario 'SA' de SQL Server. ¡Usa una contraseña segura\!  
DB\_PASSWORD=yourStrong(\!)Password123

**Nota de seguridad**: El archivo .env está incluido en .gitignore y no debe ser subido a repositorios públicos.

#### **5.2. Levantando los Servicios**

1. Abre una terminal en la **raíz del proyecto**.  
2. Ejecuta el siguiente comando para construir las imágenes y levantar todos los servicios:  
   docker-compose up \--build

   Este comando iniciará el backend, el frontend y la base de datos de SQL Server en contenedores Docker.

#### **5.3. Verificación de Servicios**

* Para verificar el estado de los contenedores, ejecuta:  
  docker-compose ps

  Todos los servicios deberían aparecer con el estado running o healthy.  
* Para revisar los logs de un servicio específico (por ejemplo, la API):  
  docker-compose logs webapi

### **6\. Acceso a la Aplicación y Herramientas**

Una vez que los servicios estén en marcha, podrás acceder a ellos en las siguientes URLs:

* **Aplicación Frontend (Angular)**: http://localhost:4200  
* **API Backend (Swagger UI)**: http://localhost:7175/swagger  
* **Base de Datos (SQL Server)**:  
  * **Servidor:** localhost,1433  
  * **Usuario:** SA  
  * **Contraseña:** La que definiste en el archivo .env.

### **7\. Ejecución sin Docker (Alternativa)**

Si prefieres no usar Docker, puedes ejecutar cada parte de la solución de forma nativa.

#### **7.1. Configuración del Backend (.NET)**

1. **Configurar Cadena de Conexión**: En ADR\_T.ProductCatalog.WebApi/appsettings.json, modifica la DefaultConnection para que apunte a tu instancia local de SQL Server.  
2. **Restaurar, Migrar y Ejecutar**: Desde una terminal en la raíz del proyecto:  
   \# Restaurar paquetes NuGet  
   dotnet restore

   \# Aplicar migraciones para crear la base de datos  
   dotnet ef database update \--project ADR\_T.ProductCatalog.Infrastructure

   \# Ejecutar la API  
   dotnet run \--project ADR\_T.ProductCatalog.WebApi

   La API estará disponible en https://localhost:7175.

#### **7.2. Configuración del Frontend (Angular)**

1. **Instalar Dependencias**: En una nueva terminal, navega a la carpeta del frontend e instala los paquetes de npm:  
   cd ADR\_T.ProductCatalog.Frontend  
   npm install

2. **Ejecutar la Aplicación**:  
   npm start

   La aplicación se abrirá en http://localhost:4200.

### **8\. Usuarios de Prueba**

La base de datos se inicializa con los siguientes usuarios para que puedas probar los diferentes roles:

| Rol | Usuario | Contraseña | Permisos Principales |
| :---- | :---- | :---- | :---- |
| **Admin** | admin | Admin123\! | Acceso total: Crear, editar y eliminar. |
| **Usuario** | user | User123\! | Acceso de solo lectura. |

### **9\. Documentación Detallada**

Para un análisis más profundo de la arquitectura, patrones y decisiones de diseño, consulta los siguientes documentos:

* [**Análisis Backend**](Frontend_Angular.md)  
* [**Análisis Frontend**](Backend_NET.md)