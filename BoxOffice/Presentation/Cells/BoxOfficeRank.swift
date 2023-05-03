//
//  BoxOfficeRank.swift
//  BoxOffice
//
//  Created by 이상윤 on 2023/05/02.
//

import UIKit

final class BoxOfficeRank: UIStackView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configuration()
        configurationOfComponents()
    }

    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private let subStackView: UIStackView = {
        let subStackView = UIStackView()
        subStackView.axis = .horizontal
        subStackView.distribution = .fillEqually
        return subStackView
    }()

    private let rank: UILabel = {
        let rankLabel = UILabel()
        rankLabel.font = .boldSystemFont(ofSize: 20)
        rankLabel.textColor = .black
        rankLabel.sizeToFit()
        return rankLabel
    }()

    private lazy var rankEmoji: UIImageView = {
        let rankEmoji = UIImageView()
        rankEmoji.sizeToFit()
        return rankEmoji
    }()

    private let rankVariation: UILabel = {
        let rankVariationLabel = UILabel()
        rankVariationLabel.sizeToFit()
        return rankVariationLabel
    }()

    private func configuration() {
        axis = .vertical
        spacing = 8
        alignment = .center
        distribution = .equalSpacing
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: 100).isActive = true
        backgroundColor = .green
    }

    private func configurationOfComponents() {
        addArrangedSubview(rank)
        addArrangedSubview(subStackView)
        subStackView.addArrangedSubview(rankEmoji)
        subStackView.addArrangedSubview(rankVariation)
    }
}

extension BoxOfficeRank {
    func setRank(by text: String) {
        rank.text = text
    }
    
    func setRankVariation(by text: String) {
        rankVariation.text = text
    }

    func setRankVaritaion(by color: UIColor) {
        rankVariation.textColor = color
    }

    func setRankVariation(by emoji: UIImage) {
        rankEmoji.image = emoji
    }
}
