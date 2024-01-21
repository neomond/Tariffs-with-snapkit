//
//  ViewController.swift
//  snapFirst
//
//  Created by Nazrin Atayeva on 20.01.24.
//

import UIKit
import SnapKit

protocol TariffsDisplayLogic: AnyObject {
    func displayTariffs(viewModel: [Tariff])
}

class TariffsViewController: UIViewController, TariffsDisplayLogic {
    var interactor: TariffsBusinessLogic?
    let cellIdentifier = "TariffCell"
    var tariffs: [Tariff] = []
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Tariffs"
        label.font = .boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        return label
    }()
    
    private let tableView: UITableView = {
        let table = UITableView()
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVIPCycle()
        setupUI()
        interactor?.fetchTariffs()
        tableView.register(TariffTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }
    
    private func setupVIPCycle() {
        let viewController = self
        let interactor = TariffsInteractor()
        let presenter = TariffsPresenter()
        
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
    
    private func setupUI() {
        view.addSubview(titleLabel)
        view.addSubview(tableView)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.left.right.equalToSuperview().inset(20)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.edges.equalToSuperview()
        }
        
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func displayTariffs(viewModel: [Tariff]) {
        tariffs = viewModel
        tableView.reloadData()
    }
    
}

extension TariffsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tariffs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? TariffTableViewCell else {
            fatalError("Could not dequeue cell with identifier: \(cellIdentifier)")
        }
        let tariff = tariffs[indexPath.row]
        cell.configureWith(tariff: tariff)
        return cell
    }
}

extension TariffsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.layer.masksToBounds = false
        // Add shadow and other styles here if needed
    }
}





