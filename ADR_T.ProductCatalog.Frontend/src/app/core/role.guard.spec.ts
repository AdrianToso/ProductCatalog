import { TestBed } from '@angular/core/testing';
import { ActivatedRouteSnapshot, RouterStateSnapshot, Router } from '@angular/router';
import { RoleGuard } from './role.guard';
import { AuthService } from '../auth/auth.service';

describe('RoleGuard', () => {
  let guard: RoleGuard;
  let authService: AuthService;
  let router: Router;

  beforeEach(() => {
    // Se crean los mocks de los servicios usando la sintaxis de Jest
    const authServiceMock = {
      getRoles: jest.fn()
    };
    const routerMock = {
      navigate: jest.fn()
    };

    TestBed.configureTestingModule({
      providers: [
        RoleGuard,
        { provide: AuthService, useValue: authServiceMock },
        { provide: Router, useValue: routerMock }
      ]
    });

    guard = TestBed.inject(RoleGuard);
    authService = TestBed.inject(AuthService);
    router = TestBed.inject(Router);
  });

  it('should allow access for Admin role', () => {
    // Se configura el mock para que devuelva un valor específico
    (authService.getRoles as jest.Mock).mockReturnValue(['Admin']);
    
    const route = { data: { expectedRoles: ['Admin', 'Editor'] } } as unknown as ActivatedRouteSnapshot;
    const state = {} as RouterStateSnapshot;

    // Se usan los matchers de Jest
    expect(guard.canActivate(route, state)).toBe(true);
  });

  it('should allow access for Editor role', () => {
    (authService.getRoles as jest.Mock).mockReturnValue(['Editor']);
    
    const route = { data: { expectedRoles: ['Admin', 'Editor'] } } as unknown as ActivatedRouteSnapshot;
    const state = {} as RouterStateSnapshot;

    expect(guard.canActivate(route, state)).toBe(true);
  });

  it('should deny access for User role', () => {
    (authService.getRoles as jest.Mock).mockReturnValue(['User']);
    
    const route = { data: { expectedRoles: ['Admin', 'Editor'] } } as unknown as ActivatedRouteSnapshot;
    const state = {} as RouterStateSnapshot;

    expect(guard.canActivate(route, state)).toBe(false);
    expect(router.navigate).toHaveBeenCalledWith(['/home']);
  });
});