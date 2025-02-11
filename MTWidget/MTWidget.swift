//
//  MTWidget.swift
//  MTWidget
//
//  Created by Kamlesh Kumar Sharma on 16/01/25.
//

import WidgetKit
import SwiftUI

struct MTWidgetEntryView : View {
    var entry: Provider.Entry

    @Environment(\.widgetFamily) var family

    @ViewBuilder
    var body: some View {
        Link(destination: URL(string: "BMT://screen/myTrips")!) {
            switch family {
            case .systemSmall:
                TWSmallView(trip: entry.trips.first!)

            case .systemMedium:
                TWMediumView(trips: entry.trips)

            default:
                fatalError()
            }
        }
    }
}

struct MTWidget: Widget {
    let kind: String = "MTWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(iOS 17.0, *) {
                MTWidgetEntryView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
            } else {
                MTWidgetEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .configurationDisplayName("Book My Trip Widget")
        .description("This is an example widget.")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}

#Preview(as: .systemSmall) {
    MTWidget()
} timeline: {
    TripEntry.mockTripEntry()
}
