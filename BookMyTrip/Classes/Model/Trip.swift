//
//  Trip.swift
//  BookMyTrip
//
//  Created by Kamlesh Kumar Sharma on 16/01/25.
//

import Foundation

struct TripResponse : Decodable {
    let trips: [Trip]?
}

struct Trip: Decodable {
    let id: Int
    let destination, travelBy, date: String?
    let reservation: Reservation?
}

struct Reservation: Decodable {
    let id: Int
    let hotelName,stayFrom, stayTo: String?
    let totalCost: Int?
}
