//
//  BoxOfficeListCell.swift
//  BoxOffice
//
//  Created by 이상윤 on 2023/05/02.
//

import UIKit

class BoxOfficeListCell: UICollectionViewListCell {

    static let identifier = String(describing: BoxOfficeListCell.self)
    
    private lazy var listContentView = UIListContentView(configuration: defaultListContentConfiguration())
    private let boxOfficeBrief = BoxOfficeBrief()
    private let boxOfficeRank = BoxOfficeRank()
    

    private func defaultListContentConfiguration() -> UIListContentConfiguration {
        return .subtitleCell()
    }
    
    private func setupViewsIfNeeded() {
        contentView.addSubview(boxOfficeBrief)
        contentView.addSubview(boxOfficeRank)
        
        listContentView.translatesAutoresizingMaskIntoConstraints = false
        let defaultHorizontalCompressionResistance = listContentView.contentCompressionResistancePriority(for: .horizontal)
        listContentView.setContentCompressionResistancePriority(defaultHorizontalCompressionResistance - 1,
                                                                for: .horizontal)
        
        NSLayoutConstraint.activate([
            listContentView.topAnchor.constraint(equalTo: contentView.topAnchor),
            listContentView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            listContentView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            listContentView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    func setupAllUIComponents() {
        boxOfficeBrief.setMovieName(by: "스즈메의 문단속")
        boxOfficeBrief.setAudienceCount(by: "오늘 x명 / 총 x")
        
        boxOfficeRank.setRankVariation(by: "1")
        guard let image = UIImage(systemName: "arrowtriangle.up.fill") else { return }
        boxOfficeRank.setRankVariation(by: image)
        boxOfficeRank.setRankVaritaion(by: .red)
        
    }
    
    override func updateConfiguration(using state: UICellConfigurationState) {
        setupViewsIfNeeded()
        setupAllUIComponents()
        
        var content = defaultListContentConfiguration().updated(for: state)
    }
}
