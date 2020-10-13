import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';


@Injectable({
  providedIn: 'root'
})

export class UsuarioService {

  baseUrl: string;
  baseUrlPedidos: string;
  baseUrlDetalleCurso: string;

  constructor(private httpClient: HttpClient) {
    this.baseUrl = "http://localhost:8080/api/users";
    this.baseUrlPedidos = "http://localhost:8080/api/detallePedidos";
    this.baseUrlDetalleCurso = 'http://localhost:8080/api/detalleCursos';

  }


  // Crear Usuario
  createUser(formvalue) {
    return this.httpClient.post(`${this.baseUrl}/registro`, formvalue).toPromise();
  }


  // Login Usuario
  loginUser(formvalue) {
    return this.httpClient.post(`${this.baseUrl}/login`, formvalue).toPromise();
  }


  // Obtener Usuario
  getUserById(): Promise<any> {
    const httpOptions = {
      headers: new HttpHeaders({
        'user-token': localStorage.getItem('token')
      })
    }
    return this.httpClient.get(`${this.baseUrl}`, httpOptions).toPromise();
  }


  // Obtener pedidos
  getPedidosUser() {
    const httpOptions = {
      headers: new HttpHeaders({
        'user-token': localStorage.getItem('token')
      })
    }
    return this.httpClient.get(`${this.baseUrlPedidos}`, httpOptions).toPromise();
  }


  // Recuperamos informacion de pedidos cursos
  getAllDetalleCurso() {
    const httpOptions = {
      headers: new HttpHeaders({
        'user-token': localStorage.getItem('token')
      })
    }
    return this.httpClient.get(`${this.baseUrlDetalleCurso}`, httpOptions).toPromise();
  }

}
