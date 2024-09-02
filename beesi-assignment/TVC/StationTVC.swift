//
//  StationTVC.swift
//  beesi-assignment
//
//  Created by Manan Bhatia on 31/08/24.
//

import UIKit

class StationTVC: UITableViewCell {
    
    static let resuse = "StationCell"
    
    private let mainHStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 12
        return stack
    }()
    
    private let secHStack: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .equalCentering
        stack.axis = .horizontal
        return stack
    }()
    
    private let secBorderedHStack = BorderedStackView(axis: .horizontal, distribution: .equalCentering)
    
    private let trainDetailVStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        return stack
    }()
    
    private let stationDetailVStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        return stack
    }()
    
    private let platformHStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.layer.borderColor = UIColor.systemBlue.cgColor
        stack.layer.borderWidth = 1
        stack.layer.cornerRadius = 4
        return stack
    }()
    
    private let additionalInfoVStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        return stack
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .systemGray
        return imageView
    }()
    
    private let platformIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .white
        imageView.backgroundColor = .systemBlue
        imageView.layer.borderColor = UIColor.systemBlue.cgColor
        imageView.layer.borderWidth = 1
        imageView.layer.cornerRadius = 4
        return imageView
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
//        label.layer.borderColor = UIColor.systemBlue.cgColor
//        label.layer.borderWidth = 1
//        label.layer.cornerRadius = 4
//        label.textAlignment = .center
        label.widthAnchor.constraint(equalToConstant: 60).isActive = true
        return label
    }()
    
    private let additionalInfoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .systemGray
        return label
    }()
    
    private let additionalInfoIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .systemGray
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(mainHStack)
        mainHStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainHStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            mainHStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            mainHStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            mainHStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
        ])
        
        mainHStack.addArrangedSubview(trainDetailVStack)
        mainHStack.addArrangedSubview(iconImageView)
        mainHStack.addArrangedSubview(secBorderedHStack)
        
        secBorderedHStack.stackView.addArrangedSubview(stationDetailVStack)
        secBorderedHStack.stackView.addArrangedSubview(additionalInfoVStack)
        secBorderedHStack.addBorder(edges: [.left, .bottom], color: .systemGray, width: 2)
        
        trainDetailVStack.addArrangedSubview(codeLabel)
        trainDetailVStack.addArrangedSubview(distanceLabel)
        
        stationDetailVStack.addArrangedSubview(nameLabel)
        stationDetailVStack.addArrangedSubview(timingsLabel)
        stationDetailVStack.addArrangedSubview(platformHStack)
        
        platformHStack.addArrangedSubview(UIView()) // Spacer
        platformHStack.addArrangedSubview(platformLabel)
        platformHStack.addArrangedSubview(platformIconImageView)
        
//        additionalInfoVStack.addArrangedSubview(additionalInfoIconImageView)
        additionalInfoVStack.addArrangedSubview(additionalInfoLabel)
    }
    
    func configure(with station: Station) {
        iconImageView.image = UIImage(systemName: "clock")
        platformIconImageView.image = UIImage(systemName: "person")
        codeLabel.text = station.code
        nameLabel.text = station.name
        distanceLabel.text = station.distance
        timingsLabel.text = station.timings
        platformLabel.text = station.platform
        
        if let additionalInfo = station.additionalInfo {
            switch additionalInfo {
            case .orderFoodOnline:
                additionalInfoLabel.text = "Order Food"
                additionalInfoIconImageView.image = UIImage(named: "plate")
                additionalInfoIconImageView.sizeToFit()
                additionalInfoLabel.isHidden = false
                additionalInfoIconImageView.isHidden = false
            }
        } else {
            additionalInfoLabel.isHidden = true
            additionalInfoIconImageView.isHidden = true
        }
        
        if let isDelayed = station.isTrainDelayed, isDelayed {
            iconImageView.tintColor = .systemRed
        } else {
            iconImageView.tintColor = .systemGreen
        }
        
    }
}
