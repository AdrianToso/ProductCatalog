# **Catálogo de Productos \- Frontend (ADR\_T.ProductCatalog.Frontend)**

Este proyecto es la interfaz de usuario (UI) para la aplicación de Catálogo de Productos, desarrollada como una Aplicación de Página Única (SPA) utilizando Angular.

## **Tecnologías y Librerías Principales**

* **Angular (\~v20):** Framework principal para el desarrollo de la aplicación.  
* **TypeScript:** Lenguaje de programación principal.  
* **RxJS:** Para la gestión de operaciones asíncronas y programación reactiva.  
* **Angular Material:** Biblioteca de componentes de UI para un diseño consistente y profesional.  
* **SCSS:** Preprocesador de CSS para estilos avanzados y mantenibles.  
* **Angular CLI:** Para la gestión, construcción y testing del proyecto.

## **Arquitectura y Estructura del Proyecto**

La aplicación sigue las mejores prácticas de Angular, con una estructura modular y organizada para facilitar la escalabilidad y el mantenimiento.

* src/app/core: Contiene la lógica central y los servicios singleton, como los interceptores HTTP (AuthInterceptor, LoadingInterceptor) y el manejo de estado global (ProductsStateService).  
* src/app/shared: Módulos, componentes y pipes reutilizables en toda la aplicación, como el MaterialModule.  
* src/app/layout: Define la estructura visual principal de la aplicación (el *shell*) con la navegación y el router-outlet.  
* src/app/products: Módulo de funcionalidad (feature module) que encapsula todo lo relacionado con la gestión de productos (listado, formularios, modelos de datos y servicios).  
* src/app/auth: Módulo de funcionalidad dedicado a la autenticación de usuarios.

## **Puesta en Marcha**

Sigue estos pasos para configurar y ejecutar el proyecto en tu entorno de desarrollo local.

### **1\. Prerrequisitos**

* **Node.js:** Se recomienda la versión LTS. Puedes verificar tu versión con node \-v.  
* **Angular CLI:** Si no lo tienes, instálalo globalmente con npm install \-g @angular/cli.  
* **Backend en ejecución:** Asegúrate de que el proyecto backend (ADR\_T.ProductCatalog.WebApi) esté en ejecución, ya que esta aplicación necesita consumir su API. Por defecto, la API se espera en https://localhost:7175.

### **2\. Configuración del Entorno**

El archivo de configuración de entorno se encuentra en src/environments/environment.ts. La propiedad apiUrl debe apuntar a la URL base de tu API de backend.

// src/environments/environment.ts  
export const environment \= {  
  production: false,  
  apiUrl: '/api/' // Proxy configurado o URL completa como 'https://localhost:7175/api/'  
};

*Nota: El proyecto está configurado para usar un proxy (proxy.conf.json) que redirige las peticiones de /api al backend, simplificando la configuración durante el desarrollo.*

### **3\. Instalación y Ejecución**

1. Instalar dependencias:  
   Navega a la raíz de este proyecto (ADR\_T.ProductCatalog.Frontend) en tu terminal y ejecuta:  
   npm install

2. Iniciar el servidor de desarrollo:  
   Una vez instaladas las dependencias, ejecuta:  
   ng serve \-o

   o  
   npm start

   Este comando compilará la aplicación, iniciará un servidor de desarrollo y abrirá automáticamente tu navegador en http://localhost:4200/.

## **Scripts Disponibles**

Desde la carpeta raíz del proyecto, puedes ejecutar los siguientes scripts:

* npm start: Inicia el servidor de desarrollo.  
* npm run build: Compila la aplicación para producción en la carpeta dist/.  
* npm test: Ejecuta las pruebas unitarias con Jest.  
* npm run lint: Analiza el código fuente en busca de errores de estilo con ESLint.