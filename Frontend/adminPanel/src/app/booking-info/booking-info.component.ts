import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-booking-info',
  standalone: true,
  imports: [FormsModule, CommonModule],
  templateUrl: './booking-info.component.html',
  styleUrl: './booking-info.component.css'
})
export class BookingInfoComponent implements OnInit {
  classrooms: any[] = [];
  bookings: any[] = [];

  constructor(private http: HttpClient) { }

  ngOnInit(): void {
    this.fetchClassrooms();
    this.fetchBookings();
  }

  fetchClassrooms(): void {
    this.http.get<any[]>('/api/classrooms').subscribe(classrooms => {
      this.classrooms = classrooms;
    });
  }

  fetchBookings(): void {
    this.http.get<any[]>('/api/bookings').subscribe(bookings => {
      this.bookings = bookings;
    });
  }

  addClassroom(classroom: any): void {
    this.http.post('/api/classrooms', classroom).subscribe(() => {
      this.fetchClassrooms();
    });
  }

  deleteBooking(bookingId: number): void {
    this.http.delete(`/api/bookings/${bookingId}`).subscribe(() => {
      this.fetchBookings();
    });
  }
}
