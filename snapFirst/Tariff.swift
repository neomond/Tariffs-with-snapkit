//
//  TariffModel.swift
//  snapFirst
//
//  Created by Nazrin Atayeva on 21.01.24.
//

import Foundation

struct Tariff {
    let name: String
    let price: Double
    let countryMinutes: Int?
    let onNetMinutes: Int?
    let offNetMinutes: Int?
    let internetGB: Double
}
