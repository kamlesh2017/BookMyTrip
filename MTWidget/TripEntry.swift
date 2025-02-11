//
//  Entry.swift
//  BookMyTrip
//
//  Created by Kamlesh Kumar Sharma on 16/01/25.
//

import WidgetKit

struct TripEntry: TimelineEntry {
    let date: Date
    let trips: [Trip]
    
    static func mockTripEntry() -> TripEntry {
        return TripEntry(date: Date(), trips: [Trip(id: 1, destination: "Mumbai", travelBy: "Airplane", date: "15-Jul-2024", reservation: Reservation(id: 12, hotelName: "Jasta hotel", stayFrom: "16-Jul-2024", stayTo: "10-Aug-2024", totalCost: 16000))])
    }
}
