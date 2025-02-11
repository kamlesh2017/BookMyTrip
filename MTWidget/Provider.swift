//
//  Provider.swift
//  BookMyTrip
//
//  Created by Kamlesh Kumar Sharma on 16/01/25.
//

import WidgetKit

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> TripEntry {
        return TripEntry.mockTripEntry()
    }

    func getSnapshot(in context: Context, completion: @escaping (TripEntry) -> ()) {
        completion(TripEntry.mockTripEntry())
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        TripResource().getTripDetails { (response) in
            guard let trips = response?.trips else {
                return
            }
            var topTwoTrips = [Trip]()
            for (index, trip) in trips.enumerated() {
                if index < 2 {
                    topTwoTrips.append(trip)
                } else {
                    break
                }
            }
            
            let currentDate = Date()
            let entry = TripEntry(date: currentDate, trips: topTwoTrips)
            let refreshDate = Calendar.current.date(byAdding: .minute, value: 60, to: currentDate)!
            let timeline = Timeline(entries: [entry], policy: .after(refreshDate))
            completion(timeline)
        }
    }
}
