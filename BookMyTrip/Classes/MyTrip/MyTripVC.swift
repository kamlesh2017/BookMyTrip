//
//  MyTripVC.swift
//  BookMyTrip
//
//  Created by Kamlesh Kumar Sharma on 16/01/25.
//

import UIKit

class MyTripVCRouter {
    func start(view: UIViewController ,trip: Trip) {
        guard let vc = UIStoryboard(name: "Trips", bundle: .main).instantiateViewController(withIdentifier: "MyTripVC") as? MyTripVC else {
            return
        }
        vc.trip = trip
        view.navigationController?.pushViewController(vc, animated: true)
    }
}

class MyTripVC: UIViewController {
    
    @IBOutlet weak var lDate: UILabel!
    @IBOutlet weak var lDestination: UILabel!
    @IBOutlet weak var lTravelBy: UILabel!
    @IBOutlet weak var lHotel: UILabel!
    
    var trip: Trip!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUI()
        self.configureViews()
    }
    
    private func setUI() {
        self.view.backgroundColor = .white
    }
    
    func configureViews() {
        lDate.text = "Trip date: \(trip.date ?? "")"
        lDestination.text = "Destination: \(trip.destination ?? "")"
        lTravelBy.text = "Travel By: \(trip.travelBy ?? "")"
        if let hotelName = trip.reservation?.hotelName {
            lHotel.text = "Hotel: \(hotelName)"
        } else {
            lHotel.text = "Hotel is not booked yet!"
            lHotel.textColor = .red
        }
    }
}
