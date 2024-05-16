//
//  StatusView.swift
//  TheFinal.Christian
//
//  Created by Christian  on 5/14/24.
//

import SwiftUI

struct RoomStatus: Decodable {
    let room: String
    let status: String
}

struct RoomStatusView: View {
    @State private var roomStatuses = [RoomStatus]()
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                ForEach(roomStatuses, id: \.room) { roomStatus in
                    NavigationLink(destination: ContentView(room: roomStatus.room)) {
                        HStack {
                            Text(roomStatus.room)
                                .padding(.trailing, 10)
                            Spacer()
                            Text(roomStatus.status)
                                .foregroundColor(roomStatus.status == "Booked" ? .red : .green)
                        }
                        .padding(.bottom, 10)
                    }
                }
                Spacer()
            }
            .padding()
            .navigationBarTitle("Room Status")
            .onAppear {
                fetchRoomStatuses()
            }
        }
    }
    
    func fetchRoomStatuses() {
        guard let url = URL(string: "http://localhost:3030/room-statuses") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decodedResponse = try JSONDecoder().decode([RoomStatus].self, from: data)
                    DispatchQueue.main.async {
                        self.roomStatuses = decodedResponse
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            } else if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }.resume()
    }
}

struct RoomStatusView_Previews: PreviewProvider {
    static var previews: some View {
        RoomStatusView()
    }
}
