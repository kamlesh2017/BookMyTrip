//
//  MyTripsVC.swift
//  BookMyTrip
//
//  Created by Kamlesh Kumar Sharma on 16/01/25.
//

import UIKit

class MyTripsVC: UIViewController {
    
    private let resource: TripResourceProtocol = TripResource()
    private var tripDetails: [Trip] = []
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MyTripCell.self, forCellReuseIdentifier: "MyTripCell")
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        self.title = "Travel list"
        self.view.backgroundColor = .white
        resource.getTripDetails { [weak self] response in
            if(response != nil && response?.trips != nil)
            {
                DispatchQueue.main.async {
                    self?.tripDetails = response?.trips ?? []
                    self?.tableView.reloadData()
                }
            }
        }
    }
    
    func setTableView() {
        self.view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -16)
        ])
    }
}

extension MyTripsVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tripDetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyTripCell") as? MyTripCell else {
            return UITableViewCell()
        }
        cell.configure(trip: tripDetails[indexPath.row])
        return cell
    }
}

extension MyTripsVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        MyTripVCRouter().start(view: self, trip: tripDetails[indexPath.row])
    }
}
