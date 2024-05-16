import { CommonModule } from '@angular/common';
import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-room-status',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './room-status.component.html',
  styleUrls: ['./room-status.component.css']
})
export class RoomStatusComponent implements OnInit{

  roomStatuses = [
    { name: 'English Room', status: 'Booked' },
    { name: 'First Year Room', status: 'Available' },
    { name: 'Second Year Room', status: 'Booked' },
    { name: 'Ethics Room', status: 'Available' },
    { name: 'Robotics Room', status: 'Booked' }
  ];

  constructor() { }

  ngOnInit(): void {
  }
}

