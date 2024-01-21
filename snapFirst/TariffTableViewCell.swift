//
//  TariffTableViewCell.swift
//  snapFirst
//
//  Created by Nazrin Atayeva on 21.01.24.
//

import UIKit
import SnapKit

class TariffTableViewCell: UITableViewCell {
    private let cardView = UIView()
    private let nameLabel = UILabel()
    private let priceLabel = UILabel()
    private let countryMinutesLabel = UILabel()
    private let internetGBLabel = UILabel()
    private let offNetMinutesLabel = UILabel()
    
    private let countryStackView = UIStackView()
    private let internetStackView = UIStackView()
    private let offNetStackView = UIStackView()
    
    private let countryTitleLabel = UILabel()
    private let internetTitleLabel = UILabel()
    private let offNetTitleLabel = UILabel()
    
    private let detailsStackView = UIStackView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCardView()
        setupViews()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        // Add your views to the cardView and set constraints using SnapKit
        cardView.addSubview(nameLabel)
        cardView.addSubview(priceLabel)
        
        // Configure additional properties and add to contentView
        setupDetailStackView(stackView: countryStackView, title: "Country", valueLabel: countryMinutesLabel)
        setupDetailStackView(stackView: internetStackView, title: "Internet", valueLabel: internetGBLabel)
        setupDetailStackView(stackView: offNetStackView, title: "Off-net", valueLabel: offNetMinutesLabel)
        nameLabel.font = .boldSystemFont(ofSize: 18)
        
        // Configure the stack view
        detailsStackView.axis = .horizontal
        detailsStackView.distribution = .equalSpacing
        detailsStackView.alignment = .center

        
        // Add labels to the stack view
        detailsStackView.addArrangedSubview(countryStackView)
        detailsStackView.addArrangedSubview(internetStackView)
        detailsStackView.addArrangedSubview(offNetStackView)
        // Add the stack view to the card view
        cardView.addSubview(detailsStackView)
        
        detailsStackView.snp.makeConstraints { make in
            make.top.equalTo(priceLabel.snp.bottom).offset(10)
            make.left.equalTo(cardView.snp.left).offset(20)
            make.right.equalTo(cardView.snp.right).offset(-20)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(cardView.snp.top).offset(10)
            make.left.equalTo(cardView.snp.left).offset(20)
            make.right.equalTo(cardView.snp.right).offset(-20)

        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(16)
            make.left.right.equalTo(nameLabel)
        }
        
    }
    
    private func setupDetailStackView(stackView: UIStackView, title: String, valueLabel: UILabel) {
           stackView.axis = .vertical
           stackView.distribution = .equalSpacing
           stackView.spacing = 2

           let titleLabel = UILabel()
           titleLabel.text = title
           titleLabel.font = .systemFont(ofSize: 12)
           titleLabel.textColor = .darkGray

           valueLabel.font = .systemFont(ofSize: 14)
           valueLabel.textColor = .black

           stackView.addArrangedSubview(titleLabel)
           stackView.addArrangedSubview(valueLabel)
       }
    
    private func setupCardView() {
        // Add the cardView to the cell's contentView and set it up
        contentView.addSubview(cardView)
        cardView.backgroundColor = .white
        cardView.layer.cornerRadius = 16
        cardView.layer.shadowColor = UIColor.black.cgColor
        cardView.layer.shadowOpacity = 0.1
        cardView.layer.shadowOffset = CGSize(width: 0, height: 2)
        cardView.layer.shadowRadius = 10
        cardView.layer.masksToBounds = false
        
        cardView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().offset(-8)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
    }
    
    func configureWith(tariff: Tariff) {
        nameLabel.text = tariff.name
        priceLabel.text = "\(tariff.price) $ / Monthly"
        countryMinutesLabel.text = "\(tariff.countryMinutes ?? 0) min"
        internetGBLabel.text = "\(tariff.internetGB) GB"
        offNetMinutesLabel.text = "\(tariff.offNetMinutes ?? 0) min"
    }
}

