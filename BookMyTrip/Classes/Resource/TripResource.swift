//
//  TripResource.swift
//  BookMyTrip
//
//  Created by Kamlesh Kumar Sharma on 16/01/25.
//

import Foundation

protocol TripResourceProtocol {
    func getTripDetails(completionHandler: @escaping(_ result: TripResponse?)-> Void)
}

struct TripResource: TripResourceProtocol{
    func getTripDetails(completionHandler: @escaping (TripResponse?) -> Void) {
        DispatchQueue.global().async {
            sleep(1)
            let travelResponse = loadTripData()
            completionHandler(travelResponse)
        }
    }
    
    func loadTripData() -> TripResponse? {
        if let resourcePath = Bundle.main.resourcePath {
            let files = try? FileManager.default.contentsOfDirectory(atPath: resourcePath)
            debugPrint("Files in bundle: \(files ?? [])")
        }
        guard let fileURL = Bundle.main.url(forResource: "TripResponse", withExtension: "json") else {
            debugPrint("File not found")
            return nil
        }
        
        do {
            let data = try Data(contentsOf: fileURL)
            let tripResponse = try JSONDecoder().decode(TripResponse.self, from: data)
            return tripResponse
        } catch {
            debugPrint("Error reading JSON file: \(error)")
            return nil
        }
    }
}
