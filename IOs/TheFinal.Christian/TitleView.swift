//
//  TitleView.swift
//  TheFinal.Christian
//
//  Created by Christian  on 5/14/24.
//

import SwiftUI

struct TitleView: View {
    var body: some View {
            VStack {
                Text("NWKTC Room Booking App")
                    .font(.system(size: 50))
                    .fontWeight(.bold)
                    .padding()
                
                Button(action: {
                    // Navigate to the room booking page
                    // You can implement navigation logic here
                }) {
                    Text("Book Now!")
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()
                
            }
        }
    }

#Preview {
    TitleView()
}
