//
//  MyTripsCell.swift
//  BookMyTrip
//
//  Created by Kamlesh Kumar Sharma on 16/01/25.
//
import UIKit

class MyTripCell: UITableViewCell {
    
    lazy private var destinationLabel = {
        let destinationLabel = UILabel()
        destinationLabel.font = UIFont.systemFont(ofSize: 14)
        return destinationLabel
    }()
    
    lazy private var dateLabel = {
        let dateLabel = UILabel()
        dateLabel.font = UIFont.systemFont(ofSize: 14)
        return dateLabel
    }()
    
    lazy private var travelByLabel = {
        let travelByLabel = UILabel()
        travelByLabel.font = UIFont.systemFont(ofSize: 18)
        return travelByLabel
    }()
    
    lazy private var circularView = {
        let circularView = UIView(frame: .zero)
        circularView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            circularView.widthAnchor.constraint(equalToConstant: 12),
            circularView.heightAnchor.constraint(equalToConstant: 12)
        ])
        circularView.layer.cornerRadius = 6
        return circularView
    }()
    
    lazy private var hStackView = {
        let hStackView = UIStackView()
        hStackView.axis = .horizontal
        hStackView.alignment = .center
        hStackView.spacing = 8
        hStackView.addArrangedSubview(circularView)
        hStackView.addArrangedSubview(dateLabel)
        hStackView.addArrangedSubview(travelByLabel)
        return hStackView
    }()
    
    lazy private var verticalStackView = {
        let verticalStackView = UIStackView()
        verticalStackView.axis = .vertical
        verticalStackView.alignment = .leading
        verticalStackView.addArrangedSubview(destinationLabel)
        verticalStackView.addArrangedSubview(hStackView)
        return verticalStackView
    }()
    
    lazy private var mainStackView = {
        let mainStackView = UIStackView()
        mainStackView.axis = .horizontal
        mainStackView.alignment = .top
        mainStackView.spacing = 8
        mainStackView.addArrangedSubview(verticalStackView)
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        return mainStackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpViews() {
        let mainView = UIView()
        mainView.layer.cornerRadius = 12
        mainView.layer.borderWidth = 1
        mainView.layer.borderColor = UIColor.lightGray.cgColor
        mainView.addSubview(mainStackView)
        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 12),
            mainStackView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -12),
            mainStackView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 12),
            mainStackView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -12)
        ])
        mainView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(mainView)
        NSLayoutConstraint.activate([
            mainView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            mainView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            mainView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 6),
            mainView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -6)
        ])
    }
    
    func configure(trip: Trip) {
        destinationLabel.text = trip.destination
        dateLabel.text = trip.date
        circularView.backgroundColor = trip.reservation == nil ? .red : .green
        travelByLabel.text = trip.travelBy
        self.layoutIfNeeded()
    }
}
