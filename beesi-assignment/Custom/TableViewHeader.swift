//
//  TableViewHeader.swift
//  beesi-assignment
//
//  Created by Manan Bhatia on 02/09/24.
//

import UIKit

class TableViewHeader: UIView {
    
    static let reuse = "HeaderCell"
    
    private let data = headerMockData
    
    private let mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBlue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let VStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.textAlignment = .left
        label.textColor = .label
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .left
        label.numberOfLines = 2
        label.textColor = .secondaryLabel
        return label
    }()
    
    private let refreshButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHeader()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupHeader() {
        addSubview(mainView)
        mainView.addSubview(containerView)
        containerView.addSubview(VStack)
        
        VStack.addArrangedSubview(titleLabel)
        VStack.addArrangedSubview(subtitleLabel)
        VStack.addArrangedSubview(refreshButton)
        
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: topAnchor),
            mainView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
//            containerView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 16),
//            containerView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -16),
//            containerView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 12),
//            containerView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -12),
            
            containerView.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: mainView.centerYAnchor),
            containerView.widthAnchor.constraint(equalTo: mainView.widthAnchor, multiplier: 0.90),
            containerView.heightAnchor.constraint(equalTo: mainView.heightAnchor, multiplier: 0.75),

            
            VStack.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.5),
            VStack.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.75),
            VStack.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8),
            VStack.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            VStack.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            VStack.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8)
        ])
        
        configure(with: data)
    }
    
    func configure(with headerData: Header) {
        titleLabel.text = headerData.title
        subtitleLabel.text = headerData.subtitle
        refreshButton.setTitle(headerData.buttonText, for: .normal)
    }
}
