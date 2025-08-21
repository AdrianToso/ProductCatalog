# Informe de Proyecto Angular

## Estructura de la Carpeta `src`

```text
src/
  - **app/**
    - app-routing.module.ts
    - app.component.html
    - app.component.scss
    - app.component.spec.ts
    - app.component.ts
    - app.module.ts
    - **auth/**
      - auth.module.ts
      - auth.service.spec.ts
      - auth.service.ts
      - login.component.html
      - login.component.scss
      - login.component.ts
    - **core/**
      - **interceptors/**
        - auth.interceptor.spec.ts
        - auth.interceptor.ts
        - loading.interceptor.spec.ts
        - loading.interceptor.ts
      - role.guard.ts
      - **services/**
        - loading.service.spec.ts
        - loading.service.ts
      - **state/**
        - products-state.service.spec.ts
        - products-state.service.ts
    - **home/**
      - home.component.html
      - home.component.scss
      - home.component.ts
      - home.module.ts
    - **layout/**
      - layout.component.html
      - layout.component.scss
      - layout.component.spec.ts
      - layout.component.ts
      - layout.module.ts
    - **products/**
      - **confirm-dialog/**
        - confirm-dialog.component.html
        - confirm-dialog.component.scss
        - confirm-dialog.component.ts
      - **models/**
        - category.model.ts
        - create-product.dto.ts
        - paginated-result.model.ts
        - product.model.ts
        - update-product.dto.ts
      - **product-form/**
        - product-form.component.html
        - product-form.component.scss
        - product-form.component.ts
      - **product-list/**
        - product-list.component.html
        - product-list.component.scss
        - product-list.component.spec.ts
        - product-list.component.ts
      - product.service.spec.ts
      - product.service.ts
      - products-routing.module.ts
      - products.module.ts
      - **services/**
        - category.service.ts
    - **shared/**
      - **components/**
        - **loading-spinner/**
          - loading-spinner.component.html
          - loading-spinner.component.scss
          - loading-spinner.component.spec.ts
          - loading-spinner.component.ts
      - material.module.ts
  - **environments/**
    - environment.prod.ts
    - environment.ts
  - index.html
  - main.ts
  - styles.scss
```

## Archivos de Configuración JSON (Raíz del Proyecto)

### angular.json
`Ruta:` C:\Users\ADR_T\source\repos\ADR_T.ProductCatalog\ADR_T.ProductCatalog.Frontend\angular.json
```json
{
  "$schema": "./node_modules/@angular/cli/lib/config/schema.json",
  "version": 1,
  "newProjectRoot": "projects",
  "projects": {
    "ADR_T.ProductCatalog.Frontend": {
      "projectType": "application",
      "schematics": {
        "@schematics/angular:component": {
          "style": "scss",
          "standalone": false
        },
        "@schematics/angular:directive": {
          "standalone": false
        },
        "@schematics/angular:pipe": {
          "standalone": false
        }
      },
      "root": "",
      "sourceRoot": "src",
      "prefix": "app",
      "architect": {
        "build": {
          "builder": "@angular-devkit/build-angular:application",
          "options": {
            "outputPath": "dist/adr-t.product-catalog.frontend",
            "index": "src/index.html",
            "browser": "src/main.ts",
            "polyfills": [
              "zone.js"
            ],
            "tsConfig": "tsconfig.app.json",
            "inlineStyleLanguage": "scss",
            "assets": [
              {
                "glob": "**/*",
                "input": "public"
              }
            ],
            "styles": [
              "@angular/material/prebuilt-themes/azure-blue.css",
              "src/styles.scss"
            ],
            "scripts": []
          },
          "configurations": {
            "production": {
              "budgets": [
                {
                  "type": "initial",
                  "maximumWarning": "500kB",
                  "maximumError": "1MB"
                },
                {
                  "type": "anyComponentStyle",
                  "maximumWarning": "4kB",
                  "maximumError": "8kB"
                }
              ],
              "outputHashing": "all"
            },
            "development": {
              "optimization": false,
              "extractLicenses": false,
              "sourceMap": true
            }
          },
          "defaultConfiguration": "production"
        },
        "serve": {
          "builder": "@angular-devkit/build-angular:dev-server",
          "configurations": {
            "production": {
              "buildTarget": "ADR_T.ProductCatalog.Frontend:build:production"
            },
            "development": {
              "buildTarget": "ADR_T.ProductCatalog.Frontend:build:development"
            }
          },
          "defaultConfiguration": "development"
        },
        "extract-i18n": {
          "builder": "@angular-devkit/build-angular:extract-i18n"
        },
        "test": {
          "builder": "@angular-devkit/build-angular:karma",
          "options": {
            "polyfills": [
              "zone.js",
              "zone.js/testing"
            ],
            "tsConfig": "tsconfig.spec.json",
            "inlineStyleLanguage": "scss",
            "assets": [
              {
                "glob": "**/*",
                "input": "public"
              }
            ],
            "styles": [
              "src/styles.scss"
            ],
            "scripts": []
          }
        },
        "lint": {
          "builder": "@angular-eslint/builder:lint",
          "options": {
            "lintFilePatterns": [
              "src/**/*.ts",
              "src/**/*.html"
            ]
          }
        }
      }
    }
  },
  "cli": {
    "schematicCollections": [
      "angular-eslint"
    ]
  }
}

```

### package.json
`Ruta:` C:\Users\ADR_T\source\repos\ADR_T.ProductCatalog\ADR_T.ProductCatalog.Frontend\package.json
```json
{
  "name": "adr-t.product-catalog.frontend",
  "version": "0.0.0",
  "scripts": {
    "ng": "ng",
    "start": "ng serve",
    "build": "ng build",
    "watch": "ng build --watch --configuration development",
    "test": "ng test",
    "lint": "ng lint"
  },
  "private": true,
  "dependencies": {
    "@angular/animations": "^19.2.14",
    "@angular/cdk": "^19.2.19",
    "@angular/common": "^19.0.0",
    "@angular/compiler": "^19.0.0",
    "@angular/core": "^19.0.0",
    "@angular/forms": "^19.0.0",
    "@angular/material": "^19.2.19",
    "@angular/platform-browser": "^19.0.0",
    "@angular/platform-browser-dynamic": "^19.0.0",
    "@angular/router": "^19.0.0",
    "rxjs": "~7.8.0",
    "tslib": "^2.3.0",
    "zone.js": "~0.15.0"
  },
  "devDependencies": {
    "@angular-devkit/build-angular": "^19.0.7",
    "@angular/cli": "^19.0.7",
    "@angular/compiler-cli": "^19.0.0",
    "@types/jasmine": "~5.1.0",
    "@types/node": "^24.3.0",
    "angular-eslint": "20.1.1",
    "eslint": "^9.29.0",
    "jasmine-core": "~5.4.0",
    "karma": "~6.4.0",
    "karma-chrome-launcher": "~3.2.0",
    "karma-coverage": "~2.2.0",
    "karma-jasmine": "~5.1.0",
    "karma-jasmine-html-reporter": "~2.1.0",
    "sass": "^1.90.0",
    "typescript": "~5.6.2",
    "typescript-eslint": "8.34.1"
  }
}

```

### tsconfig.app.json
`Ruta:` C:\Users\ADR_T\source\repos\ADR_T.ProductCatalog\ADR_T.ProductCatalog.Frontend\tsconfig.app.json
```json
/* To learn more about Typescript configuration file: https://www.typescriptlang.org/docs/handbook/tsconfig-json.html. */
/* To learn more about Angular compiler options: https://angular.dev/reference/configs/angular-compiler-options. */
{
  "extends": "./tsconfig.json",
  "compilerOptions": {
    "outDir": "./out-tsc/app",
    "types": []
  },
  "files": [
    "src/main.ts"
  ],
  "include": [
    "src/**/*.d.ts"
  ]
}

```

### tsconfig.json
`Ruta:` C:\Users\ADR_T\source\repos\ADR_T.ProductCatalog\ADR_T.ProductCatalog.Frontend\tsconfig.json
```json
/* To learn more about Typescript configuration file: https://www.typescriptlang.org/docs/handbook/tsconfig-json.html. */
/* To learn more about Angular compiler options: https://angular.dev/reference/configs/angular-compiler-options. */
{
  "compileOnSave": false,
  "compilerOptions": {
    "outDir": "./dist/out-tsc",
    "strict": true,
    "noImplicitOverride": true,
    "noPropertyAccessFromIndexSignature": true,
    "noImplicitReturns": true,
    "noFallthroughCasesInSwitch": true,
    "skipLibCheck": true,
    "isolatedModules": true,
    "esModuleInterop": true,
    "experimentalDecorators": true,
    "moduleResolution": "bundler",
    "importHelpers": true,
    "target": "ES2022",
    "module": "ES2022"
  },
  "angularCompilerOptions": {
    "enableI18nLegacyMessageIdFormat": false,
    "strictInjectionParameters": true,
    "strictInputAccessModifiers": true,
    "strictTemplates": true
  }
}

```

### tsconfig.spec.json
`Ruta:` C:\Users\ADR_T\source\repos\ADR_T.ProductCatalog\ADR_T.ProductCatalog.Frontend\tsconfig.spec.json
```json
/* To learn more about Typescript configuration file: https://www.typescriptlang.org/docs/handbook/tsconfig-json.html. */
/* To learn more about Angular compiler options: https://angular.dev/reference/configs/angular-compiler-options. */
{
  "extends": "./tsconfig.json",
  "compilerOptions": {
    "outDir": "./out-tsc/spec",
    "types": [
      "jasmine"
    ]
  },
  "include": [
    "src/**/*.spec.ts",
    "src/**/*.d.ts"
  ]
}

```

## Archivos `.ts` en `src` y su Contenido

### src\main.ts
```ts
import { platformBrowserDynamic } from '@angular/platform-browser-dynamic';
import { AppModule } from './app/app.module';

platformBrowserDynamic().bootstrapModule(AppModule, {
  ngZoneEventCoalescing: true,
})
  .catch(err => console.error(err));

```

### src\app\app-routing.module.ts
```ts
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { LayoutComponent } from './layout/layout.component';

const routes: Routes = [
  {
    path: '',
    component: LayoutComponent,
    children: [
      { path: '', pathMatch: 'full', redirectTo: 'home' },
      {
        path: 'home',
        loadChildren: () =>
          import('./home/home.module').then((m) => m.HomeModule),
      },
      {
        path: 'products',
        loadChildren: () =>
          import('./products/products.module').then((m) => m.ProductsModule),
      },
      {
        path: 'auth',
        loadChildren: () =>
          import('./auth/auth.module').then((m) => m.AuthModule),
      },
    ],
  },
  { path: '**', redirectTo: '' },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
})
export class AppRoutingModule {}

```

### src\app\app.component.spec.ts
```ts
import { TestBed } from '@angular/core/testing';
import { RouterModule } from '@angular/router';
import { AppComponent } from './app.component';

describe('AppComponent', () => {
  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [
        RouterModule.forRoot([])
      ],
      declarations: [
        AppComponent
      ],
    }).compileComponents();
  });

  it('should create the app', () => {
    const fixture = TestBed.createComponent(AppComponent);
    const app = fixture.componentInstance;
    expect(app).toBeTruthy();
  });

  it(`should have as title 'ADR_T.ProductCatalog.Frontend'`, () => {
    const fixture = TestBed.createComponent(AppComponent);
    const app = fixture.componentInstance;
    expect(app.title).toEqual('ADR_T.ProductCatalog.Frontend');
  });

  it('should render title', () => {
    const fixture = TestBed.createComponent(AppComponent);
    fixture.detectChanges();
    const compiled = fixture.nativeElement as HTMLElement;
    expect(compiled.querySelector('h1')?.textContent).toContain('Hello, ADR_T.ProductCatalog.Frontend');
  });
});

```

### src\app\app.component.ts
```ts
import { Component, WritableSignal } from '@angular/core';
import { Router } from '@angular/router';
import { AuthService } from './auth/auth.service';

@Component({
  standalone: false,
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {
  
  isLoggedIn: WritableSignal<boolean>;
  
  constructor(private router: Router, private authService: AuthService) {
    this.isLoggedIn = this.authService.isLoggedInSig;
  }

  onLogout(): void {
    this.authService.logout();
    this.router.navigate(['/auth/login']);
  }
}
```

### src\app\app.module.ts
```ts
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { HttpClientModule } from '@angular/common/http'; 

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { LayoutModule } from './layout/layout.module';
import { MaterialModule } from './shared/material.module';

@NgModule({
  declarations: [AppComponent],  
  imports: [
    BrowserModule,
    BrowserAnimationsModule,
    AppRoutingModule,
    LayoutModule,   
    MaterialModule,
    HttpClientModule,
  ],
  providers: [],
  bootstrap: [AppComponent],
})
export class AppModule {}

```

### src\environments\environment.prod.ts
```ts
export const environment = {
  production: true,
  apiUrl: 'http://yourproductionapi.com/api/'
};
```

### src\environments\environment.ts
```ts
export const environment = {
  production: false,
  apiUrl: 'https://localhost:7175/api/'
};
```

### src\app\auth\auth.module.ts
```ts
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { HttpClientModule } from '@angular/common/http';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { RouterModule } from '@angular/router';
import { MaterialModule } from '../shared/material.module';
import { LoginComponent } from './login.component';

@NgModule({
  declarations: [
    LoginComponent
  ],
  imports: [
    CommonModule,
    FormsModule,
    ReactiveFormsModule,
    MaterialModule,
    HttpClientModule, 
    RouterModule.forChild([{ path: 'login', component: LoginComponent }])
  ]
})
export class AuthModule { }
```

### src\app\auth\auth.service.spec.ts
```ts
import { TestBed } from '@angular/core/testing';
import { HttpClientTestingModule, HttpTestingController } from '@angular/common/http/testing';
import { AuthService } from './auth.service';
import { environment } from '../../environments/environment';

describe('AuthService', () => {
  let service: AuthService;
  let httpMock: HttpTestingController;
  const apiUrl = `${environment.apiUrl}Auth`;

  // Crear un token JWT de prueba con payload decodificable
  // Payload: { "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name": "admin", "http://schemas.microsoft.com/ws/2008/06/identity/claims/role": "Admin", ... }
  const fakeJwt = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWRtaW4iLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJBZG1pbiIsImV4cCI6MTczNTY4OTY2MSwiaXNzIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NzE3NSIsImF1ZCI6Imh0dHBzOi8vbG9jYWxob3N0OjQyMDAifQ.fakeSignature';

  beforeAll(() => {
    // Polyfill para atob en el entorno de prueba de Node.js (Karma)
    if (typeof window.atob === 'undefined') {
      window.atob = (str: string) => Buffer.from(str, 'base64').toString('binary');
    }
  });

  beforeEach(() => {
    TestBed.configureTestingModule({
      imports: [HttpClientTestingModule],
      providers: [AuthService]
    });
    service = TestBed.inject(AuthService);
    httpMock = TestBed.inject(HttpTestingController);
    
    // Limpiar localStorage antes de cada prueba
    localStorage.clear();
    service.isLoggedInSig.set(false);
    service.roleSig.set(null);
    service.userSig.set(null);
  });

  afterEach(() => {
    httpMock.verify();
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });

  describe('login', () => {
    it('should perform a POST request and store user data on successful login', () => {
      const mockResponse = {
        token: fakeJwt,
        expiresAt: new Date().toISOString()
      };

      service.login('admin', 'password').subscribe();

      const req = httpMock.expectOne(`${apiUrl}/login`);
      expect(req.request.method).toBe('POST');
      req.flush(mockResponse);

      expect(localStorage.getItem('token')).toBe(mockResponse.token);
      expect(localStorage.getItem('role')).toBe('Admin');
      expect(localStorage.getItem('userName')).toBe('admin');
      
      expect(service.isLoggedInSig()).toBe(true);
      expect(service.roleSig()).toBe('Admin');
      expect(service.userSig()).toBe('admin');
    });

    it('should clear user data and return an error on failed login', () => {
      const errorResponse = { status: 400, statusText: 'Bad Request' };

      service.login('wrong', 'user').subscribe({
        error: (err) => {
          expect(err).toBeTruthy();
          expect(err.message).toBe('Usuario o contraseña incorrectos.');
        }
      });

      const req = httpMock.expectOne(`${apiUrl}/login`);
      expect(req.request.method).toBe('POST');
      req.flush('Invalid credentials', errorResponse);

      expect(localStorage.getItem('token')).toBeNull();
      expect(service.isLoggedInSig()).toBe(false);
    });
  });

  describe('logout', () => {
    it('should clear all authentication data from localStorage and signals', () => {
      localStorage.setItem('token', 'some-token');
      localStorage.setItem('role', 'Admin');
      localStorage.setItem('userName', 'testuser');
      service.isLoggedInSig.set(true);

      service.logout();

      expect(localStorage.getItem('token')).toBeNull();
      expect(localStorage.getItem('role')).toBeNull();
      expect(localStorage.getItem('userName')).toBeNull();
      expect(service.isLoggedInSig()).toBe(false);
      expect(service.roleSig()).toBeNull();
      expect(service.userSig()).toBeNull();
    });
  });
});
```

### src\app\auth\auth.service.ts
```ts
import { Injectable, signal } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from '../../environments/environment';
import { Observable, tap, catchError, throwError } from 'rxjs';

interface AuthResponse {
  token: string;
  expiresAt: string;
}

@Injectable({ providedIn: 'root' })
export class AuthService {
  private apiUrl = `${environment.apiUrl}Auth`;
  
  isLoggedInSig = signal<boolean>(this.hasToken());
  roleSig = signal<string | null>(this.getRole());
  userSig = signal<string | null>(this.getUsername());

  constructor(private http: HttpClient) {}

  login(username: string, password: string): Observable<AuthResponse> {
    return this.http.post<AuthResponse>(`${this.apiUrl}/login`, { username, password })
      .pipe(
        tap(res => {
          localStorage.setItem('token', res.token);
          const decoded = this.decodeToken(res.token);
          
          if (decoded) {
            localStorage.setItem('role', decoded.role);
            localStorage.setItem('userName', decoded.unique_name);
            this.isLoggedInSig.set(true);
            this.roleSig.set(decoded.role);
            this.userSig.set(decoded.unique_name);
          }
        }),
        catchError(_err => {
            this.logout();
            return throwError(() => new Error('Usuario o contraseña incorrectos.'));
        })
      );
  }

  logout(): void {
    localStorage.removeItem('token');
    localStorage.removeItem('role');
    localStorage.removeItem('userName');
    this.isLoggedInSig.set(false);
    this.roleSig.set(null);
    this.userSig.set(null);
  }

  getToken(): string | null {
    return localStorage.getItem('token');
  }
  
  hasToken(): boolean {
    return !!this.getToken();
  }

  getRole(): string | null {
    return localStorage.getItem('role');
  }
  
  getUsername(): string | null {
    return localStorage.getItem('userName');
  }

  isAdmin(): boolean {
    return this.getRole() === 'Admin';
  }

  private decodeToken(token: string): { role: string; unique_name: string } | null {
    try {
      const payload = token.split('.')[1];
      const decodedPayload = atob(payload);
      const parsed = JSON.parse(decodedPayload);
      return {
        role: parsed['http://schemas.microsoft.com/ws/2008/06/identity/claims/role'],
        unique_name: parsed['http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name']
      };
    } catch (e) {
      console.error('Error decoding token', e);
      return null;
    }
  }
}
```

### src\app\auth\login.component.ts
```ts
import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { AuthService } from './auth.service';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { finalize } from 'rxjs';

@Component({
  standalone: false,
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
export class LoginComponent {
  loginForm: FormGroup;
  loading = false;
  errorMessage = '';

  constructor(
    private fb: FormBuilder,
    private authService: AuthService,
    private router: Router
  ) {
    this.loginForm = this.fb.group({
      username: ['', Validators.required],
      password: ['', Validators.required]
    });
  }

  login(): void {
    if (this.loginForm.invalid) {
      return;
    }

    this.loading = true;
    this.errorMessage = '';
    const { username, password } = this.loginForm.value;

    this.authService.login(username, password)
      .pipe(
        finalize(() => this.loading = false)
      )
      .subscribe({
        next: () => {
          this.router.navigate(['/products']);
        },
        error: (err) => {
          this.errorMessage = err.message;
        }
      });
  }
}
```

### src\app\core\role.guard.ts
```ts
import { Injectable } from '@angular/core';
import { CanActivate, ActivatedRouteSnapshot, RouterStateSnapshot, UrlTree, Router } from '@angular/router';
import { Observable } from 'rxjs';
import { AuthService } from '../auth/auth.service';

@Injectable({
  providedIn: 'root'
})
export class RoleGuard implements CanActivate {
  constructor(private authService: AuthService, private router: Router) {}

  canActivate(
    route: ActivatedRouteSnapshot,
    _state: RouterStateSnapshot): Observable<boolean | UrlTree> | Promise<boolean | UrlTree> | boolean | UrlTree {

    const expectedRole = route.data['expectedRole'];
    const userRole = this.authService.getRole(); 

    if (userRole && userRole === expectedRole) {
      return true;
    }

    this.router.navigate(['/home']);
    return false;
  }
}
```

### src\app\home\home.component.ts
```ts
import { Component } from '@angular/core';

@Component({
  standalone: false,
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss']
})
export class HomeComponent {}

```

### src\app\home\home.module.ts
```ts
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule, Routes } from '@angular/router';

import { MaterialModule } from '../shared/material.module';
import { HomeComponent } from './home.component';

const routes: Routes = [
  { path: 'home', component: HomeComponent }
];

@NgModule({
  declarations: [HomeComponent],
  imports: [
    CommonModule,
    MaterialModule,
    RouterModule.forChild(routes)
  ]
})
export class HomeModule {}

```

### src\app\layout\layout.component.spec.ts
```ts
import { ComponentFixture, TestBed } from '@angular/core/testing';

import { LayoutComponent } from './layout/layout.component';

describe('LayoutComponent', () => {
  let component: LayoutComponent;
  let fixture: ComponentFixture<LayoutComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [LayoutComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(LayoutComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

```

### src\app\layout\layout.component.ts
```ts
import { Component, Signal, ViewChild } from '@angular/core';
import { Router } from '@angular/router';
import { MatSidenav } from '@angular/material/sidenav';
import { AuthService } from '../auth/auth.service';
import { BreakpointObserver, Breakpoints } from '@angular/cdk/layout';
import { Observable } from 'rxjs';
import { map, shareReplay, take } from 'rxjs/operators';

@Component({
  standalone: false,
  selector: 'app-layout',
  templateUrl: './layout.component.html',
  styleUrls: ['./layout.component.scss'],
})
export class LayoutComponent {
  @ViewChild('snav') snav!: MatSidenav;

  isHandset$: Observable<boolean>;
  isLoggedIn: Signal<boolean>;
  userName: Signal<string | null>;

  constructor(
    private authService: AuthService, 
    private router: Router,
    private breakpointObserver: BreakpointObserver
  ) {
    this.isHandset$ = this.breakpointObserver.observe(Breakpoints.Handset)
      .pipe(
        map(result => result.matches),
        shareReplay()
      );
      
    this.isLoggedIn = this.authService.isLoggedInSig;
    this.userName = this.authService.userSig;
  }

  onLogout(): void {
    this.authService.logout();
    this.router.navigate(['/auth/login']);
  }

  closeSidenavIfNeeded(): void {
    this.isHandset$.pipe(take(1)).subscribe(isHandset => {
      if (isHandset) {
        this.snav.close();
      }
    });
  }
}
```

### src\app\layout\layout.module.ts
```ts
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule } from '@angular/router';
import { LayoutModule as CdkLayoutModule } from '@angular/cdk/layout'; 

import { LayoutComponent } from './layout.component';
import { MaterialModule } from '../shared/material.module';

@NgModule({
  declarations: [LayoutComponent],
  imports: [CommonModule, RouterModule, MaterialModule, CdkLayoutModule ],
  exports: [LayoutComponent],
})
export class LayoutModule {}

```

### src\app\products\product.service.spec.ts
```ts
import { TestBed } from '@angular/core/testing';

import { ProductService } from './product.service';

describe('ProductService', () => {
  let service: ProductService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(ProductService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});

```

### src\app\products\product.service.ts
```ts
import { Injectable } from '@angular/core';
import { HttpClient, HttpParams } from '@angular/common/http';
import { Observable, catchError, throwError } from 'rxjs';
import { Product } from './models/product.model';
import { PaginatedResult } from './models/paginated-result.model';
import { environment } from '../../environments/environment';
import { CreateProductDto } from './models/create-product.dto';
import { UpdateProductDto } from './models/update-product.dto';

@Injectable({
  providedIn: 'root'
})
export class ProductService {
  private apiUrl = `${environment.apiUrl}Products`;

  constructor(private http: HttpClient) { }

  getProducts(pageNumber: number, pageSize: number): Observable<PaginatedResult<Product>> {
    const params = new HttpParams()
      .set('pageNumber', pageNumber.toString())
      .set('pageSize', pageSize.toString());

    return this.http.get<PaginatedResult<Product>>(this.apiUrl, { params })
      .pipe(catchError(this.handleError));
  }

  createProduct(product: CreateProductDto): Observable<string> {
    return this.http.post<string>(this.apiUrl, product)
      .pipe(catchError(this.handleError));
  }

  getProductById(id: string): Observable<Product> {
    return this.http.get<Product>(`${this.apiUrl}/${id}`)
      .pipe(catchError(this.handleError));
  }

  updateProduct(id: string, product: UpdateProductDto): Observable<void> {
    return this.http.put<void>(`${this.apiUrl}/${id}`, product)
      .pipe(catchError(this.handleError));
  }

  deleteProduct(id: string): Observable<void> {
    return this.http.delete<void>(`${this.apiUrl}/${id}`)
      .pipe(catchError(this.handleError));
  }

  private handleError(error: unknown): Observable<never> {
  console.error('API Error:', error);
  let errorMessage = 'Ocurrió un error inesperado.';
  
  // Manejo seguro de diferentes tipos de error
  if (typeof error === 'object' && error !== null) {
    const err = error as { error?: { title?: string }; message?: string };
    
    if (err.error?.title) {
      errorMessage = err.error.title;
    } else if (err.message) {
      errorMessage = err.message;
    }
  } else if (typeof error === 'string') {
    errorMessage = error;
  }
  
  return throwError(() => new Error(errorMessage));
}
}
```

### src\app\products\products-routing.module.ts
```ts
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { ProductListComponent } from './product-list/product-list.component';
import { ProductFormComponent } from './product-form/product-form.component';
import { RoleGuard } from '../core/role.guard';

const routes: Routes = [
  { path: '', component: ProductListComponent },
  { 
    path: 'create', 
    component: ProductFormComponent, 
    canActivate: [RoleGuard],
    data: { expectedRole: 'Admin' }
  },
  { 
    path: 'edit/:id', 
    component: ProductFormComponent,
    canActivate: [RoleGuard],
    data: { expectedRole: 'Admin' } 
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class ProductsRoutingModule { }
```

### src\app\products\products.module.ts
```ts
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule, Routes } from '@angular/router';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';

import { MaterialModule } from '../shared/material.module';
import { ProductListComponent } from './product-list/product-list.component';
import { ConfirmDialogComponent } from './confirm-dialog/confirm-dialog.component';

const routes: Routes = [
  { path: '', component: ProductListComponent },
];

@NgModule({
  declarations: [
    ProductListComponent,
    ConfirmDialogComponent,
  ],
  imports: [
    CommonModule,
    FormsModule,
    ReactiveFormsModule,
    MaterialModule,          // <- Toolbar, Card, Paginator, Dialog, etc.
    RouterModule.forChild(routes),
  ],
  exports: [ProductListComponent],
})
export class ProductsModule {}

```

### src\app\shared\material.module.ts
```ts
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

// Angular Material
import { MatToolbarModule } from '@angular/material/toolbar';
import { MatSidenavModule } from '@angular/material/sidenav';
import { MatListModule } from '@angular/material/list';
import { MatIconModule } from '@angular/material/icon';
import { MatButtonModule } from '@angular/material/button';
import { MatDividerModule } from '@angular/material/divider';
import { MatCardModule } from '@angular/material/card';
import { MatPaginatorModule } from '@angular/material/paginator';
import { MatProgressSpinnerModule } from '@angular/material/progress-spinner';
import { MatDialogModule } from '@angular/material/dialog';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';
import { MatMenuModule } from '@angular/material/menu';
import { MatSnackBarModule } from '@angular/material/snack-bar';
import { MatTooltipModule } from '@angular/material/tooltip';

const MATERIAL = [
  MatToolbarModule,
  MatSidenavModule,
  MatListModule,
  MatIconModule,
  MatButtonModule,
  MatDividerModule,
  MatCardModule,
  MatPaginatorModule,
  MatProgressSpinnerModule,
  MatDialogModule,
  MatFormFieldModule,
  MatInputModule,
  MatMenuModule,
  MatSnackBarModule,
  MatTooltipModule,
];

@NgModule({
  imports: [CommonModule, ...MATERIAL],
  exports: MATERIAL,
})
export class MaterialModule {}

```

### src\app\shared\components\loading-spinner\loading-spinner.component.spec.ts
```ts
import { ComponentFixture, TestBed } from '@angular/core/testing';

import { LoadingSpinnerComponent } from './loading-spinner.component';

describe('LoadingSpinnerComponent', () => {
  let component: LoadingSpinnerComponent;
  let fixture: ComponentFixture<LoadingSpinnerComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [LoadingSpinnerComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(LoadingSpinnerComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

```

### src\app\shared\components\loading-spinner\loading-spinner.component.ts
```ts
import { Component } from '@angular/core';
import { LoadingService } from '../../../core/services/loading.service';

@Component({
  standalone: false,
  selector: 'app-loading-spinner',
  templateUrl: './loading-spinner.component.html',
  styleUrls: ['./loading-spinner.component.scss']
})
export class LoadingSpinnerComponent {
  constructor(public loadingService: LoadingService) {}
}
```

### src\app\products\confirm-dialog\confirm-dialog.component.ts
```ts
import { Component, Inject } from '@angular/core';
import { MAT_DIALOG_DATA } from '@angular/material/dialog';

@Component({
  standalone: false,
  selector: 'app-confirm-dialog',
  templateUrl: './confirm-dialog.component.html',
  styleUrls: ['./confirm-dialog.component.scss']
})
export class ConfirmDialogComponent {
  constructor(@Inject(MAT_DIALOG_DATA) public data: { title: string; message: string }) {}
}

```

### src\app\products\models\category.model.ts
```ts
export interface Category {
  id: string;
  name: string;
  description?: string;
}
```

### src\app\products\models\create-product.dto.ts
```ts
export interface CreateProductDto {
  name: string;
  description: string;
  imageUrl?: string;
  categoryId: string;
}
```

### src\app\products\models\paginated-result.model.ts
```ts
export interface PaginatedResult<T> {
    pageNumber: number;
    pageSize: number;
    totalCount: number;
    totalPages: number;
    items: T[]; 
}
```

### src\app\products\models\product.model.ts
```ts
export interface Category {
  id: string;
  name: string;
  description?: string;
}

export interface Product {
  id: string;
  name: string;
  description: string;
  imageUrl?: string;
  category: Category;
}

```

### src\app\products\models\update-product.dto.ts
```ts
export interface UpdateProductDto {
  id: string; 
  name: string;
  description: string;
  imageUrl?: string;
  categoryId: string;
}
```

### src\app\products\product-form\product-form.component.ts
```ts
import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ProductService } from '../product.service';
import { CategoryService } from '../services/category.service';
import { Category } from '../models/category.model';
import { CreateProductDto } from '../models/create-product.dto';
import { UpdateProductDto } from '../models/update-product.dto';
import { Router, ActivatedRoute } from '@angular/router';

@Component({
  standalone: false,
  selector: 'app-product-form',
  templateUrl: './product-form.component.html',
  styleUrls: ['./product-form.component.scss']
})
export class ProductFormComponent implements OnInit {
  productForm: FormGroup;
  categories: Category[] = [];
  loading = false;
  errorMessage = '';
  isEditMode = false;
  productId: string | null = null;

  constructor(
    private fb: FormBuilder,
    private productService: ProductService,
    private categoryService: CategoryService,
    private router: Router,
    private route: ActivatedRoute
  ) {
    this.productForm = this.fb.group({
      name: ['', [Validators.required, Validators.maxLength(200)]],
      description: ['', [Validators.required, Validators.maxLength(500)]],
      imageUrl: [''],
      categoryId: ['', Validators.required]
    });
  }

  ngOnInit(): void {
    this.route.paramMap.subscribe(params => {
      this.productId = params.get('id');
      this.isEditMode = !!this.productId;
      
      if (this.isEditMode && this.productId) {
        this.loadProductForEdit();
      }
    });
    this.loadCategories();
  }

  loadProductForEdit(): void {
    this.loading = true;
    this.productService.getProductById(this.productId!).subscribe({
      next: (product) => {
        this.productForm.patchValue({
          name: product.name,
          description: product.description,
          imageUrl: product.imageUrl,
          categoryId: product.category.id
        });
        this.loading = false;
      },
      error: (err) => {
        console.error('Error al cargar el producto', err);
        this.errorMessage = 'Error al cargar el producto: ' + err.message;
        this.loading = false;
      }
    });
  }

  loadCategories(): void {
    this.categoryService.getAllCategories().subscribe({
      next: (categories) => this.categories = categories,
      error: (err) => {
        console.error('Error al cargar las categorías', err);
        this.errorMessage = 'Error al cargar las categorías: ' + err.message;
      }
    });
  }

  onSubmit(): void {
    if (this.productForm.invalid) return;

    this.loading = true;
    this.errorMessage = '';

    if (this.isEditMode && this.productId) {
      const productData: UpdateProductDto = {
        ...this.productForm.value,
        id: this.productId
      };
      
      this.productService.updateProduct(this.productId, productData).subscribe({
        next: () => {
          this.router.navigate(['/products']);
        },
        error: (err) => {
          console.error('Error al actualizar el producto', err);
          this.errorMessage = 'Error al actualizar el producto: ' + err.message;
          this.loading = false;
        }
      });
    } else {
      const productData: CreateProductDto = this.productForm.value;
      this.productService.createProduct(productData).subscribe({
        next: () => {
          this.router.navigate(['/products']);
        },
        error: (err) => {
          console.error('Error al crear el producto', err);
          this.errorMessage = 'Error al crear el producto: ' + err.message;
          this.loading = false;
        }
      });
    }
  }

  onCancel(): void {
    this.router.navigate(['/products']);
  }
}
```

### src\app\products\product-list\product-list.component.spec.ts
```ts
import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ProductListComponent } from './product-list.component';

describe('ProductListComponent', () => {
  let component: ProductListComponent;
  let fixture: ComponentFixture<ProductListComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [ProductListComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ProductListComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

```

### src\app\products\product-list\product-list.component.ts
```ts
import { Component, OnInit, OnDestroy, effect } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { PageEvent } from '@angular/material/paginator';
import { ConfirmDialogComponent } from '../confirm-dialog/confirm-dialog.component';
import { Product } from '../models/product.model';
import { ProductService } from '../product.service';
import { AuthService } from '../../auth/auth.service';
import { ProductsStateService } from '../../core/state/products-state.service';
import { Subscription } from 'rxjs';

@Component({
  standalone: false,
  selector: 'app-product-list',
  templateUrl: './product-list.component.html',
  styleUrls: ['./product-list.component.scss']
})
export class ProductListComponent implements OnInit, OnDestroy {
  private subscriptions: Subscription = new Subscription();
  private roleEffect = effect(() => {
    const role = this.authService.roleSig();
    console.log('Rol actualizado:', role);
    this.isAdmin = role === 'Admin';
  });

  products: Product[] = [];
  totalCount = 0;
  pageSize = 10;
  pageNumber = 1;
  loading = false;
  errorMessage = '';

  isAdmin: boolean = false;

  constructor(
    private productService: ProductService,
    private authService: AuthService,
    private productsState: ProductsStateService,
    private dialog: MatDialog
  ) {}

  ngOnInit(): void {
    // Inicializar isAdmin con el valor actual
    this.isAdmin = this.authService.roleSig() === 'Admin';

    this.subscriptions.add(
      this.productsState.products$.subscribe(products => {
        this.products = products;
      })
    );

    this.subscriptions.add(
      this.productsState.loading$.subscribe(loading => {
        this.loading = loading;
      })
    );

    this.subscriptions.add(
      this.productsState.error$.subscribe(error => {
        this.errorMessage = error || '';
      })
    );

    this.subscriptions.add(
      this.productsState.pagination$.subscribe(pagination => {
        this.pageNumber = pagination.page;
        this.pageSize = pagination.pageSize;
        this.totalCount = pagination.totalCount;
      })
    );

    this.loadProducts();
  }

  ngOnDestroy(): void {
    this.subscriptions.unsubscribe();
    this.roleEffect.destroy();
  }

  loadProducts(): void {
    this.productService.getProducts(this.pageNumber, this.pageSize).subscribe();
  }

  onPageChange(event: PageEvent): void {
    this.productService.getProducts(event.pageIndex + 1, event.pageSize).subscribe();
  }

  confirmDelete(product: Product): void {
    const dialogRef = this.dialog.open(ConfirmDialogComponent, {
      width: '420px',
      data: { 
        title: 'Confirmar Eliminación', 
        message: `¿Está seguro de que desea eliminar el producto "${product.name}"?` 
      }
    });

    dialogRef.afterClosed().subscribe(result => {
      if (result) {
        this.deleteProduct(product.id);
      }
    });
  }

  private deleteProduct(id: string): void {
    this.productService.deleteProduct(id).subscribe({
      next: () => {
      },
      error: (err) => {
        console.error('Error al eliminar producto:', err);
      }
    });
  }
}
```

### src\app\products\services\category.service.ts
```ts
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from '../../../environments/environment';
import { Category } from '../models/category.model';

@Injectable({
  providedIn: 'root'
})
export class CategoryService {
  private apiUrl = `${environment.apiUrl}/categories`;

  constructor(private http: HttpClient) { }

  getAllCategories(): Observable<Category[]> {
    return this.http.get<Category[]>(this.apiUrl);
  }
}
```

### src\app\core\interceptors\auth.interceptor.spec.ts
```ts
import { TestBed } from '@angular/core/testing';
import { HttpClientTestingModule, HttpTestingController } from '@angular/common/http/testing';
import { HTTP_INTERCEPTORS, HttpClient } from '@angular/common/http';
import { AuthInterceptor } from './auth.interceptor';
import { AuthService } from '../../auth/auth.service';
import { Router } from '@angular/router';

// Mocks para los servicios
class MockAuthService {
  getToken() { return 'test-token'; }
}

class MockRouter {
  navigate = jasmine.createSpy('navigate');
}

describe('AuthInterceptor', () => {
  let httpMock: HttpTestingController;
  let httpClient: HttpClient;

  beforeEach(() => {
    TestBed.configureTestingModule({
      imports: [HttpClientTestingModule],
      providers: [
        {
          provide: HTTP_INTERCEPTORS,
          useClass: AuthInterceptor,
          multi: true
        },
        { provide: AuthService, useClass: MockAuthService },
        { provide: Router, useClass: MockRouter }
      ]
    });

    httpMock = TestBed.inject(HttpTestingController);
    httpClient = TestBed.inject(HttpClient);
  });

  afterEach(() => {
    httpMock.verify();
  });

  it('should add Authorization header with token', () => {
    httpClient.get('/test').subscribe();

    const httpRequest = httpMock.expectOne('/test');
    expect(httpRequest.request.headers.has('Authorization')).toBeTruthy();
    expect(httpRequest.request.headers.get('Authorization')).toBe('Bearer test-token');
  });
});
```

### src\app\core\interceptors\auth.interceptor.ts
```ts
import { Injectable } from '@angular/core';
import {
  HttpRequest,
  HttpHandler,
  HttpEvent,
  HttpInterceptor,
  HttpErrorResponse
} from '@angular/common/http';
import { Observable, throwError } from 'rxjs';
import { catchError } from 'rxjs/operators';
import { AuthService } from '../../auth/auth.service';
import { Router } from '@angular/router';

@Injectable()
export class AuthInterceptor implements HttpInterceptor {

  constructor(
    private authService: AuthService,
    private router: Router
  ) {}

  intercept(request: HttpRequest<unknown>, next: HttpHandler): Observable<HttpEvent<unknown>> {
    const token = this.authService.getToken();
    
    if (token) {
      request = request.clone({
        setHeaders: {
          Authorization: `Bearer ${token}`
        }
      });
    }

    return next.handle(request).pipe(
      catchError((error: HttpErrorResponse) => {
        if (error.status === 401) {
          this.authService.logout();
          this.router.navigate(['/auth/login']);
        }
        return throwError(() => error);
      })
    );
  }
}
```

### src\app\core\interceptors\loading.interceptor.spec.ts
```ts
// import { TestBed } from '@angular/core/testing';
// import { HttpInterceptorFn } from '@angular/common/http';

// import { LoadingInterceptor } from './loading.interceptor';

// describe('LoadingInterceptor', () => {
//   const interceptor: HttpInterceptorFn = (req, next) => 
//     TestBed.runInInjectionContext(() => new LoadingInterceptor(req, next));

//   beforeEach(() => {
//     TestBed.configureTestingModule({});
//   });

//   it('should be created', () => {
//     expect(interceptor).toBeTruthy();
//   });
// });

```

### src\app\core\interceptors\loading.interceptor.ts
```ts
import { Injectable } from '@angular/core';
import {
  HttpRequest,
  HttpHandler,
  HttpEvent,
  HttpInterceptor
} from '@angular/common/http';
import { Observable, finalize } from 'rxjs';
import { LoadingService } from '../services/loading.service';

@Injectable()
export class LoadingInterceptor implements HttpInterceptor {

  constructor(private loadingService: LoadingService) {}

  intercept(request: HttpRequest<unknown>, next: HttpHandler): Observable<HttpEvent<unknown>> {
    this.loadingService.show();
    
    return next.handle(request).pipe(
      finalize(() => {
        this.loadingService.hide();
      })
    );
  }
}
```

### src\app\core\services\loading.service.spec.ts
```ts
import { TestBed } from '@angular/core/testing';

import { LoadingService } from './loading.service';

describe('LoadingService', () => {
  let service: LoadingService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(LoadingService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});

```

### src\app\core\services\loading.service.ts
```ts
import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class LoadingService {
  private loadingSubject = new BehaviorSubject<boolean>(false);

  get loading$(): Observable<boolean> {
    return this.loadingSubject.asObservable();
  }

  show(): void {
    this.loadingSubject.next(true);
  }

  hide(): void {
    this.loadingSubject.next(false);
  }
}
```

### src\app\core\state\products-state.service.spec.ts
```ts
import { TestBed } from '@angular/core/testing';

import { ProductsStateService } from './products-state.service';

describe('ProductsStateService', () => {
  let service: ProductsStateService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(ProductsStateService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});

```

### src\app\core\state\products-state.service.ts
```ts
import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs'; 
import { Product } from '../../products/models/product.model';

@Injectable({
  providedIn: 'root'
})
export class ProductsStateService {
  private productsSubject = new BehaviorSubject<Product[]>([]);
  private loadingSubject = new BehaviorSubject<boolean>(false);
  private errorSubject = new BehaviorSubject<string | null>(null);
  private paginationSubject = new BehaviorSubject<{page: number, pageSize: number, totalCount: number}>({
    page: 1,
    pageSize: 10,
    totalCount: 0
  });
  
  products$ = this.productsSubject.asObservable();
  loading$ = this.loadingSubject.asObservable();
  error$ = this.errorSubject.asObservable();
  pagination$ = this.paginationSubject.asObservable();

  setProducts(products: Product[]): void {
    this.productsSubject.next(products);
  }

  setLoading(loading: boolean): void {
    this.loadingSubject.next(loading);
  }

  setError(error: string | null): void {
    this.errorSubject.next(error);
  }

  setPagination(page: number, pageSize: number, totalCount: number): void {
    this.paginationSubject.next({ page, pageSize, totalCount });
  }

  // Métodos de utilidad
  addProduct(product: Product): void {
    const currentProducts = this.productsSubject.value;
    this.productsSubject.next([...currentProducts, product]);
  }

  updateProduct(updatedProduct: Product): void {
    const currentProducts = this.productsSubject.value;
    const index = currentProducts.findIndex(p => p.id === updatedProduct.id);
    
    if (index !== -1) {
      const newProducts = [...currentProducts];
      newProducts[index] = updatedProduct;
      this.productsSubject.next(newProducts);
    }
  }

  removeProduct(productId: string): void {
    const currentProducts = this.productsSubject.value;
    const filteredProducts = currentProducts.filter(p => p.id !== productId);
    this.productsSubject.next(filteredProducts);
  }
}
```

## Archivos de Plantilla y Estilos en `src` y su Contenido

### src\index.html
```html
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>ADRTProductCatalogFrontend</title>
  <base href="/">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="icon" type="image/x-icon" href="favicon.ico">
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body class="mat-typography">
  <app-root></app-root>
</body>
</html>

```

### src\app\app.component.html
```html
<router-outlet></router-outlet>
```

### src\app\auth\login.component.html
```html
<div class="login-container">
  <mat-card>
    <mat-card-header>
      <mat-card-title>Iniciar Sesión</mat-card-title>
    </mat-card-header>
    <mat-card-content>
      <form [formGroup]="loginForm" (ngSubmit)="login()">
        <mat-form-field appearance="fill">
          <mat-label>Usuario</mat-label>
          <input matInput formControlName="username" name="username" required>
          <mat-error *ngIf="loginForm.get('username')?.hasError('required')">
            El nombre de usuario es requerido.
          </mat-error>
        </mat-form-field>

        <mat-form-field appearance="fill">
          <mat-label>Contraseña</mat-label>
          <input matInput formControlName="password" name="password" type="password" required>
          <mat-error *ngIf="loginForm.get('password')?.hasError('required')">
            La contraseña es requerida.
          </mat-error>
        </mat-form-field>

        <div *ngIf="errorMessage" class="error-message">
          {{ errorMessage }}
        </div>

        <button mat-raised-button color="primary" type="submit" [disabled]="loginForm.invalid || loading">
          <span *ngIf="!loading">Ingresar</span>
          <mat-spinner *ngIf="loading" diameter="24"></mat-spinner>
        </button>
      </form>
    </mat-card-content>
  </mat-card>
</div>
```

### src\app\home\home.component.html
```html
<div class="content">
  <h2>Inicio</h2>
  <p>Selecciona una opción en el menú.</p>
</div>

```

### src\app\layout\layout.component.html
```html
<mat-sidenav-container class="sidenav-container">
  <!-- Sidenav siempre fijo -->
  <mat-sidenav
    #drawer
    class="sidenav"
    fixedInViewport="true"
    mode="side"
    opened="true"
  >
    <mat-toolbar>Menú</mat-toolbar>
    <mat-nav-list>
      <a mat-list-item routerLink="/home">Inicio</a>
      <a mat-list-item routerLink="/products">Productos</a>

      <ng-container *ngIf="!isLoggedIn(); else loggedIn">
        <a mat-list-item routerLink="/auth/login">Login</a>
      </ng-container>
      <ng-template #loggedIn>
       <button mat-list-item (click)="onLogout()">
          Logout
        </button>
      </ng-template>
    </mat-nav-list>
  </mat-sidenav>

  <!-- Contenido principal -->
  <mat-sidenav-content>
    <mat-toolbar color="primary">
      <span>Product Catalog</span>
    </mat-toolbar>

    <!-- Aquí se renderizan las rutas -->
    <div class="main-content">
      <router-outlet></router-outlet>
    </div>
  </mat-sidenav-content>
</mat-sidenav-container>

```

### src\app\shared\components\loading-spinner\loading-spinner.component.html
```html
<div *ngIf="loadingService.loading$ | async" class="overlay">
  <mat-spinner diameter="50"></mat-spinner>
</div>
```

### src\app\products\confirm-dialog\confirm-dialog.component.html
```html
<h2 mat-dialog-title>{{ data.title }}</h2>

<mat-dialog-content>
  <p>{{ data.message }}</p>
</mat-dialog-content>

<mat-dialog-actions align="end">
  <button mat-button mat-dialog-close="false">Cancelar</button>
  <button mat-flat-button color="warn" [mat-dialog-close]="true" cdkFocusInitial>Eliminar</button>
</mat-dialog-actions>

```

### src\app\products\product-form\product-form.component.html
```html
<form [formGroup]="productForm" (ngSubmit)="onSubmit()" class="product-form">
  <h2>{{ isEditMode ? 'Editar Producto' : 'Nuevo Producto' }}</h2>
  <div class="form-header">
    <mat-icon class="form-icon" svgIcon="product"></mat-icon>
    <span>{{ isEditMode ? 'Editando Producto' : 'Nuevo Producto' }}</span>
  </div>
  <div *ngIf="errorMessage" class="error-message">
    {{ errorMessage }}
  </div>

  <div *ngIf="loading" class="loading-overlay">
    <mat-spinner diameter="50"></mat-spinner>
  </div>

  <mat-form-field appearance="outline">
    <mat-label>Nombre del Producto</mat-label>
    <input matInput formControlName="name" required>
    <mat-error *ngIf="productForm.get('name')?.hasError('required')">
      El nombre es requerido
    </mat-error>
    <mat-error *ngIf="productForm.get('name')?.hasError('maxlength')">
      Máximo 200 caracteres
    </mat-error>
  </mat-form-field>

  <mat-form-field appearance="outline">
    <mat-label>Descripcion</mat-label>
    <textarea matInput formControlName="description" rows="3" required></textarea>
    <mat-error *ngIf="productForm.get('description')?.hasError('required')">
      Una descripcion es requerida
    </mat-error>
    <mat-error *ngIf="productForm.get('description')?.hasError('maxlength')">
      Máximo 500 caracteres
    </mat-error>
  </mat-form-field>

  <mat-form-field appearance="outline">
    <mat-label>Categoria</mat-label>
    <mat-select formControlName="categoryId" required>
      <mat-option *ngFor="let category of categories" [value]="category.id">
        {{ category.name }}
      </mat-option>
    </mat-select>
    <mat-error *ngIf="productForm.get('categoryId')?.hasError('required')">
      Categoria es requerida
    </mat-error>
  </mat-form-field>

  <mat-form-field appearance="outline">
    <mat-label>Image URL (Opcional)</mat-label>
    <input matInput formControlName="imageUrl">
  </mat-form-field>

  <div class="form-actions">
    <button 
      mat-stroked-button 
      type="button"
      (click)="onCancel()"
    >
      Cancelar
    </button>
    
    <button 
      mat-raised-button 
      color="primary" 
      type="submit"
      [disabled]="productForm.invalid || loading"
    >
      {{ isEditMode ? 'Actualizar' : 'Crear' }} Producto
    </button>
  </div>
</form>
```

### src\app\products\product-list\product-list.component.html
```html
<div class="product-list-container">
  <div class="header-actions">
    <h1>Catálogo de Productos</h1>
    <button *ngIf="isAdmin" mat-raised-button color="primary" [routerLink]="['/products/create']">
      <mat-icon>add</mat-icon>
      Crear Producto
    </button>
  </div>

  <div *ngIf="loading" class="spinner-container">
    <mat-spinner></mat-spinner>
  </div>

  <div *ngIf="errorMessage" class="error-container">
    <p>{{ errorMessage }}</p>
  </div>

  <div *ngIf="!loading && !errorMessage" class="grid-container">
    <mat-card *ngFor="let product of products" class="product-card">
      <img mat-card-image [src]="product.imageUrl || 'https://via.placeholder.com/300'" alt="{{ product.name }}">
      <mat-card-header>
        <mat-card-title>{{ product.name }}</mat-card-title>
        <mat-card-subtitle>{{ product.category.name }}</mat-card-subtitle> </mat-card-header>
      <mat-card-content>
        <p>{{ product.description }}</p>
      </mat-card-content>
      <mat-card-actions *ngIf="isAdmin">
        <button mat-icon-button color="primary" [routerLink]="['/products/edit', product.id]">
          <mat-icon>edit</mat-icon>
        </button>
        <button mat-icon-button color="warn" (click)="confirmDelete(product)">
          <mat-icon>delete</mat-icon>
        </button>
      </mat-card-actions>
    </mat-card>
  </div>

  <mat-paginator
    [length]="totalCount"
    [pageSize]="pageSize"
    [pageSizeOptions]="[5, 10, 25, 100]"
    (page)="onPageChange($event)"
    aria-label="Seleccionar página de productos">
  </mat-paginator>
</div>
```

### src\styles.scss
```scss
html, body { height: 100%; }
body { margin: 0; font-family: Roboto, "Helvetica Neue", sans-serif; }
```

### src\app\app.component.scss
```scss
.spacer {
  flex: 1 1 auto;
}
```

### src\app\auth\login.component.scss
```scss
.full-width {
  width: 100%;
}

```

### src\app\home\home.component.scss
```scss
.content {
  padding: 16px;
}
```

### src\app\layout\layout.component.scss
```scss
.app-shell {
  height: 100vh;
}

.app-toolbar {
  position: sticky;
  top: 0;
  z-index: 2;
}

.app-sidenav {
  width: 260px;
}

.app-content {
  padding: 16px;
}

.app-title {
  font-weight: 600;
}

.spacer {
  flex: 1 1 auto;
}

.user-info {
  display: flex;
  align-items: center;
  gap: 16px;
  font-size: 0.9rem;

  a[mat-button] {
    display: flex;
    align-items: center;
    gap: 8px;
  }
}

@media (max-width: 959.98px) {
  .user-info > span {
    display: none;
  }
  .app-sidenav {
    width: 240px;
  }
}
```

### src\app\shared\components\loading-spinner\loading-spinner.component.scss
```scss
.overlay {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(255, 255, 255, 0.7);
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 9999;
}
```

### src\app\products\confirm-dialog\confirm-dialog.component.scss
```scss
h1 {
  color: #f44336;
  font-weight: 500;
}

button[color="warn"] {
  background-color: #f44336;
  color: white;
}
```

### src\app\products\product-form\product-form.component.scss
```scss
.product-form {
  max-width: 600px;
  margin: 2rem auto;
  padding: 1.5rem;
  background: #fff;
  border-radius: 8px;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
  position: relative;

  h2 {
    margin-bottom: 1.5rem;
    color: #333;
    text-align: center;
  }

  .loading-overlay {
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: rgba(255, 255, 255, 0.8);
    display: flex;
    justify-content: center;
    align-items: center;
    z-index: 10;
    border-radius: 8px;
  }

  mat-form-field {
    width: 100%;
    margin-bottom: 1rem;
  }

  .error-message {
    color: #f44336;
    margin-bottom: 1rem;
    text-align: center;
  }

  .form-actions {
    display: flex;
    justify-content: space-between;
    margin-top: 1.5rem;
    
    button {
      width: 48%;
    }
  }
}
```

### src\app\products\product-list\product-list.component.scss
```scss
.product-list-container {
  padding: 1rem;
}

.header-actions {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 1.5rem;

  h1 {
    margin: 0;
  }

  button {
    display: flex;
    align-items: center;
    gap: 8px;
  }
}

.spinner-container, .error-container {
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 400px;
}

.error-container {
  color: #f44336; // Material Warn color
}

.grid-container {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
  gap: 24px;
}

.product-card {
  display: flex;
  flex-direction: column;
  transition: transform 0.2s ease-in-out, box-shadow 0.2s ease-in-out;

  &:hover {
    transform: translateY(-5px);
    box-shadow: 0 8px 16px rgba(0,0,0,0.2);
  }

  img {
    height: 200px;
    object-fit: cover;
  }

  mat-card-header {
    padding-bottom: 8px;
  }

  mat-card-content {
    flex-grow: 1; // Pushes actions to the bottom
    padding-top: 0;
    color: rgba(0,0,0,0.7);
  }

  mat-card-actions {
    display: flex;
    justify-content: flex-end;
    padding: 8px 16px !important;
  }
}

mat-paginator {
  margin-top: 2rem;
  background: transparent;
}
```
