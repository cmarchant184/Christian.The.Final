import { RouterModule, Routes } from '@angular/router';
import { BookingInfoComponent } from './booking-info/booking-info.component';
import { RoomStatusComponent } from './room-status/room-status.component';
import { NgModule } from '@angular/core';

export const routes: Routes = [
    { path: 'booking-info', component: BookingInfoComponent },
    { path: 'room-status', component: RoomStatusComponent },
// { path: '**', redirectTo: '/booking-info' }
];


