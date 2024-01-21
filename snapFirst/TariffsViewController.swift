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
    
    private let tableView: UITableView = {
        let table = UITableView()
        // Register your cell class
        table.register(UITableViewCell.self, forCellReuseIdentifier: "TariffCell")
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVIPCycle()
        setupUI()
        interactor?.fetchTariffs()
        
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
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
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
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        let tariff = tariffs[indexPath.row]
        // Configure your cell
        return cell
    }
}

extension TariffsViewController: UITableViewDelegate {
    // Implement delegate methods if needed
}


//Step 3: Define the Interactor
protocol TariffsBusinessLogic {
    func fetchTariffs()
}

class TariffsInteractor: TariffsBusinessLogic {
    var presenter: TariffsPresentationLogic?

    func fetchTariffs() {
        // Simulating data fetching
        let tariffs = [
            Tariff(name: "Klass 5", price: 5.00, countryMinutes: 100, onNetMinutes: nil, offNetMinutes: nil, internetGB: 0.5),
            // Add more sample data here...
        ]
        presenter?.presentTariffs(tariffs: tariffs)
    }
}


//Step 4: Setup the Presenter
protocol TariffsPresentationLogic {
    func presentTariffs(tariffs: [Tariff])
}

class TariffsPresenter: TariffsPresentationLogic {
    weak var viewController: TariffsDisplayLogic?

    func presentTariffs(tariffs: [Tariff]) {
        viewController?.displayTariffs(viewModel: tariffs)
    }
}
