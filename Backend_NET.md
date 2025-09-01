# **Backend .NET** 

## **1\. Filosofía Arquitectónica: Clean Architecture**

La base de todo el backend es una implementación rigurosa de la **Arquitectura Limpia** (Clean Architecture). Este enfoque organiza el software en capas concéntricas, cada una con una responsabilidad específica. La regla fundamental es la **Regla de Dependencia**: el código solo puede apuntar hacia adentro. Las capas internas no saben nada sobre las capas externas.

Esto se traduce en los siguientes beneficios clave:

* **Independencia de Frameworks:** La lógica de negocio no depende de la existencia de una API web.  
* **Independencia de la Base de Datos:** Se puede cambiar de SQL Server a otro motor con un esfuerzo mínimo.  
* **Alta Testeabilidad:** La lógica de negocio y de aplicación se puede probar de forma aislada, sin necesidad de una base de datos o una interfaz de usuario.  
* **Mantenibilidad:** El código está organizado de forma lógica, lo que facilita encontrar, entender y modificar funcionalidades.

## **2\. Desglose por Proyecto (Capas)**

La solución se divide en cuatro proyectos principales, cada uno representando una capa de la arquitectura.

### **ADR\_T.ProductCatalog.Core (El Núcleo del Dominio)**

Esta es la capa más interna y más importante. Contiene la lógica de negocio fundamental y no tiene dependencias con ningún otro proyecto de la solución.

* **Propósito:** Definir las reglas y entidades del negocio.  
* **Dependencias:** Ninguna.

#### **Clases y Carpetas Clave:**

* **/Domain/Entities:**  
  * EntityBase.cs: Clase abstracta que proporciona propiedades comunes a todas las entidades (Id, FechacCreacion, FechacActualizacion, IsDeleted). Centraliza la lógica de auditoría básica.  
  * Product.cs y Category.cs: Son las **entidades de dominio**. Encapsulan no solo los datos (propiedades) sino también el comportamiento y las reglas de negocio (métodos como Update, SetName). Las validaciones internas (por ejemplo, que un nombre no sea nulo o exceda una longitud) se realizan aquí, lanzando una DomainException si se viola una regla.  
  * User.cs: Representa una vista simplificada del usuario para el dominio, desacoplada de la implementación de ASP.NET Core Identity.  
* **/Domain/Interfaces:**  
  * Define los **contratos** (abstracciones) que las capas externas deben implementar. Esto es crucial para la inversión de dependencias.  
  * IRepository\<T\>.cs: Contrato genérico para las operaciones de datos (CRUD), abstrayendo la tecnología de persistencia.  
  * IProductRepository.cs y ICategoryRepository.cs: Extienden el repositorio genérico con métodos específicos para sus entidades, como GetByIdWithCategoriesAsync para incluir datos relacionados.  
  * IUnitOfWork.cs: Define una transacción de negocio que agrupa múltiples operaciones de repositorio. Su propósito es garantizar la consistencia de los datos.  
  * ITokenService.cs, IUserRepository.cs, IFileStorageService.cs: Contratos para servicios de infraestructura (generación de tokens, gestión de usuarios y almacenamiento de archivos).  
* **/Domain/Exceptions:**  
  * Define excepciones personalizadas que tienen un significado específico dentro del dominio (DomainException, NotFoundException, ValidationException), permitiendo un manejo de errores más granular en las capas superiores.

### **ADR\_T.ProductCatalog.Application (La Lógica de Aplicación)**

Esta capa orquesta el flujo de datos y ejecuta los casos de uso de la aplicación. Implementa el patrón **CQRS (Command Query Responsibility Segregation)**.

* **Propósito:** Contener la lógica de los casos de uso. Actúa como mediador entre la capa de presentación (API) y la capa de dominio.  
* **Dependencias:** ADR\_T.ProductCatalog.Core.

#### **Clases y Carpetas Clave:**

* **/Features:** Es el corazón de esta capa. La lógica se organiza por entidad (Products, Categories, Auth) y luego por intención (Comandos o Consultas).  
  * **Comandos (Commands):** Representan una intención de cambiar el estado del sistema (Crear, Actualizar, Eliminar).  
    * CreateProductCommand.cs: Un DTO que encapsula los datos necesarios para crear un producto. Es un simple record.  
    * CreateProductCommandHandler.cs: La clase que contiene la lógica para manejar el comando. Recibe el comando, crea una nueva entidad Product, la añade a través del repositorio y confirma la transacción con IUnitOfWork.  
  * **Consultas (Queries):** Representan una solicitud de datos. No deben modificar el estado.  
    * GetAllProductsQuery.cs: Un DTO para solicitar una lista paginada de productos.  
    * GetAllProductsQueryHandler.cs: Maneja la consulta, llama al repositorio para obtener los datos, y utiliza AutoMapper para transformar las entidades de dominio en DTOs antes de devolverlos.  
* **/Common/Behaviors (Patrón Mediator Pipeline):**  
  * Estos son "middlewares" para el pipeline de MediatR. Interceptan cada comando/consulta antes de que llegue a su handler.  
  * ValidationPipelineBehavior.cs: Utiliza FluentValidation para validar automáticamente los comandos entrantes antes de que se ejecuten. Si la validación falla, lanza una ValidationException sin ejecutar la lógica de negocio, haciendo los handlers más limpios.  
  * PerformanceLoggingBehavior.cs: Mide y registra el tiempo de ejecución de cada solicitud, lo cual es invaluable para el monitoreo y la depuración.  
* **/DTOs:**  
  * Data Transfer Objects. Son clases simples que se utilizan para transferir datos entre capas, especialmente entre la capa de aplicación y la de presentación. Evitan exponer las entidades de dominio directamente a los clientes.  
* **/Mappings/MappingProfile.cs:**  
  * Configuración de AutoMapper para definir cómo se mapean las Entities a los DTOs y los Commands a las Entities.

### **ADR\_T.ProductCatalog.Infrastructure (La Infraestructura)**

Esta capa contiene las implementaciones concretas de las interfaces definidas en Core. Es donde residen todos los detalles técnicos y las dependencias de librerías externas.

* **Propósito:** Interactuar con sistemas externos (Base de Datos, Sistema de Archivos, Identity).  
* **Dependencias:** ADR\_T.ProductCatalog.Application (para implementar sus interfaces).

#### **Clases y Carpetas Clave:**

* **/Persistence:**  
  * AppDbContext.cs: La implementación de DbContext de Entity Framework Core. Gestiona la sesión con la base de datos.  
  * /Configurations: Contiene las configuraciones de las entidades (Fluent API) para definir el esquema de la base de datos (longitudes de campo, relaciones, índices).  
  * DataSeeder.cs: Una clase de utilidad para poblar la base de datos con datos iniciales (roles, usuarios, categorías) al iniciar la aplicación.  
* **/Repositories:**  
  * GenericRepository.cs: Una implementación base del IRepository\<T\> que reduce el código repetitivo.  
  * ProductRepository.cs: Implementación concreta de IProductRepository, incluyendo la lógica para cargar entidades relacionadas (Include(p \=\> p.Category)).  
  * UserRepository.cs: Implementación de IUserRepository que actúa como un adaptador sobre UserManager y SignInManager de ASP.NET Core Identity.  
* **/Services:**  
  * TokenService.cs: Implementación de ITokenService que utiliza la configuración de la app para generar tokens JWT.  
  * LocalFileStorageService.cs: Implementación de IFileStorageService que guarda archivos en el sistema de archivos local (wwwroot).  
* **DependencyInjection.cs:** Archivo de extensión que agrupa el registro de todas las dependencias de esta capa en el contenedor de DI.

### **ADR\_T.ProductCatalog.WebApi (La Capa de Presentación)**

La capa más externa. Su única responsabilidad es manejar las peticiones HTTP, exponer los endpoints de la API y comunicarse con la capa de aplicación a través de MediatR.

* **Propósito:** Exponer la funcionalidad de la aplicación como una API RESTful.  
* **Dependencias:** ADR\_T.ProductCatalog.Infrastructure y ADR\_T.ProductCatalog.Application.

#### **Clases y Carpetas Clave:**

* **/Controllers:**  
  * Los controladores son **extremadamente delgados**. Su única función es recibir una petición HTTP, construir un comando o consulta, enviarlo a través de MediatR (\_mediator.Send(...)) y devolver el resultado como una respuesta HTTP (Ok, CreatedAtAction, NoContent). No contienen lógica de negocio.  
* **/Middleware:**  
  * ExceptionHandlingMiddleware.cs: Middleware global que captura todas las excepciones no controladas. Formatea las ValidationException y NotFoundException en respuestas HTTP 400 y 404 estructuradas, y cualquier otra excepción en una respuesta 500 genérica.  
  * RequestLoggingMiddleware.cs: Registra cada petición entrante y su duración total, proporcionando una visibilidad completa del tráfico de la API.  
* **Program.cs:**  
  * El **Composition Root** de la aplicación. Aquí se configura el pipeline de ASP.NET Core (middlewares, CORS, autenticación) y se registran todos los servicios de las diferentes capas en el contenedor de Inyección de Dependencias.  
* **appsettings.json:**  
  * Contiene toda la configuración externa: cadena de conexión a la base de datos, configuración de JWT y configuración de Serilog para el logging.

## **3\. Patrones de Diseño Empleados (Resumen)**

* **Clean Architecture:** Estructura general para la separación de responsabilidades.  
* **CQRS (Command Query Responsibility Segregation):** Separa las operaciones de escritura (Commands) de las de lectura (Queries), permitiendo optimizar cada una de forma independiente.  
* **Mediator:** Utilizado a través de la librería MediatR para desacoplar los Controllers de los Handlers de comandos/consultas. El controlador no sabe quién maneja la solicitud, solo la envía.  
* **Repository:** Abstrae el acceso a datos, permitiendo que la capa de aplicación trabaje con colecciones de objetos sin conocer los detalles de la base de datos.  
* **Unit of Work:** Garantiza que múltiples operaciones de escritura se completen de forma atómica como una única transacción.  
* **Dependency Injection (DI):** Usado extensivamente en toda la solución para gestionar las dependencias y promover el código desacoplado y testeable.  
* **Middleware:** Utilizado en la capa de API para manejar preocupaciones transversales como el logging y el manejo de excepciones.

## **4\. Flujo de una Petición: Crear un Producto**

Para consolidar todos estos conceptos, sigamos el flujo de una petición POST /api/products:

1. **WebApi:** La petición HTTP llega a ProductsController.cs.  
2. **WebApi:** El controlador crea el objeto CreateProductCommand a partir del cuerpo de la petición.  
3. **WebApi:** Llama a \_mediator.Send(command).  
4. **Application (Pipeline):** MediatR invoca los Behaviors. PerformanceLoggingBehavior inicia un cronómetro. ValidationPipelineBehavior valida el comando.  
5. **Application (Handler):** Si la validación es exitosa, se invoca CreateProductCommandHandler.Handle().  
6. **Application (Handler):** El handler crea una nueva entidad Product (invocando la lógica de validación del dominio en su constructor).  
7. **Core (Interfaces):** El handler llama a \_unitOfWork.ProductRepository.AddAsync(product).  
8. **Infrastructure (Implementación):** La implementación del repositorio en ProductRepository.cs añade la entidad al DbContext.  
9. **Core (Interfaces):** El handler llama a \_unitOfWork.CommitAsync().  
10. **Infrastructure (Implementación):** La implementación de UnitOfWork llama a \_context.SaveChangesAsync(), y EF Core genera y ejecuta el SQL para insertar el nuevo producto en la base de datos dentro de una transacción.  
11. El resultado (el Id del nuevo producto) viaja de vuelta a través de las capas.  
12. **WebApi:** ProductsController recibe el Id y devuelve una respuesta 201 Created con la ubicación del nuevo recurso.

## 

El backend del proyecto es un ejemplo de cómo aplicar principios de diseño de software modernos en una aplicación .NET. La estricta adhesión a la Arquitectura Limpia y patrones como CQRS y Mediator resulta en un sistema que no solo es funcional, sino también **mantenible, testeable y preparado para crecer**.