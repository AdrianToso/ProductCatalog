# **Frontend Angular (ADR\_T.ProductCatalog.Frontend)**

## **1\. Filosofía Arquitectónica: Single Page Application (SPA) Modular**

El frontend es una **Aplicación de Página Única (SPA)** construida con Angular. Este enfoque carga una única página HTML y actualiza dinámicamente el contenido a medida que el usuario interactúa con la aplicación, proporcionando una experiencia fluida y rápida similar a la de una aplicación de escritorio.

La arquitectura se fundamenta en los siguientes principios clave de Angular:

* **Modularidad:** La aplicación se organiza en módulos de funcionalidades cohesivas (NgModules), lo que permite la carga diferida (Lazy Loading) y una mejor organización del código.  
* **Arquitectura basada en Componentes:** La interfaz de usuario se construye como un árbol de componentes reutilizables, cada uno con su propia plantilla, estilos y lógica.  
* **Inyección de Dependencias (DI):** Angular gestiona la creación e inyección de servicios y otras dependencias, lo que promueve un código desacoplado y altamente testeable.  
* **Programación Reactiva (RxJS):** Se utiliza extensivamente para manejar eventos y operaciones asíncronas (como las llamadas HTTP), tratando los flujos de datos como streams observables.

## **2\. Análisis Detallado de la Estructura del Proyecto (/src/app)**

La carpeta /src/app es el corazón de la aplicación y está organizada de manera lógica siguiendo las mejores prácticas de Angular.

### **Carpetas Estructurales y de Funcionalidades Clave**

* **/core (Lógica Central y Singleton)**  
  * **Propósito:** Contiene servicios y lógica que deben ser instanciados una sola vez en toda la aplicación (singletons). Es el lugar ideal para la lógica transversal.  
  * **/interceptors:**  
    * auth.interceptor.ts: **(Patrón Interceptor)** Se interceptan todas las solicitudes HTTP salientes para añadir automáticamente el token JWT en la cabecera Authorization. Esto centraliza la lógica de autenticación de las peticiones.  
    * loading.interceptor.ts: Gestiona de forma global el estado de carga. Llama a loadingService.show() antes de enviar una petición y a loadingService.hide() cuando se completa (ya sea con éxito o error), mostrando un spinner a nivel de aplicación.  
  * **/state:**  
    * products-state.service.ts: **(Patrón Fachada de Estado)**. Una implementación simple pero efectiva de manejo de estado. Este servicio utiliza BehaviorSubject de RxJS para mantener el estado de los productos, la paginación, el estado de carga y los errores. Los componentes se suscriben a sus observables (products$, loading$, etc.) para reaccionar a los cambios de estado. Centraliza la lógica de estado en un único lugar.  
  * **/services:**  
    * loading.service.ts: Servicio simple que expone un BehaviorSubject para controlar la visibilidad del spinner de carga global.  
  * **role.guard.ts:** **(Patrón Guard)** Protege rutas para que solo sean accesibles por usuarios con roles específicos (ej. 'Admin', 'Editor'), mejorando la seguridad del lado del cliente.  
* **/shared (Recursos Compartidos)**  
  * **Propósito:** Contiene componentes, directivas, pipes y módulos que se utilizan en varias partes de la aplicación.  
  * material.module.ts: Un módulo dedicado a importar y exportar todos los componentes de Angular Material necesarios. Esto mantiene el AppModule principal más limpio.  
  * shared.module.ts: Módulo que declara y exporta componentes, pipes (BytesPipe) y directivas compartidas para que otros módulos puedan importarlos fácilmente.  
* **/layout (Estructura Visual Principal)**  
  * layout.component.ts: Es el componente principal de la aplicación que define la estructura visual (shell), incluyendo la barra de navegación lateral (sidenav) y la barra de herramientas superior. Contiene la etiqueta \<router-outlet\>, donde Angular renderiza los componentes de las rutas activas.  
* **/products (Módulo de Funcionalidad)**  
  * **Propósito:** Es un **módulo de funcionalidad (feature module)** que encapsula todo lo relacionado con la gestión de productos. Está configurado para ser cargado de forma diferida (Lazy Loading).  
  * **/models:** Contiene las interfaces de TypeScript (product.model.ts, category.model.ts) que definen la estructura de los datos que se reciben de la API. Proporcionan tipado estático y autocompletado.  
  * **/services:**  
    * product.service.ts y category.service.ts: **(Patrón Servicio)** Encapsulan toda la lógica de comunicación con la API para sus respectivas entidades. Utilizan HttpClient de Angular y devuelven Observables.  
  * **/product-list:**  
    * product-list.component.ts: Componente inteligente (smart component) responsable de orquestar la visualización de la lista de productos. Se comunica con el ProductsStateService para obtener los datos y maneja las interacciones del usuario (paginación, abrir diálogos de edición/creación, eliminar).  
  * **/product-form-dialog:**  
    * product-form-dialog.component.ts: Componente de presentación (presentational component) que se muestra en un diálogo modal de Angular Material. Contiene el formulario reactivo (ReactiveFormsModule) para crear o editar un producto, incluyendo la lógica de validación y la subida de archivos de imagen.  
* **/auth (Módulo de Autenticación)**  
  * **Propósito:** Otro módulo de funcionalidad, encargado del login de usuarios.  
  * auth.service.ts: Maneja las llamadas a la API para el login, el almacenamiento/borrado del token JWT en localStorage y gestiona el estado de autenticación a través de signals, el nuevo sistema de reactividad de Angular.  
  * login.component.ts: Contiene el formulario de login y la lógica para interactuar con el AuthService.

### **Archivos Raíz de la Aplicación**

* app.module.ts: El módulo raíz de la aplicación. Orquesta el ensamblaje de la aplicación, importando otros módulos y registrando proveedores globales como los interceptores HTTP.  
* app-routing.module.ts: Configura el enrutador principal. Define las rutas de la aplicación, incluyendo las rutas de carga diferida (loadChildren), que son clave para un buen rendimiento inicial.  
* app.component.ts: El componente raíz o "bootstrap" de la aplicación. Su plantilla (app.component.html) típicamente solo contiene el \<router-outlet\>.

## **3\. Flujo de una Petición: Eliminando un Producto**

Para ilustrar cómo todas las piezas funcionan juntas, sigamos el flujo de un usuario que elimina un producto:

1. **Vista (ProductListComponent):** El usuario hace clic en el ícono de eliminar de un producto en la product-list.component.html.  
2. **Componente (ProductListComponent):** El método confirmDelete(product) es invocado.  
3. **Diálogo de Confirmación:** El componente utiliza el servicio MatDialog de Angular Material para abrir el ConfirmDialogComponent, pasándole un mensaje de confirmación.  
4. **Interacción del Usuario:** El usuario hace clic en el botón "Eliminar" en el diálogo.  
5. **Cierre del Diálogo:** El diálogo se cierra, devolviendo true a través de su afterClosed() observable.  
6. **Llamada al Servicio:** Al recibir true, el ProductListComponent llama a su método privado deleteProduct(id).  
7. **Servicio de Producto (ProductService):** El método deleteProduct(id) es llamado. Este crea y ejecuta una petición HTTP DELETE a la URL api/Products/{id}.  
8. **Interceptors (/core):**  
   * El LoadingInterceptor se activa y llama a loadingService.show(), mostrando un spinner global.  
   * El AuthInterceptor se activa y añade la cabecera Authorization: Bearer \<token\> a la petición.  
9. **Backend:** La API recibe la petición, la procesa y elimina el producto.  
10. **Respuesta del Backend:** La API devuelve una respuesta 204 No Content.  
11. **Servicio y Componente:** El Observable de la petición HTTP en ProductService se completa. El subscribe en ProductListComponent ejecuta su next callback.  
12. **Actualización de Estado:** El componente llama a loadProducts(), que a su vez solicita al ProductService la nueva lista paginada de productos. El resultado se pasa al ProductsStateService, que actualiza su BehaviorSubject.  
13. **Reactividad de la Vista:** Todos los componentes suscritos al products$ del ProductsStateService (en este caso, el ProductListComponent) reciben automáticamente la nueva lista de productos (sin el que fue eliminado) y la vista se actualiza de forma reactiva.  
14. **Interceptors (Finalización):**  
    * Al completarse la petición, el finalize del LoadingInterceptor se ejecuta, llamando a loadingService.hide() y ocultando el spinner.

## **4\. Archivos de Configuración**

* angular.json: Define la configuración del workspace de Angular CLI. Controla cómo se construye (build), sirve (serve) y prueba (test) el proyecto. Aquí se configuran los archivos de polyfills, estilos globales y scripts.  
* package.json: Define las dependencias del proyecto (Angular, RxJS, Angular Material) y los scripts de npm (start, build, test, lint) para automatizar tareas comunes.  
* tsconfig.json: Archivo de configuración de TypeScript que define las opciones del compilador.

## **Conclusión**

El frontend está construido sobre una base sólida y escalable, aprovechando al máximo las características de Angular. La arquitectura modular, el claro sistema de inyección de dependencias, el manejo de estado centralizado y el uso de la programación reactiva dan como resultado una aplicación:

* **Organizada:** Fácil de navegar y entender gracias a la separación por funcionalidades.  
* **Reactiva:** La interfaz de usuario responde automáticamente a los cambios en el estado de los datos.  
* **Mantenible:** Las responsabilidades están claramente delimitadas entre componentes, servicios e interceptores.  
* **Eficiente:** La carga diferida de módulos asegura que la aplicación se inicie rápidamente, cargando funcionalidades solo cuando son necesarias.

El frontend está diseñado para consumir la API del backend, creando una experiencia de usuario cohesiva y moderna.