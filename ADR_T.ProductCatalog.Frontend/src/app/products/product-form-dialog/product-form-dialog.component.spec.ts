import { ComponentFixture, TestBed } from '@angular/core/testing';
import { ReactiveFormsModule } from '@angular/forms';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { of } from 'rxjs';
import { ProductFormDialogComponent } from './product-form-dialog.component';
import { ProductService } from '../product.service';
import { CategoryService } from '../services/category.service';
import { MaterialModule } from '../../shared/material.module';
import { NoopAnimationsModule } from '@angular/platform-browser/animations';

describe('ProductFormDialogComponent', () => {
  let component: ProductFormDialogComponent;
  let fixture: ComponentFixture<ProductFormDialogComponent>;
  let mockProductService: ProductService;
  let mockCategoryService: CategoryService;
  let mockDialogRef: MatDialogRef<ProductFormDialogComponent>;

  beforeEach(async () => {
    // Se crean los mocks de los servicios usando objetos y jest.fn()
    const productServiceMock = {
      createProduct: jest.fn(),
      updateProduct: jest.fn()
    };
    const categoryServiceMock = {
      getAllCategories: jest.fn().mockReturnValue(of([])) // Se configura el mock directamente
    };
    const dialogRefMock = {
      close: jest.fn()
    };

    await TestBed.configureTestingModule({
      imports: [
        ReactiveFormsModule,
        MaterialModule,
        NoopAnimationsModule
      ],
      declarations: [ProductFormDialogComponent],
      providers: [
        { provide: ProductService, useValue: productServiceMock },
        { provide: CategoryService, useValue: categoryServiceMock },
        { provide: MatDialogRef, useValue: dialogRefMock },
        { provide: MAT_DIALOG_DATA, useValue: {} }
      ]
    }).compileComponents();

    fixture = TestBed.createComponent(ProductFormDialogComponent);
    component = fixture.componentInstance;
    mockCategoryService = TestBed.inject(CategoryService); // Se inyecta el mock para verificarlo
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });

  it('should load categories on init', () => {
    expect(mockCategoryService.getAllCategories).toHaveBeenCalled();
  });
});