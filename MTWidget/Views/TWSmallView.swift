//
//  MTWidgetSmallView.swift
//  BookMyTrip
//
//  Created by Kamlesh Kumar Sharma on 16/01/25.
//

import SwiftUI

struct TWSmallView: View {
    
    private var trip: Trip

    init(trip: Trip) {
        self.trip = trip
    }

    var body: some View {
        
        VStack(alignment: .leading, spacing: 10) {
            Text("Upcoming trips")
                .font(Font.headline)
                .foregroundColor(Color.primary)

            Text(trip.date!).font(.subheadline)
                .foregroundColor(Color.secondary)

            HStack{
                RoundedRectangle(cornerRadius: 6)
                    .fill(trip.reservation != nil ? Color.green : Color.red)
                    .frame(width: 12, height: 12)
                Text(trip.destination!).font(.headline)
            }
        }
    }
}
