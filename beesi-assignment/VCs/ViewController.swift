//
//  ViewController.swift
//  beesi-assignment
//
//  Created by Manan Bhatia on 28/08/24.
//

import UIKit

class ViewController: UIViewController {
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        return tableView
    }()
    
    private let stations = stationMockData
    private let headerData = headerMockData
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Virbhumi Express"
        // Do any additional setup after loading the view.
        let tableHeaderView = TableViewHeader(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 150))
        self.tableView.tableHeaderView = tableHeaderView

        setupTableView()
    }
    
    private func setupTableView() {
        tableView.register(StationTVC.self, forCellReuseIdentifier: StationTVC.resuse)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        stations.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let modal = StationModalVC()
        modal.station = stations[indexPath.row]
        navigationController?.pushViewController(modal, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: StationTVC.resuse, for: indexPath) as? StationTVC else { return UITableViewCell() }
        let data = stations[indexPath.row]
        cell.configure(with: data)
        return cell
    }
    
    
        
}

