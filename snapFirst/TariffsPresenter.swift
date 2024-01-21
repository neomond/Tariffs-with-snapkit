//
//  TariffsPresenter.swift
//  snapFirst
//
//  Created by Nazrin Atayeva on 21.01.24.
//

import UIKit


//Step 4: Setup the Presenter
protocol TariffsPresentationLogic {
    func presentTariffs(tariffs: [Tariff])
}

class TariffsPresenter: TariffsPresentationLogic {
    weak var viewController: TariffsDisplayLogic?

    func presentTariffs(tariffs: [Tariff]) {
           DispatchQueue.main.async {
               self.viewController?.displayTariffs(viewModel: tariffs)
           }
       }
}
