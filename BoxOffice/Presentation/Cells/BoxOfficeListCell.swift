//
//  BoxOfficeListCell.swift
//  BoxOffice
//
//  Created by 이상윤 on 2023/05/02.
//

import UIKit

class BoxOfficeListCell: UICollectionViewListCell {

    static let identifier = String(describing: BoxOfficeListCell.self)

    private let cellStackView: UIStackView = {
        let cellStack = UIStackView()
        
        return cellStack
    }()
    
    private let rankStackView: UIStackView = {
        let rankStack = UIStackView()
        
        return rankStack
    }()

    private let rank: UILabel = {
        let rankLabel = UILabel()
        
        return rankLabel
    }()
    
    private let rankVariation: UILabel = {
       let rankVariationLabel = UILabel()
        
        return rankVariationLabel
    }()
}
