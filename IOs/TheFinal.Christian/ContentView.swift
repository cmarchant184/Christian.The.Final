//
//  ContentView.swift
//  TheFinal.Christian
//
//  Created by Christian  on 5/14/24.
//

import SwiftUI

struct ContentView: View {
    // Add necessary properties for room booking
    var room: String = ""
    @State private var roomPurpose = ""
    @State private var renterName = ""
    
    @State private var bookingDate = Date()
    @State private var checkoutDate = Date()
    
    // Toggle variables to control date picker visibility
    @State private var isBookingDatePickerVisible = false
    @State private var isCheckoutDatePickerVisible = false
    
    var body: some View {
        VStack {
            
            Text("\(room)")
                .font(.system(size: 40))
                .padding(.bottom)
            
            // Add room booking form components
            TextField("Room Purpose", text: $roomPurpose)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Your Name", text: $renterName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            // Button to select check-in date
            Button(action: {
                isBookingDatePickerVisible.toggle()
            }) {
                Text("Select Check-In Date")
            }
            .padding()
            
            // Check-in date picker
            if isBookingDatePickerVisible {
                DatePicker("", selection: $bookingDate, displayedComponents: [.date, .hourAndMinute])
                .datePickerStyle(WheelDatePickerStyle())
                .padding()
            }
            
            // Button to select check-out date
            Button(action: {
                isCheckoutDatePickerVisible.toggle()
            }) {
                Text("Select Check-Out Date")
            }
            .padding()
            
            // Check-out date picker
            if isCheckoutDatePickerVisible {
                DatePicker("", selection: $checkoutDate, displayedComponents: [.date, .hourAndMinute])
                .datePickerStyle(WheelDatePickerStyle())
                .padding()
            }
            
            // Add a button to submit the booking
            Button(action: {
                // Implement booking submission logic
                // You can handle booking submission here
            }) {
                Text("Book Room")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding()
            
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewLayout(.sizeThatFits)
    }
}
