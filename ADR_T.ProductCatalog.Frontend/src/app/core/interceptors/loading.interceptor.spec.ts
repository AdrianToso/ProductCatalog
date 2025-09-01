import { TestBed } from '@angular/core/testing';
import {
  HttpClientTestingModule,
  HttpTestingController,
} from '@angular/common/http/testing';
import { HTTP_INTERCEPTORS, HttpClient } from '@angular/common/http';

import { LoadingInterceptor } from './loading.interceptor';
import { LoadingService } from '../services/loading.service';

describe('LoadingInterceptor', () => {
  let httpMock: HttpTestingController;
  let httpClient: HttpClient;
  let loadingService: LoadingService;

  // 1. Creamos un mock del LoadingService
  // Usamos jest.fn() para poder espiar si los métodos 'show' y 'hide' son llamados.
  const loadingServiceMock = {
    show: jest.fn(),
    hide: jest.fn(),
  };

  beforeEach(() => {
    TestBed.configureTestingModule({
      // 2. Importamos HttpClientTestingModule para poder simular peticiones HTTP
      imports: [HttpClientTestingModule],
      providers: [
        // 3. Proveemos el interceptor real que vamos a probar
        {
          provide: HTTP_INTERCEPTORS,
          useClass: LoadingInterceptor,
          multi: true, // Es importante para los interceptors
        },
        // 4. En lugar de proveer el LoadingService real, usamos nuestro mock
        {
          provide: LoadingService,
          useValue: loadingServiceMock,
        },
      ],
    });

    // 5. Inyectamos las dependencias que usaremos en los tests
    httpMock = TestBed.inject(HttpTestingController);
    httpClient = TestBed.inject(HttpClient);
    loadingService = TestBed.inject(LoadingService);
  });
  
  // Verificamos que no queden peticiones pendientes después de cada test
  afterEach(() => {
    httpMock.verify();
  });

  it('should be created', () => {
    // Para probar que se crea, simplemente verificamos que el httpClient existe,
    // lo que implica que el módulo de testing se configuró correctamente.
    expect(httpClient).toBeTruthy();
  });

  it('should call loadingService.show() on request and loadingService.hide() on finalize', () => {
    // Arrange: Hacemos una petición HTTP. No nos importa la respuesta, solo que se ejecute.
    httpClient.get('/api/test').subscribe();

    // Assert (show): Justo después de iniciar la petición, 'show()' debe haber sido llamado.
    expect(loadingService.show).toHaveBeenCalledTimes(1);

    // Act: Capturamos la petición pendiente con el controlador de testing.
    const req = httpMock.expectOne('/api/test');
    
    // Simulamos que la petición termina exitosamente.
    req.flush({}); 

    // Assert (hide): Una vez que la petición ha finalizado (gracias al operador finalize),
    // el método 'hide()' debe haber sido llamado.
    expect(loadingService.hide).toHaveBeenCalledTimes(1);
  });
});