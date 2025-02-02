//
//  SectionHeaderView.swift
//  beesi-assignment
//
//  Created by Manan Bhatia on 02/09/24.
//

import UIKit

class SectionHeaderView: UITableViewHeaderFooterView {

    static let identifier = "CellHeader"
        
        private let label: UILabel = {
            let label = UILabel()
            label.textColor = .label
            label.textAlignment = .left
            label.font = .systemFont(ofSize: 20, weight: .bold)
            label.text = "Error"
            return label
        }()
        
        public func configure(with title: String) {
            self.label.text = title
            self.setupUI()
        }
        
        private func setupUI() {
            let bView = UIView()
            bView.backgroundColor = .systemGray
            self.backgroundView = bView
            
            self.addSubview(label)
            label.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                label.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
                label.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            ])
        }

}
