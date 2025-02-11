//
//  HomeVC.swift
//  BookMyTrip
//
//  Created by Kamlesh Kumar Sharma on 16/01/25.
//

import UIKit

class HomeVC: UIViewController {
    lazy private var myTripButton: UIButton = {
        let button = UIButton()
        button.setTitle("Go to my trips", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 12
        button.backgroundColor = UIColor.gray
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: 48),
            button.widthAnchor.constraint(equalToConstant: 130)
        ])
        button.addTarget(self, action: #selector(myTripButtonClicked), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(myTripButton)
        NSLayoutConstraint.activate([
            myTripButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            myTripButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
    
    @objc private func myTripButtonClicked(_ sender: UIButton) {
        let vc = MyTripsVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
