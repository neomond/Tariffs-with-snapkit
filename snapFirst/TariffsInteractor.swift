//
//  TariffsInteractor.swift
//  snapFirst
//
//  Created by Nazrin Atayeva on 21.01.24.
//

import Foundation

//Step 3: Define the Interactor  - like data store
protocol TariffsBusinessLogic {
    func fetchTariffs()
}

class TariffsInteractor: TariffsBusinessLogic {
    var presenter: TariffsPresentationLogic?
    
    func fetchTariffs() {
        // Simulating data fetching
        let tariffs = [
            Tariff(name: "Klass 5", price: 5.00, countryMinutes: 100, onNetMinutes: nil, offNetMinutes: nil, internetGB: 0.5),
            Tariff(name: "Klass 3", price: 2.00, countryMinutes: 50, onNetMinutes: nil, offNetMinutes: nil, internetGB: 0.5),
            Tariff(name: "Klass 2", price: 1.00, countryMinutes: 20, onNetMinutes: nil, offNetMinutes: nil, internetGB: 0.5),
        ]
        presenter?.presentTariffs(tariffs: tariffs)
    }
}
