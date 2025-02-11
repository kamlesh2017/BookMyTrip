//
//  MTWidgetMediumView.swift
//  BookMyTrip
//
//  Created by Kamlesh Kumar Sharma on 16/01/25.
//

import SwiftUI

struct TWMediumView: View {
    private var trips: [Trip]
    
    init(trips: [Trip]) {
        self.trips = trips
    }

    var body: some View {
        VStack(alignment:.leading) {
            Text("Upcoming trips")
                .font(Font.headline)
                .foregroundColor(Color.primary)

            ForEach(trips, id: \.id) { item in
                HStack{
                    RoundedRectangle(cornerRadius: 6)
                        .fill(item.reservation != nil ? Color.green : Color.red)
                        .frame(width: 12, height: 12)
                    Text(item.destination!).font(.callout)
                    Spacer()
                    Text(item.date!).font(.subheadline)
                        .foregroundColor(Color.secondary)

                }
                if item.id < trips.count - 1 {
                    Divider()
                }
            }
        }.padding()
    }
}
