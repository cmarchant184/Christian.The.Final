//
//  StatusView.swift
//  TheFinal.Christian
//
//  Created by Christian  on 5/14/24.
//

import SwiftUI

struct RoomStatusView: View {
    
    let roomStatuses = [
        "English Room": "Booked",
        "First Year Room": "Available",
        "Second Year Room": "Booked",
        "Robotics Room": "Available",
        "Ethics Room": "Booked"
    ]
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
//                Text("Room Status")
//                    .font(.title)
//                    .fontWeight(.bold)
//                    .padding(.bottom)
                
                ForEach(roomStatuses.sorted(by: <), id: \.key) { room, status in
                    NavigationLink(destination: ContentView(room: room)) {
                        HStack {
                            Text(room)
                                .padding(.trailing, 10)
                            Spacer()
                            Text(status)
                                .foregroundColor(status == "Booked" ? .red : .green)
                        }
                        .padding(.bottom, 10)
                    }
                }
                
                Spacer()
            }
            .padding()
            .navigationBarTitle("Room Status")
        }
    }
}

//struct RoomView: View {
//    var room: String
//    
//    var body: some View {
//        Text("Booking details for \(room)")
//    }
//}

struct RoomStatusView_Previews: PreviewProvider {
    static var previews: some View {
        RoomStatusView()
    }
}


