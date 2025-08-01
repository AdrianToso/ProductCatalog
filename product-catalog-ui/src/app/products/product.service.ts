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
  private apiUrl = environment.apiUrl;

  constructor(private http: HttpClient) { }

  getProducts(pageNumber: number, pageSize: number): Observable<PaginatedResult<Product>> {
    let params = new HttpParams()
      .set('pageNumber', pageNumber.toString())
      .set('pageSize', pageSize.toString());

    return this.http.get<PaginatedResult<Product>>(`${this.apiUrl}/products`, { params })
      .pipe(
        catchError(this.handleError)
      );
  }

  createProduct(product: CreateProductDto): Observable<Product> {
    return this.http.post<Product>(`${this.apiUrl}/products`, product)
      .pipe(
        catchError(this.handleError)
      );
  }

  getProductById(id: string): Observable<Product> {
    return this.http.get<Product>(`${this.apiUrl}/products/${id}`)
      .pipe(
        catchError(this.handleError)
      );
  }

  updateProduct(id: string, product: UpdateProductDto): Observable<Product> {
    const payload = { ...product, id };
    return this.http.put<Product>(`${this.apiUrl}/products/${id}`, payload)
      .pipe(
        catchError(this.handleError)
      );
  }

  deleteProduct(id: string): Observable<void> {
    return this.http.delete<void>(`${this.apiUrl}/products/${id}`)
      .pipe(
        catchError(this.handleError)
      );
  }

  private handleError(error: any) {
    console.error('API Error:', error);
    let errorMessage = 'An error occurred';
    
    if (error.error instanceof ErrorEvent) {
      errorMessage = `Error: ${error.error.message}`;
    } else {
      errorMessage = `Error Code: ${error.status}\nMessage: ${error.message}`;
      
      if (error.error && typeof error.error === 'object') {
        errorMessage += `\nDetails: ${JSON.stringify(error.error)}`;
      }
    }
    return throwError(() => new Error(errorMessage));
  }
}