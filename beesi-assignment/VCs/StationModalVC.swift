//
//  StationModalVC.swift
//  beesi-assignment
//
//  Created by Manan Bhatia on 02/09/24.
//

import UIKit

class StationModalVC: UIViewController {
    
    var station: Station?
    
    private let VStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 8
        return stack
    }()
    
    private let codeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    private let distanceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .systemGray
        return label
    }()
    
    private let timingsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .left
        return label
    }()
    
    private let platformLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .systemBlue
        label.textAlignment = .center
        label.widthAnchor.constraint(equalToConstant: 60).isActive = true
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupView()
        
        guard let station = station else { return }
        configure(station: station)
    }
    
    
    private func setupView() {
        view.addSubview(VStack)
        VStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            VStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            VStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            VStack.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75)
        ])
        
        VStack.addArrangedSubview(codeLabel)
        VStack.addArrangedSubview(nameLabel)
        VStack.addArrangedSubview(distanceLabel)
        VStack.addArrangedSubview(timingsLabel)
        VStack.addArrangedSubview(platformLabel)
    }
    
    private func configure(station: Station) {
        codeLabel.text = station.code
        nameLabel.text = station.name
        distanceLabel.text = station.distance
        timingsLabel.text = station.timings
        platformLabel.text = station.platform
    }

}
